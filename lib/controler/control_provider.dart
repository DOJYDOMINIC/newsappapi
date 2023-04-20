import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../model/apimodel.dart';

class NewsProvider extends ChangeNotifier {
  List<Article> _articles = [];

  List<Article> get articles => _articles;

  Future<void> fetchArticles() async {
    var url = Uri.parse('https://newsapi.org/v2/everything?q=apple&from=2023-04-17&to=2023-04-17&sortBy=popularity&apiKey=d18c18a219224ef78fddfefb842b1297');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      Newspaper newspaper = Newspaper.fromJson(jsonData);
      _articles = newspaper.articles;
      notifyListeners();
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}
