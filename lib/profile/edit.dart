import 'package:flutter/material.dart';
import 'package:babelbots/services/services.dart';
import 'package:babelbots/shared/shared.dart';

class EditScreen extends StatefulWidget {
  final MapEntry<String, String> detail;
  final String userId;

  const EditScreen({super.key, required this.detail, required this.userId});

  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.detail.value);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _saveAndUpdate() async {
    String updatedValue = _controller.text;

    // Use the mapping to get the correct Firestore field name
    String? firestoreFieldName = MAPPING_APP_FIELD_TO_FS_FIELD[widget.detail.key];
    if (firestoreFieldName != null) {
      Map<String, dynamic> updatedValues = {firestoreFieldName: updatedValue};

      // Call the FirestoreService to update the user data
      try {
        await FirestoreService().updateUserDetails(widget.userId, updatedValues);
        Navigator.pop(context, true); // Optionally pass 'true' to indicate success
      } catch (e) {
        // Handle exceptions
        print('Error updating user data: $e');
      }
    } else {
      // Handle the case where the mapping is not found
      print('Field mapping not found for ${widget.detail.key}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit ${widget.detail.key}', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          TextButton(
            onPressed: _saveAndUpdate,
            child: Text('Save', style: TextStyle(color: Colors.black)),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: TextField(
          controller: _controller,
          decoration: InputDecoration(labelText: 'Enter ${widget.detail.key}'),
        ),
      ),
    );
  }
}
