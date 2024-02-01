import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:babelbots/services/models.dart';
import 'package:babelbots/services/firestore.dart';
import 'package:babelbots/shared/loading.dart';
import 'package:babelbots/shared/error.dart';

import 'dart:convert';

class ModulesScreen extends StatelessWidget {
  const ModulesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Module>>(
      future: FirestoreService().getModules(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingScreen();
        } else if (snapshot.hasError) {
          return Center(
            child: ErrorMessage(message: snapshot.error.toString()),
          );
        } else if (snapshot.hasData) {
          var modules = snapshot.data!;
          String modulesJson = jsonEncode(modules.map((module) => module.toJson()).toList());
          print('##modules: $modulesJson');

          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.deepPurple,
              title: const Text('Modules'),
            ),
            body: GridView.count(
              primary: false,
              padding: const EdgeInsets.all(20.0),
              crossAxisSpacing: 10.0,
              crossAxisCount: 2,
              children: modules.map((module) => Text(module.title)).toList(),
            ),
          );
        } else {
          return const Text('No topics found in Firestore. Check database');
        }
      },
    );
  }
}
