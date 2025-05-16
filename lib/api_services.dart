import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http_v172/product_model.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  static Future<List<Produt>> fetchProduct() async {
    const url = "https://fakestoreapi.com/products";
    try {
      final res = await http.get(Uri.parse(url));
      if (res.statusCode == 200) {
        final data = jsonDecode(res.body) as List;
        return data.map((e) => Produt.formJson(e)).toList();
      } else {
        debugPrint("Error: ${res.statusCode}");
        throw Exception("status code =! 200");
      }
    } catch (e) {
      debugPrint("Error $e");
      throw Exception("Failed to fetch data");
    }
  }

  static Future<Produt> fetchOneProduct({required int id}) async {
    final String url = "https://fakestoreapi.com/products/$id";

    try {
      final res = await http.get(Uri.parse(url));
      if (res.statusCode == 200) {
        final product = Produt.formJson(jsonDecode(res.body));
        return product;
      } else {
        throw Exception(
            "Error in res body in fetchone product ${res.statusCode}");
      }
    } catch (e) {
      debugPrint("Error: $e");
      throw Exception("Error fetching one product");
    }
  }
}
