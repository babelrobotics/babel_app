import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:babelbots/services/services.dart';
import 'package:babelbots/shared/shared.dart';

// Import the firebase_core plugin
import 'package:firebase_core/firebase_core.dart';
import 'services/firebase_options.dart';

// Import the firebase analytics package
import 'package:firebase_analytics/firebase_analytics.dart';

import 'routes.dart';
import 'themes.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeNotifier>(
          create: (context) => ThemeNotifier(),
        ),
        // Add other providers here if needed
      ],
      child: App(),
    ),
  );
}

/// We are using a StatefulWidget such that we only create the [Future] once,
/// no matter how many times our widget rebuild.
/// If we used a [StatelessWidget], in the event where [App] is rebuilt, that
/// would re-initialize FlutterFire and make our application re-enter loading state,
/// which is undesired.
class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  /// The future is part of the state of our widget. We should not call `initializeApp`
  /// directly inside [build].
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Error initializing Firebase');
        }
        if (snapshot.connectionState == ConnectionState.done) {
          // Initialize StreamProvider for User data here
          return StreamProvider<User?>.value(
            value: FirestoreService().userStream(),
            initialData: null,
            catchError: (_, __) => null,
            child: Consumer<User?>(
              builder: (context, user, _) {
                // Check if the user data contains a theme preference and apply it
                if (user != null && user.preferences.containsKey('theme')) {
                  final themeNotifier = Provider.of<ThemeNotifier>(context, listen: false);
                  final isDarkMode = user.preferences['theme'] == 'dark';
                  themeNotifier.setDarkMode(isDarkMode);
                }
                // Proceed to build MaterialApp with Provider for ThemeNotifier
                return Consumer<ThemeNotifier>(
                  builder: (context, themeNotifier, _) {
                    return MaterialApp(
                      routes: appRoutes,
                      theme: themeNotifier.themeData,
                      // Since we're using the routes table, ensure no 'home:' is defined as mentioned earlier
                    );
                  },
                );
              },
            ),
          );
        }
        // Firebase initialization not complete, show a loader
        return CircularProgressIndicator();
      },
    );
  }
}