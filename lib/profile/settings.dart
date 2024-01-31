import 'package:flutter/material.dart';
import 'package:babelbots/services/services.dart';
import 'package:babelbots/shared/shared.dart';

class Settings extends StatelessWidget {
  final User user;

  Settings({required this.user});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SettingsPage(user: user),
    );
  }
}

class SettingsPage extends StatelessWidget {
  final User user;

  SettingsPage({required this.user});

  @override
  Widget build(BuildContext context) {
    Map<String, Map<String, String>> mapSectionFieldValues = {
      SETTINGS_SECTION_DETAILS: {
        DETAILS_EMAIL: user.email,
        DETAILS_NAME: user.name,
      },
      SETTINGS_SECTION_PREFERENCES: {
        "Theme": "light",
        "PictureBorder": "square",
      },
    };

    return Scaffold(
      appBar: AppBar(
        title: Text('Account', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        color: Colors.grey,
        child: ListView(
          children: mapSectionFieldValues.entries.map((section) => buildSection(section, context)).toList(),
        ),
      ),
    );
  }

  Widget buildSection(MapEntry<String, Map<String, String>> section, BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0), // Add margin for the section
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              section.key,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
            ),
          ),
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)), // Rounded corners
            child: Column(
              children: section.value.entries.map((field) => buildListTile(field, context)).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildListTile(MapEntry<String, String> field, BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(field.key),
          subtitle: Text(field.value),
          trailing: Icon(Icons.arrow_forward),
          onTap: () {
            // Handle navigation or action
          },
        ),
        Divider(height: 1, color: Colors.grey),
      ],
    );
  }
}



class EmailPage extends StatefulWidget {
  @override
  _EmailPageState createState() => _EmailPageState();
}

class _EmailPageState extends State<EmailPage> {
  TextEditingController _emailController = TextEditingController();

  void _saveEmail() {
    // Handle email update logic here
    String newEmail = _emailController.text;
    // Update email logic goes here
    print('New Email: $newEmail');
    // You can add more logic here, such as showing a confirmation message.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Email'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          TextButton(
            onPressed: _saveEmail,
            child: Text(
              'SAVE',
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        color: Colors.grey[200],
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Current Email: user@example.com'), // change to users.
            SizedBox(height: 20),
            Card(
              elevation: 0,
              child: ListTile(
                title: TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'New Email',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Option2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Option 2'),
      ),
      body: Center(
        child: Text('Content for Option 2'),
      ),
    );
  }
}

class Option3Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Option 3'),
      ),
      body: Center(
        child: Text('Content for Option 3'),
      ),
    );
  }
}

class AppFeature1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App Feature 1'),
      ),
      body: Center(
        child: Text('Content for App Feature 1'),
      ),
    );
  }
}

class AppFeature2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App Feature 2'),
      ),
      body: Center(
        child: Text('Content for App Feature 2'),
      ),
    );
  }
}

class AppFeature3Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App Feature 3'),
      ),
      body: Center(
        child: Text('Content for App Feature 3'),
      ),
    );
  }
}
