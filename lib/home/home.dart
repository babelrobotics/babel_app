import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

import 'package:babelbots/login/login.dart';
import 'package:babelbots/services/auth.dart';

import 'package:babelbots/about/about.dart';
import 'package:babelbots/modules/modules.dart';
import 'package:babelbots/profile/profile.dart';
import 'package:babelbots/forum/forum.dart';
import 'package:babelbots/shared/bottom_nav.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _selectedIndex = 0;

  // Function to handle tab selection
  void _onSelectTab(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _currentScreen() {
    switch (_selectedIndex) {
      case 0:
        return ModulesScreen(); 
      case 1:
        return ForumScreen(); 
      case 2:
        return ProfileScreen(); 
      case 3:
        return AboutScreen(); 
      default:
        return ModulesScreen();
    }
  }

  @override
Widget build(BuildContext context) {
  return StreamBuilder(
    stream: AuthService().userStream,
    builder: (context, snapshot) {
      // Print the entire snapshot data
      print('Snapshot data: ${snapshot.data}');

      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Center(child: Text('Loading'));
      } else if (snapshot.hasError) {
        // Print the error if any
        print('Stream error: ${snapshot.error}');
        return const Center(child: Text('Error'));
      } else if (snapshot.hasData) {
        // Additional print to check the user data if available
        print('User data: ${snapshot.data}');
        return Scaffold(
          bottomNavigationBar: BottomNavBar(
            onSelectTab: _onSelectTab,
            selectedIndex: _selectedIndex,
          ),
          body: _currentScreen(),
        );
      } else {
        return const LoginScreen();
      }
    }
  );
}

}