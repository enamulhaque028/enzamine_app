import 'dart:developer';
import 'package:aits_task/config/utils/api_list.dart';
import 'package:aits_task/model/category_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CategoryService {
  Future<CategoryModel> getCategoryData(BuildContext context) async {
    CategoryModel resp = CategoryModel(category: []);
    try {
      final response = await http.get(
        Uri.parse(ApiList.categoryUrl),
      );
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        log(response.body);
        // SharedPref().setApiResponse(response.body);
        resp = categoryModelFromJson(response.body);
        return resp;
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Data not found!")),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
      log(e.toString());
    }
    return resp;
  }
}