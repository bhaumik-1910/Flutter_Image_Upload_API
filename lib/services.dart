import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:typed_data';

class UploadApiImage {
  Future<dynamic> uploadImage(Uint8List bytes, String fileName) async {
    Uri url = Uri.parse("https://api.escuelajs.co/api/v1/files/upload");
    var request = http.MultipartRequest("POST", url);

    // Create a MultipartFile from the bytes
    var MyFile = http.MultipartFile(
      "file",
      http.ByteStream.fromBytes(bytes),
      bytes.length,
      filename: fileName,
    );

    request.files.add(MyFile);

    // Send the request and get the response
    final response = await request.send();
    if (response.statusCode == 201) {
      var data = await response.stream.bytesToString();
      return jsonDecode(data);
    } else {
      return {
        'error': 'Failed to upload image',
        'statusCode': response.statusCode
      };
    }
  }
}
