import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNavBar extends StatelessWidget {
  final Function(int) onSelectTab;
  final int selectedIndex;

  const BottomNavBar({
    super.key, 
    required this.onSelectTab,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            FontAwesomeIcons.robot,
            size: 20,
          ),
          label: 'Modules',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            FontAwesomeIcons.comments,
            size: 20,
          ),
          label: 'Forum',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            FontAwesomeIcons.circleUser,
            size: 20,
          ),
          label: 'Profile',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            FontAwesomeIcons.bolt,
            size: 20,
          ),
          label: 'About',
        ),
      ],
      currentIndex: selectedIndex,
      fixedColor: Colors.deepPurple[200],
      onTap: onSelectTab,
    );
  }
}