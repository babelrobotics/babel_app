import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'settings.dart';
import 'edit_picture.dart';

import 'package:babelbots/services/services.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context, listen: true);

    Widget bannerImage = Image.asset('assets/banners/${user.banner}.png', fit: BoxFit.cover);

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Flexible(
                  flex: 3,
                  child: Stack(
                    clipBehavior: Clip.none, 
                    alignment: Alignment.bottomCenter,
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        child: bannerImage, 
                      ),
                      _buildProfilePictureWithEditIcon(context, user), 
                    ],
                  ),
                ),
                SizedBox(height: 30), 
                Text(
                  user.name,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text('${user.points} Points | Joined ${user.createdDateTime}',
                    style: Theme.of(context).textTheme.titleMedium),
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
                                borderRadius: BorderRadius.circular(10), 
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(3),
                                child: TabBar(
                                  tabs: [
                                    Tab(text: 'Badges'),
                                    Tab(text: 'Posts'),
                                  ],
                                ),
                              ),
                            ),
                            const Expanded(
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
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SettingsScreen()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfilePictureWithEditIcon(BuildContext context, User user) {
    return Positioned(
      bottom: -25, 
      child: GestureDetector(
        onTap: () => Navigator.push(
          context, 
          MaterialPageRoute(
            builder: (context) => EditPictureScreen(
              currentProfilePicture: user.avatar ?? "",
              currentBannerPicture: user.banner ?? "",
              currentBorder: user.border ?? ""
            ),
          ),
        ),
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            CircleAvatar(
              radius: 65,
              backgroundColor: Colors.white,
              child: user.avatar?.isEmpty ?? true
                  ? const CircleAvatar(radius: 63) 
                  : CircleAvatar(radius: 63, backgroundImage: NetworkImage(user.avatar)),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.blue, 
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.edit, color: Colors.white),
              padding: const EdgeInsets.all(8), 
            ),
          ],
        ),
      ),
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
      ),
    );
  }
}