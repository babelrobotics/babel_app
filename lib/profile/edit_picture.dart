import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:babelbots/shared/shared.dart';

class EditPictureScreen extends StatefulWidget {
  final String currentProfilePicture;
  final String currentBannerPicture;
  final String currentBorder;

  const EditPictureScreen({
    Key? key,
    required this.currentProfilePicture,
    required this.currentBannerPicture,
    required this.currentBorder,
  }) : super(key: key);

  @override
  _EditPictureScreenState createState() => _EditPictureScreenState();
}

class _EditPictureScreenState extends State<EditPictureScreen> {
  final ImagePicker _picker = ImagePicker();
  XFile? profileImage;
  String? bannerImage;
  String? selectedBorder;

  @override
  void initState() {
    super.initState();

    bannerImage = widget.currentBannerPicture + '.png';
    selectedBorder = widget.currentBorder + '.png';
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Edit Pictures"),
          actions: [
            IconButton(
              icon: const Icon(Icons.save),
              onPressed: () {
                //saving stuff
              },
            ),
          ],
          bottom: const TabBar(
            tabs: [
              Tab(text: "Profile"),
              Tab(text: "Banner"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildProfileTab(),
            _buildBannerTab(),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileTab() {
    return ListView(
      children: [
        Container(
          alignment: Alignment.center,
          child: Stack(
            alignment: Alignment.center,
            children: [ 
              Positioned(
                child: Image.asset(
                  'assets/banners/$bannerImage',
                  fit: BoxFit.cover,
                ),
              ),
              
              Positioned(
                child: 'circle-border.png' == selectedBorder
                  ? CircleAvatar(
                      radius: 47,
                      backgroundImage: NetworkImage(
                        widget.currentProfilePicture,
                      )
                   )
                  : Image.network(
                    widget.currentProfilePicture,
                    fit: BoxFit.cover,
                  )
              ),
              Positioned( 
                child: Image.asset(
                  'assets/borders/$selectedBorder', 
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text('Borders', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ),
        buildGridGallery(
          assetNames: BORDERS_LIST,
          basePath: 'assets/borders/',
          selectedAssetName: selectedBorder,
          onSelectAsset: (String assetName) {
            setState(() {
              selectedBorder = assetName; 
            });
          },
          context: context,
          crossAxisCount: 3, 
        ),
      ],
    );
  }


  Widget _buildBannerTab() {
    return buildGridGallery(
      assetNames: BANNERS_LIST,
      basePath: 'assets/banners/', 
      selectedAssetName: bannerImage ?? '',
      onSelectAsset: (String assetName) {
        setState(() {
          bannerImage = assetName;
        });
      },
      context: context,
      crossAxisCount: 2, 
      isBanner: true, 
    );
  }
}

Widget buildGridGallery({
  required List<String> assetNames,
  required String basePath,
  String? selectedAssetName,
  required Function(String assetName) onSelectAsset,
  required BuildContext context,
  required int crossAxisCount, 
  bool isBanner = false, 
}) {
  
  double childAspectRatio = isBanner ? 2.0 : 1.0; 

  return GridView.builder(
    shrinkWrap: true,
    physics: const ClampingScrollPhysics(),
    padding: const EdgeInsets.all(8),
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: crossAxisCount,
      crossAxisSpacing: 8,
      mainAxisSpacing: 8,
      childAspectRatio: childAspectRatio, 
    ),
    itemCount: assetNames.length,
    itemBuilder: (context, index) {
      final assetName = assetNames[index];
      final isSelected = selectedAssetName == assetName;
      return GestureDetector(
        onTap: () => onSelectAsset(assetName),
        child: GridTile(
          child: Image.asset('$basePath$assetName', fit: BoxFit.cover),
          footer: isSelected
              ? Container(
                  padding: EdgeInsets.all(4),
                  color: Colors.black45,
                  child: Icon(Icons.check_circle, color: Colors.green[700]),
                )
              : null,
        ),
      );
    },
  );
}