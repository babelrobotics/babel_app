import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print('##in about screen');
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text('helow')
      )
    );
  }
}