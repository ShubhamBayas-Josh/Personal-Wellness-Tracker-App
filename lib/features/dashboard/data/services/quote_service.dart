import 'dart:convert';
import 'package:http/http.dart' as http;

class QuoteService {
  static Future<String> fetchMotivationalQuote() async {
    final url = Uri.parse('https://favqs.com/api/qotd');

    final response = await http.get(url);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final quote = json['quote']['body'];
      final author = json['quote']['author'];
      return '"$quote"\n— $author';
    } else {
      throw Exception('Failed to load quote');
    }
  }
}
