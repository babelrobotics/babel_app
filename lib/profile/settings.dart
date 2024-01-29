import 'package:flutter/material.dart';

void main() {
  runApp(Settings());
}

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SettingsPage(
        appBarLeading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}

class SettingsPage extends StatelessWidget {
  final Widget appBarLeading;

  SettingsPage({required this.appBarLeading});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Account',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: appBarLeading,
      ),
      body: Container(
        color: Colors.grey[200],
        child: Column(
          children: [
            SizedBox(height: 20),
            CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage('assets/profile_picture.jpg'),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Card(
                  elevation: 0,
                  color: Colors.white,
                  child: Column(
                    children: [
                      ListTile(
                        title: Text('Email'),
                        trailing: Icon(Icons.arrow_forward),
                        onTap: () {
                          // Handle Email
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EmailPage(),
                            ),
                          );
                        },
                      ),
                      Divider(height: 1, color: Colors.grey),
                      ListTile(
                        title: Text('Option 2'),
                        trailing: Icon(Icons.arrow_forward),
                        onTap: () {
                          // Handle Option 2
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Option2Page(),
                            ),
                          );
                        },
                      ),
                      Divider(height: 1, color: Colors.grey),
                      ListTile(
                        title: Text('Option 3'),
                        trailing: Icon(Icons.arrow_forward),
                        onTap: () {
                          // Handle Option 3
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Option3Page(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 4.0, 248.0, 0),
              child: Text(
                'App Features',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Card(
                  elevation: 0,
                  color: Colors.white,
                  child: Column(
                    children: [
                      ListTile(
                        title: Text('App Feature 1'),
                        trailing: Icon(Icons.arrow_forward),
                        onTap: () {
                          // Handle App Feature 1
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AppFeature1Page(),
                            ),
                          );
                        },
                      ),
                      Divider(height: 1, color: Colors.grey),
                      ListTile(
                        title: Text('App Feature 2'),
                        trailing: Icon(Icons.arrow_forward),
                        onTap: () {
                          // Handle App Feature 2
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AppFeature2Page(),
                            ),
                          );
                        },
                      ),
                      Divider(height: 1, color: Colors.grey),
                      ListTile(
                        title: Text('App Feature 3'),
                        trailing: Icon(Icons.arrow_forward),
                        onTap: () {
                          // Handle App Feature 3
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AppFeature3Page(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EmailPage extends StatefulWidget {
  @override
  _EmailPageState createState() => _EmailPageState();
}

class _EmailPageState extends State<EmailPage> {
  TextEditingController _emailController = TextEditingController();

  void _saveEmail() {
    // Handle email update logic here
    String newEmail = _emailController.text;
    // Update email logic goes here
    print('New Email: $newEmail');
    // You can add more logic here, such as showing a confirmation message.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Email'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          TextButton(
            onPressed: _saveEmail,
            child: Text(
              'SAVE',
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        color: Colors.grey[200],
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Current Email: user@example.com'), // change to users.
            SizedBox(height: 20),
            Card(
              elevation: 0,
              child: ListTile(
                title: TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'New Email',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Option2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Option 2'),
      ),
      body: Center(
        child: Text('Content for Option 2'),
      ),
    );
  }
}

class Option3Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Option 3'),
      ),
      body: Center(
        child: Text('Content for Option 3'),
      ),
    );
  }
}

class AppFeature1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App Feature 1'),
      ),
      body: Center(
        child: Text('Content for App Feature 1'),
      ),
    );
  }
}

class AppFeature2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App Feature 2'),
      ),
      body: Center(
        child: Text('Content for App Feature 2'),
      ),
    );
  }
}

class AppFeature3Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App Feature 3'),
      ),
      body: Center(
        child: Text('Content for App Feature 3'),
      ),
    );
  }
}
