import 'dart:convert';

import 'package:codingiscaring_flutter/domain/model/film.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class FilmsRepository {
  Future<List<Film>> getNowPlaying() async {
    final url = Uri.https(dotenv.env['HOST_URL'] ?? 'not found', '3/movie/now_playing',
        {'api_key': dotenv.env['API_KEY'], 'language': dotenv.env['LANGUAGE']});

    final response = await http.get(url);
    final decodedData = json.decode(response.body);
    final films = Films.fromJsonList(decodedData['results']);
    return films.items;
  }
}
