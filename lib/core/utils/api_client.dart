import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiClient {
  static const String _baseUrl =
      'https://mocki.io/v1/0994111b-b09c-4118-abfd-01b3a082c282';

  Future<List<dynamic>> fetchProducts() async {
    final response = await http.get(Uri.parse(_baseUrl));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load products');
    }
  }
}
