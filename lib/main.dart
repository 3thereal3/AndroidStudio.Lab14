import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io'; // Імпортуємо для роботи з File
import 'package:flutter/services.dart'; // Імпортуємо для використання MethodChannel

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CameraScreen(),
    );
  }
}

class CameraScreen extends StatefulWidget {
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  final ImagePicker _picker = ImagePicker();
  XFile? _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Native Camera App')),
      body: Column(
        children: <Widget>[
          ElevatedButton(
            onPressed: _pickImage,
            child: Text('Take a photo'),
          ),
          if (_image != null)
            Image.file(File(_image!.path)), // Використовуємо File для зображення
          ElevatedButton(
            onPressed: _getHelloMessage,
            child: Text('Get Hello Message'),
          ),
        ],
      ),
    );
  }

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    setState(() {
      if (pickedFile != null) {
        _image = pickedFile;
      }
    });
  }

  Future<void> _getHelloMessage() async {
    const platform = MethodChannel('com.example.native_camera_app/hello');
    try {
      final String message = await platform.invokeMethod('getHelloMessage');
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: Text(message),
        ),
      );
    } on PlatformException catch (e) {
      print("Failed to get message: '${e.message}'.");
    }
  }
}
