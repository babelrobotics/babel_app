import 'package:flutter/material.dart';
import 'package:babelbots/services/services.dart';
import 'package:babelbots/shared/shared.dart';

class EditScreen extends StatelessWidget {
  final MapEntry<String,String> detail;

  const EditScreen({super.key, required this.detail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit ${detail.key}', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
    );
  }
}




// class EmailPage extends StatefulWidget {
//   @override
//   _EmailPageState createState() => _EmailPageState();
// }

// class _EmailPageState extends State<EmailPage> {
//   TextEditingController _emailController = TextEditingController();

//   void _saveEmail() {
//     // Handle email update logic here
//     String newEmail = _emailController.text;
//     // Update email logic goes here
//     print('New Email: $newEmail');
//     // You can add more logic here, such as showing a confirmation message.
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Email'),
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         actions: [
//           TextButton(
//             onPressed: _saveEmail,
//             child: Text(
//               'SAVE',
//               style: TextStyle(
//                 color: Colors.green,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//         ],
//       ),
//       body: Container(
//         color: Colors.grey[200],
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text('Current Email: user@example.com'), // change to users.
//             SizedBox(height: 20),
//             Card(
//               elevation: 0,
//               child: ListTile(
//                 title: TextFormField(
//                   controller: _emailController,
//                   decoration: InputDecoration(
//                     labelText: 'New Email',
//                     border: InputBorder.none,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class Option2Page extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Option 2'),
//       ),
//       body: Center(
//         child: Text('Content for Option 2'),
//       ),
//     );
//   }
// }

// class Option3Page extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Option 3'),
//       ),
//       body: Center(
//         child: Text('Content for Option 3'),
//       ),
//     );
//   }
// }

// class AppFeature1Page extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('App Feature 1'),
//       ),
//       body: Center(
//         child: Text('Content for App Feature 1'),
//       ),
//     );
//   }
// }

// class AppFeature2Page extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('App Feature 2'),
//       ),
//       body: Center(
//         child: Text('Content for App Feature 2'),
//       ),
//     );
//   }
// }

// class AppFeature3Page extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('App Feature 3'),
//       ),
//       body: Center(
//         child: Text('Content for App Feature 3'),
//       ),
//     );
//   }
// }
