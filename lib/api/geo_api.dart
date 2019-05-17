import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

import 'package:hellp/bean/address.dart';

List<Address> parseAddresses(String res) {
  final parsed = jsonDecode(res).cast<Map<String, dynamic>>();
  return parsed.map<Address>((json) => Address.fromjson(json)).toList();
}

Future<List<Address>> fetchAddresses() async {
  const url = 'https://elm.cangdu.org/v1/pois?city_id=846&keyword=%E6%96%B0%E6%A1%A5&type=search';
  try {
    var res = await http.get(url);
    print('xxxxxx');
    return compute(parseAddresses, res.body);
  } catch (e) {
    throw e;
  }
}
