import 'dart:io';
import 'package:craftshubapp/components/my_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final ImagePicker _picker = ImagePicker();
  XFile? image;

  @override
  void initState() {
    super.initState();
    loadImage();
  }

  // Load image from shared preferences
  Future<void> loadImage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? savedImagePath = prefs.getString('profile_picture_path');
    if (savedImagePath != null) {
      setState(() {
        image = XFile(savedImagePath);
      });
    }
  }

  // Method to handle image picking
  Future<void> pickImage() async {
    final XFile? selectedImage = await _picker.pickImage(source: ImageSource.camera);
    if (selectedImage != null) {
      final Directory directory = await getApplicationDocumentsDirectory();
      final path = directory.path;
      final File newImage = File('$path/profile_picture.png');
      await selectedImage.saveTo(newImage.path);

      // Save the image path in shared preferences
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('profile_picture_path', newImage.path);

      setState(() {
        image = XFile(newImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (user != null) ...[
              if (image != null) ...[
                CircleAvatar(
                  radius: 60,
                  backgroundImage: FileImage(File(image!.path)),
                  backgroundColor: Colors.transparent,
                ),
                const SizedBox(height: 20),
              ],
              Text('Email: ${user.email}', style: const TextStyle(fontSize: 16, color: Colors.black)),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: pickImage,
                child: const Text(
                  'Capture Profile Picture',
                  style: TextStyle(color: Colors.black),
                  ),
              ),
            ],
            const SizedBox(height: 20),
            OutlinedButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Navigator.pushNamed(context, '/login_page');
              },
              child: const Text('Log Out', style: TextStyle(color: Colors.black)),
            ),
          ],
        ),
      ),
      bottomNavigationBar: MyNavigationBar(
        selectedIndex: 3,
        onItemSelected: (int index) {
          if (index == 0) {
            Navigator.pushNamed(context, '/shop_page');
          } else if (index == 1) {
            Navigator.pushNamed(context, '/cart_page');
          } else if (index == 2) {
            Navigator.pushNamed(context, '/settings_page');
          } else if (index == 3) {
            Navigator.pushNamed(context, '/intro_page');
          }
        },
      ),
    );
  }
}
