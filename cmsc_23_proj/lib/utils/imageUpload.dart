import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class ImageUpload extends StatefulWidget {
  final Function callback;

  const ImageUpload(this.callback, {super.key});

  @override
  State<ImageUpload> createState() => _ImageUploadState();
}

class _ImageUploadState extends State<ImageUpload> {
  Uint8List? _file;
  // bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _file == null ? ElevatedButton(
          onPressed: (){
            imageSelect(context);
            imageUpload(_file!);
          }, 
          child: Text("Upload Photo")
        ) : 
        ElevatedButton(
          onPressed: (){},
          child: Text("Photo Uploaded"),
        )
      ],
    );

  }

  imageSelect(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: Text('Select Image'),
            children: [
              SimpleDialogOption(
                padding: EdgeInsets.all(20),
                child: Text('Take a Photo'),
                onPressed: () async {
                  Navigator.of(context).pop();
                  Uint8List file = await pickImage(
                    ImageSource.camera,
                  );
                  setState(() {
                    _file = file;
                  });

                  String photoUrl = await imageUpload(_file!);
                  widget.callback(photoUrl);
                },
              ),

              SimpleDialogOption(
                padding: EdgeInsets.all(20),
                child: Text('Choose From Gallery'),
                onPressed: () async {
                  Navigator.of(context).pop();
                  Uint8List file = await pickImage(
                    ImageSource.gallery,
                  );
                  setState(() {
                    _file = file;
                  });

                  String photoUrl = await imageUpload(_file!);
                  widget.callback(photoUrl);
                },
              ),

              SimpleDialogOption(
                padding: EdgeInsets.all(20),
                child: Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),



            ],
          );
    });
  }

  pickImage(ImageSource source) async {
    final ImagePicker imagePicker = ImagePicker();
    XFile? file = await imagePicker.pickImage(source: source);
    if (file != null) {
      return await file.readAsBytes();
    }
    print("No Image Selected");
  }

  showSnackBar(String content, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(content),
      ),
    );
  }

  final FirebaseStorage _storage = FirebaseStorage.instance;
  

  Future<String> imageToStorage(Uint8List file) async {
    String id = const Uuid().v1();
    Reference ref =
    _storage.ref().child('donation_drives').child(id);

    UploadTask uploadTask = ref.putData(
        file
    );
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  Future<String> imageUpload(Uint8List file) async {
    String photoUrl = await imageToStorage(file);

    return photoUrl;
  }
}