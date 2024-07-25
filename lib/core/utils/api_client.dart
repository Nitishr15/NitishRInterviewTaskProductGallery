import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiClient {
  static const String _baseUrl =
      'https://mocki.io/v1/04c003ee-2517-44eb-aaf2-9f8505ea86bd';

  Future<List<dynamic>> fetchProducts() async {
    final response = await http.get(Uri.parse(_baseUrl));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load products');
    }
  }
}
