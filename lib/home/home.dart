import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

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
    return Scaffold(
      bottomNavigationBar: BottomNavBar(
        onSelectTab: _onSelectTab,
        selectedIndex: _selectedIndex,
      ),
      body: _currentScreen(),
    );
  }
}