import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:http/http.dart';

class APIServices {
  late String country; // saving the name of lovation
  late dynamic total;
  late dynamic recovered;
  late dynamic deaths;
  late dynamic newCase;
  late dynamic active;
  late dynamic newDeath;

  // Base API headers for reponse url
  static const Map<String, String> _headers = {
    "content-type": "application/json",
    'x-rapidapi-key': '983ad3bfccmsh7cab5689bcb0158p18944ajsnbd0efd0c1d73',
    'x-rapidapi-host': 'covid-193.p.rapidapi.com'
  };

  late String endpoint;
  late String imageAsset;
  late String flag;

  APIServices(
      {required this.endpoint, required this.imageAsset, required this.flag});

  Future<void> getData() async {
    Uri uri = Uri.parse(
        'https://covid-193.p.rapidapi.com/statistics?country=$endpoint');

    // getting data from api using get method
    Response response = await http.get(uri, headers: _headers);
    if (response.statusCode == 200) {
      // convert json into map
      Map data = jsonDecode(response.body);

      // initialize variable to real data
      country = data['response'][0]['country'];
      total = data['response'][0]['cases']['total'] == null
          ? 0
          : data['response'][0]['cases']['total'];
      recovered = data['response'][0]['cases']['recovered'] == null
          ? 0
          : data['response'][0]['cases']['recovered'];
      newCase = data['response'][0]['cases']['new'] == null
          ? 0
          : int.parse(data['response'][0]['cases']['new'].substring(1));
      active = data['response'][0]['cases']['active'] == null
          ? 0
          : data['response'][0]['cases']['active'];

      deaths = data['response'][0]['deaths']['total'] == null
          ? 0
          : data['response'][0]['deaths']['total'];
      newDeath = data['response'][0]['deaths']['new'] == null
          ? 0
          : int.parse(data['response'][0]['deaths']['new'].substring(1));

      // If server returns an OK response, parse the JSON.
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load json data');
    }
  }
}
