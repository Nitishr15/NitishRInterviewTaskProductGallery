import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiClient {
  static const String _baseUrl =
      'https://mocki.io/v1/f0f88710-c808-4b81-a626-022dbe47c3bd';

  Future<List<dynamic>> fetchProducts() async {
    final response = await http.get(Uri.parse(_baseUrl));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load products');
    }
  }
}
