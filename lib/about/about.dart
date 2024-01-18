import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

import 'package:babelbots/services/auth.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print('##in settings screen');
    return Scaffold(
      appBar: AppBar(
        title: const Text('helow'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Sign Out'),
          onPressed: () async {
            await AuthService().signOut();
            Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
          }
        ),
      ),
    );
  }
}