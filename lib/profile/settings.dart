import 'package:flutter/material.dart';
import 'package:babelbots/services/services.dart';
import 'package:babelbots/shared/shared.dart';

import 'edit.dart';

class SettingsScreen extends StatelessWidget {
  final User user;
  

  const SettingsScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    String truncatedEmail = user.email.length > 25 ? user.email.substring(0, 22) + "..." : user.email;
    Map<String, Map<String, String>> mapSection_Field_Values = {
      SETTINGS_SECTION_DETAILS: {
        DETAILS_EMAIL: truncatedEmail,
        DETAILS_NAME: user.name,
        DETAILS_SUBSCRIPTION: user.subscription
      },
      SETTINGS_SECTION_PREFERENCES: {
        "Theme": "Light",
        "PictureBorder": "Square",
        "Notifications": "Deliver Quietly",
      },
    };

    return Scaffold(
      appBar: AppBar(
        title: Text('Account', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Container(
        color: Colors.grey[200],
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: mapSection_Field_Values.entries.map((section) => buildSection(section, context)).toList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                child: const Text('Sign Out'),
                onPressed: () async {
                  await AuthService().signOut();
                  Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSection(
    MapEntry<String, Map<String, String>> section, BuildContext context) {
  final tiles = section.value.entries;

  return Container(
    margin: EdgeInsets.all(12.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (section.key != SETTINGS_SECTION_DETAILS)
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              section.key,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            children: List.generate(tiles.length, (index) {
              final isLastTile = index == tiles.length - 1;
              return buildListTile(section.value.entries.elementAt(index), context, isLastTile);
            }),
          ),
        ),
      ],
    ),
  );
}

  Widget buildListTile(MapEntry<String, String> field, BuildContext context, bool isLastTile) {
    return Column(
      
      children: [
        ListTile(
          title: Row(
            children: [
              Expanded(
                child: Text(
                  field.key, // First string on the left
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                field.value, // Second string on the right
                style: TextStyle(
                  color: Color.fromRGBO(141, 136, 136, 0.75),
                ),
              ),
            ],
          ),
          trailing: Icon(Icons.arrow_forward),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => EditScreen(detail: field)),
            );
          },
        ),

        if(!isLastTile) const Divider(height: 1, color: Colors.grey),

      ],
    );
  }
}