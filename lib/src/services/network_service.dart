import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:training_flutter_krungsri/src/models/youtube_response.dart';

class NetworkService {
  static final NetworkService _networkService = NetworkService._internal();

  factory NetworkService() => _networkService;

  NetworkService._internal() {
    //todo
  }

  Future<List<Youtube>> getYoutube() async {
    final url =
        'http://codemobiles.com/adhoc/youtubes/index_new.php?username=admin&password=password&type=foods';
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final YoutubeResponse item = youtubeResponseFromJson(response.body);
      return item.youtubes;
    }
    throw Exception();
  }

  Future<void> sendTestJSON() async {
    try {
      final url = 'http://192.168.48.162:5000/api/v1/product/test';

      Map data = {'name': 'San', 'price': 899000};

      var jsonBody = json.encode(data);

      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonBody,
      );

      print(response.statusCode);
      print(response.body);
    } on Exception catch (e) {
      throw Exception();
    }
  }
}
