import 'package:flutter/material.dart';
import 'package:babelbots/services/services.dart';
import 'package:babelbots/shared/shared.dart';
import 'package:provider/provider.dart';

import 'edit.dart';

class SettingsScreen extends StatelessWidget {

  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context, listen: true);
    String truncatedEmail = user.email.length > 25 ? user.email.substring(0, 22) + "..." : user.email;
    String currentTheme = user.preferences.containsKey('theme') ? user.preferences['theme'] : 'light';

    Map<String, Map<String, String>> mapSection_Field_Values = {
      SECTION_DETAILS: {
        EMAIL: truncatedEmail,
        NAME: user.name,
      },
      SECTION_PREFERENCES: {
        THEME: currentTheme,
      },
    };

    return Scaffold(
      appBar: AppBar(
        title: Text('Account'),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: mapSection_Field_Values.entries.map((section) => buildSection(section, context, user.id)).toList(),
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
    MapEntry<String, Map<String, String>> section, BuildContext context, String userId) {
  final tiles = section.value.entries;

  return Container(
    margin: EdgeInsets.all(12.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (section.key != SECTION_DETAILS)
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              section.key,
            ),
          ),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            children: List.generate(tiles.length, (index) {
              final isLastTile = index == tiles.length - 1;
              return buildListTile(section.value.entries.elementAt(index), context, isLastTile, userId);
            }),
          ),
        ),
      ],
    ),
  );
}

  Widget buildListTile(MapEntry<String, String> field, BuildContext context, bool isLastTile, String userId) {
  Widget tile;

  if (THEME == field.key) {
    bool isLightThemeSelected = field.value == 'light'; // This should reflect the actual preference
    tile = SwitchListTile(
      title: const Text('Lights'), 
      value: isLightThemeSelected,
      onChanged: (bool newValue) async {
        final themeNotifier = Provider.of<ThemeNotifier>(context, listen: false);
        themeNotifier.setDarkMode(!newValue);

        String newTheme = newValue ? "light" : "dark";
        await FirestoreService().updateUserDetails(userId, {"preferences.theme": newTheme});
      },
      secondary: const Icon(Icons.lightbulb_outline), 
    );
  } else {
    tile = ListTile(
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
          ),
        ],
      ),
      trailing: Icon(Icons.arrow_forward),
      onTap: () {
        if (NAME == field.key) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => EditScreen(userId: userId, detail: field)),
          );
        }
      },
    );
  }

  return Column(
    children: [
      tile,
      if (!isLastTile) const Divider(height: 1),
    ],
  );
}

}