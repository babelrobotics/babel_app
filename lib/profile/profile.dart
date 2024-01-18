// ignore_for_file: deprecated_member_use

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
            onPressed: () {}, icon: const Icon(FontAwesomeIcons.angleLeft)),
        title: const Text(
          'Profile',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 28,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(isDark ? FontAwesomeIcons.sun : FontAwesomeIcons.moon))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(children: [
            SizedBox(
              width: 120,
              height: 120,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset("assets/lenny12.jpg")),
            ),
            const SizedBox(height: 10),
            const Text('Username...',
                style: TextStyle(
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.bold,
                    fontSize: 22)),
            const Text(
              'Joined 1997',
              style: TextStyle(fontFamily: 'Raleway'),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Edit Profile'),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    side: BorderSide.none,
                    shape: const StadiumBorder()),
              ),
            ),
            const SizedBox(height: 30),
            const Divider(),
            const SizedBox(height: 10),
            ProfileMenuWidget(
                title: "Achievements",
                icon: FontAwesomeIcons.trophy,
                onPress: () {}),
            ProfileMenuWidget(
                title: "Shop", icon: FontAwesomeIcons.shop, onPress: () {}),
            ProfileMenuWidget(
                title: "Subscription",
                icon: FontAwesomeIcons.star,
                onPress: () {}),
            const Divider(),
            const SizedBox(height: 10),
            ProfileMenuWidget(
                title: "Settings", icon: FontAwesomeIcons.cog, onPress: () {}),
            ProfileMenuWidget(
                title: "Logout",
                icon: FontAwesomeIcons.doorOpen,
                textColor: Colors.red,
                endIcon: false,
                onPress: () {}),
          ]),
        ),
      ),
    );
  }
}

class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.onPress,
    this.endIcon = true,
    this.textColor,
  });

  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Colors.blueGrey.withOpacity(0.1),
          ),
          child: const Icon(FontAwesomeIcons.trophy, color: Colors.blueGrey),
        ),
        title: const Text('Achievements',
            style: TextStyle(
                fontFamily: 'Raleway',
                fontWeight: FontWeight.w400,
                fontSize: 20)),
        trailing: Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Colors.blueGrey.withOpacity(0.1),
          ),
          child: const Icon(FontAwesomeIcons.angleRight,
              size: 18.0, color: Colors.blueGrey),
        ));
  }
}
