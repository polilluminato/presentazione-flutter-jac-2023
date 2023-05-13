import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_jac/models/photo.dart';
import 'package:http/http.dart' as http;

class PhotoRepository {
  PhotoRepository();

  Future<List<Photo>?> getPhotoList() async {
    var response = await http.get(
      Uri.parse(
          "${dotenv.env['PEXELS_API_URL']}/search?query=penguins&orientation=portrait&per_page=40"),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': dotenv.env['PEXELS_API_KEY']!,
      },
    );

    final responseBodyParsed = json.decode(response.body);

    return responseBodyParsed["photos"]
        .map<Photo>((json) => Photo.fromJson(json))
        .toList();
  }
}
