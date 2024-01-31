import 'package:flutter/material.dart';
import 'package:babelbots/services/services.dart';
import 'package:babelbots/shared/shared.dart';

class Settings extends StatelessWidget {
  final User user;

  Settings({required this.user});

  @override
  Widget build(BuildContext context) {
    return SettingsPage(user: user);
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
        "Free Trial": "7 Days Remaining",
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
        child: ListView(
          children: mapSectionFieldValues.entries
              .map((section) => buildSection(section, context))
              .toList(),
        ),
      ),
    );
  }

  Widget buildSection(
      MapEntry<String, Map<String, String>> section, BuildContext context) {
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
                    color: Colors.black),
              ),
            ),
          Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)), // Rounded corners
            child: Column(
              children: section.value.entries
                  .map((field) => buildListTile(field, context))
                  .toList(),
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
            // Handle navigation or action
          },
        ),
        Padding(
          padding: EdgeInsets.only(left: 18.0),
          child: Divider(height: 1, color: Colors.grey),
        ),
      ],
    );
  }
}
