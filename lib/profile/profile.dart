import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'settings.dart';

import 'package:babelbots/services/services.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);

    // Default banner image - a flat colored Container
    Widget bannerImage = user.bannerPicture?.isEmpty ?? true
        ? Container(color: Colors.grey) // Default flat color
        : Image.network(user.bannerPicture, fit: BoxFit.cover); // Network image

    // Default avatar image - a flat colored CircleAvatar
    Widget avatarImage = user.picture?.isEmpty ?? true
        ? CircleAvatar(
            radius: 63,
            backgroundColor:
                const Color.fromARGB(255, 201, 162, 162)) // Default flat color
        : CircleAvatar(
            radius: 63,
            backgroundImage: NetworkImage(user.picture)); // Network image

    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Flexible(
                flex: 3,
                child: Stack(
                  clipBehavior: Clip
                      .none, // Allows the avatar to overlap the bottom edge of the banner
                  alignment: Alignment.bottomCenter,
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      child: bannerImage, // Use the banner image widget
                    ),
                    Positioned(
                      bottom:
                          -25, // Half of the avatar's radius to hang off the bottom of the banner
                      child: CircleAvatar(
                        radius: 65,
                        backgroundColor: Colors.white,
                        child: avatarImage, // Use the avatar image widget
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                  height:
                      30), // To give some space between the avatar and the name
              Text(
                user.name,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text('${user.points} Points | Joined ${user.createdDateTime}',
                  style: Theme.of(context).textTheme.bodyMedium),
              SizedBox(height: 10),
              Flexible(
                flex: 7,
                child: DefaultTabController(
                  length: 2,
                  child: Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Column(
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              color: Colors
                                  .grey, // Grey background for the whole tab bar
                              borderRadius: BorderRadius.circular(
                                  10), // Rounded corners for the container
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: TabBar(
                                tabs: [
                                  Tab(text: 'Badges'),
                                  Tab(text: 'Posts'),
                                ],
                                indicator: BoxDecoration(
                                  color: Colors
                                      .white, // White background for the selected tab
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                indicatorSize: TabBarIndicatorSize.tab,
                              ),
                            ),
                          ),
                          Expanded(
                            child: TabBarView(
                              children: [BadgeList(), PostList()],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
              top: 20,
              right: 20,
              child: IconButton(
                  icon: Icon(Icons.settings),
                  iconSize: 35,
                  color: Colors.white,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Settings()),
                    );
                  }))
        ],
      )),
    );
  }
}

class BadgeList extends StatelessWidget {
  const BadgeList({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Looks like you've got a clean slate! Start collecting badges!",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 18,
          color: Colors.black54,
        ),
      ),
    );
  }
}

class PostList extends StatelessWidget {
  const PostList({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "A world of thoughts, yet to be penned. Break the ice with your first post!",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 18,
          color: Colors.black54,
        ),
      ),
    );
  }
}
