import 'about/about.dart';
import 'profile/profile.dart';
import 'package:babelbots/login/login.dart';
import 'modules/modules.dart';
import 'home/home.dart';
import 'forum/forum.dart';

var appRoutes = {
  '/': (context) => const HomeScreen(),
  '/login': (context) => const LoginScreen(),
  '/about': (context) => const AboutScreen(),
  '/profile': (context) => const ProfileScreen(),
  '/modules': (context) => const ModulesScreen(),
  '/forum': (context) => const ForumScreen()
};