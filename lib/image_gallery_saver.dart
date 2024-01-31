import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'dart:typed_data';
import 'package:fluttertoast/fluttertoast.dart';

class ImageGallaryServer extends StatefulWidget {
  ImageGallaryServer({required Key key}) : super(key: key);


  @override
  _ImageGallaryServerState createState() => _ImageGallaryServerState();
}

class _ImageGallaryServerState extends State<ImageGallaryServer> {
  File? _image;
  final picker = ImagePicker();

  Future<void> getImageFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future<void> _getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future<void> _saveImage() async {
    Uint8List? buffer = await _image?.readAsBytes();
    await ImageGallerySaver.saveImage(buffer!);
    _toastInfo("画像を保存しました");
  }

  Future<void> _toastInfo(String info) async {
    await Fluttertoast.showToast(msg: info, toastLength: Toast.LENGTH_LONG);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Save image to Gallery'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (_image != null) Image.file(_image!) else Container(),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FloatingActionButton(
                onPressed: getImageFromCamera,
                child: const Icon(Icons.add_a_photo),
              ),
              FloatingActionButton(
                onPressed: _getImage,
                child: const Icon(Icons.image),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                onPressed: _saveImage,
                backgroundColor: Colors.red,
                child: const Icon(Icons.save_alt),
              ),
            ],
          ),
        ],
      )),
    );
  }
}