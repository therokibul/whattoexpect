import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:whattoexpect/constants/text_strings.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  Future<void> _addImage() async {
    ImagePicker imagePicker = ImagePicker();
    // var image = await imagePicker.pickImage(source: ImageSource.gallery);
    final XFile? image =
        await imagePicker.pickImage(source: ImageSource.gallery);

//convert XFile to File
    final File imagefile = File(image!.path);
    var url = await _uploadImage(imagefile);
    _storeUrlInFirestore(url);
  }

  Future<String> _uploadImage(image) async {
    var imagePath = 'images/${DateTime.now()}.jpg';
    var storageReference = FirebaseStorage.instance.ref().child(imagePath);
    var uploadTask = storageReference.putFile(image);
    var snapshot = await uploadTask.whenComplete(() => null);
    return await snapshot.ref.getDownloadURL();
  }

  void _storeUrlInFirestore(String url) {
    FirebaseFirestore.instance
        .collection('users')
        .doc(uuid)
        .collection('images')
        .add({
      'url': url,
      'timestamp': Timestamp.now(),
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Memory'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addImage,
        child: const Icon(Icons.add),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(uuid)
            .collection('images')
            .orderBy('timestamp')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          QuerySnapshot<Map<String, dynamic>>? querySnapshot = snapshot.data;
          return GridView.builder(
            itemCount: querySnapshot!.docs.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.0,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
            ),
            itemBuilder: (context, index) {
              var document = snapshot.data!.docs[index];
              var url = document['url'];
              return Card(
                child: CachedNetworkImage(
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  imageUrl: url,
                  // child: Image.network(url)
                ),
              );
            },
          );
        },
      ),
    );
  }
}
