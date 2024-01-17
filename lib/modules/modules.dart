import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:babelbots/shared/bottom_nav.dart';

class ModulesScreen extends StatelessWidget {
  const ModulesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text(
            'about',
            style: Theme.of(context).textTheme.labelLarge
            ),
          onPressed: () => Navigator.pushNamed(context, '/about'),
        ),
      ),
    );
  }
}