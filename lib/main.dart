import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:upload_image/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: UploadImageScreen(),
    );
  }
}

class UploadImageScreen extends StatefulWidget {
  const UploadImageScreen({super.key});

  @override
  State<UploadImageScreen> createState() => _UploadImageScreenState();
}

class _UploadImageScreenState extends State<UploadImageScreen> {
  @override
  String isImageUpload = "";
  bool isLoading = false;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Upload"),
        backgroundColor: Colors.purple,
      ),
      body:Center(
        child:

        isLoading ? CircularProgressIndicator() :

        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            isImageUpload == ""
                ? SizedBox()
                : SizedBox(
                    height: 300,
                    width: 300,
                    child: Image.network(isImageUpload),
                  ),

            SizedBox(height: 30),

            ElevatedButton(
              style:
                  ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
              onPressed: () async {
                final ImagePicker picker = ImagePicker();
                final XFile? image =
                    await picker.pickImage(source: ImageSource.gallery);
                if (image != null) {
                  setState(() {
                    isLoading = true;
                  });
                  //it tack some time to upload images
                  Uint8List bytes = await image.readAsBytes();
                  UploadApiImage().uploadImage(bytes, image.name).then((value) {
                    setState(() {
                      isImageUpload = value['location'].toString();
                      isLoading = false;
                    });
                    print("Successfully image added --->${value.toString()}");
                  }).onError((error, stackTrace) {
                    setState(() {
                      isLoading = true;
                    });
                    print(error.toString());
                  });
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  "Upload Images",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
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
