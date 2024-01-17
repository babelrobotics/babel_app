import 'about/about.dart';
import 'profile/profile.dart';
import 'package:babelbots/login/login.dart';
import 'topics/topics.dart';
import 'home/home.dart';

var appRoutes = {
  '/': (context) => const HomeScreen(),
  '/login': (context) => const LoginScreen(),
  '/about': (context) => const AboutScreen(),
  '/profile': (context) => const ProfileScreen(),
  '/topics': (context) => const TopicsScreen()
};