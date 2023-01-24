

import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:money_management/models/category/category_models.dart';


const CATEGORY_DB_NAME = 'category_database';

abstract class CategoryDbFunctions {
  Future<List<CategoryModel>> getCategorise();
  Future<void> insertCategory(CategoryModel value);
  Future<void>deleteCategory(String categoryID);
}

class CategoryDB implements CategoryDbFunctions {
  CategoryDB._internal();
  static CategoryDB instance = CategoryDB._internal();

  factory CategoryDB(){
    return instance;
  }

  ValueNotifier<List<CategoryModel>> incomeCategory =
  ValueNotifier([]);
  ValueNotifier<List<CategoryModel>> expenseCategory =
  ValueNotifier([]);

  @override
  Future<List<CategoryModel>> getCategorise() async {
    final _categoryDB = await Hive.openBox<CategoryModel>(CATEGORY_DB_NAME);
    return _categoryDB.values.toList();
  }

  @override
  Future<void> insertCategory(CategoryModel value) async {
    final _categoryDB = await Hive.openBox<CategoryModel>(CATEGORY_DB_NAME);
    await _categoryDB.put(value.id,value);
    refreshUI();
  }
  Future <void> refreshUI() async{
   final _allCategory = await getCategorise();
   incomeCategory.value.clear();
   expenseCategory.value.clear();
  await Future.forEach(
    _allCategory, 
    (CategoryModel Category) {
      if(Category.type == CategoryType.income){
        incomeCategory.value.add(Category);

      }else{
        expenseCategory.value.add(Category);
      }
    } 
    
    );
   incomeCategory.notifyListeners();
   expenseCategory.notifyListeners();
  }
  
  @override
  Future<void> deleteCategory(String categoryID) async {
   final _categoryDB = await Hive.openBox<CategoryModel>(CATEGORY_DB_NAME);
   await _categoryDB.delete(categoryID);
   refreshUI();
  }
}
