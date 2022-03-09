import 'package:aits_task/model/category_model.dart';
import 'package:aits_task/service/category_service.dart';
import 'package:flutter/material.dart';

class CategoryDataProvider with ChangeNotifier {
  CategoryModel categoryData = CategoryModel(category: []);
  bool isLoading = true;

  void getGalleryData(BuildContext context) async {
    isLoading = true;
    categoryData = await CategoryService().getCategoryData(context);
    isLoading = false;
    notifyListeners();
  }
}
