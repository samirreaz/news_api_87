import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_api_87/news_model.dart';

class ApiManager {
  Future<NewsModel> getData() async {
    var client = http.Client();
    var newsModel = null;
    try {
      var url = Uri.parse(
        'https://newsapi.org/v2/everything?domains=wsj.com&apiKey=fa2266bb6b764af8816b75d85ef70762',
      );
      var response = await client.get(url);

      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);
        newsModel = NewsModel.fromJson(jsonMap);
      }
    } catch (Exception) {
      return newsModel;
    }
    return newsModel;
  }
}
