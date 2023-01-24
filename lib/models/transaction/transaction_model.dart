import 'package:hive_flutter/adapters.dart';
import 'package:money_management/models/category/category_models.dart';
part 'transaction_model.g.dart';
@HiveType(typeId: 2)
class TransactionModel {
@HiveField(0)
  final String Purpose;
  @HiveField(1)
  final double amount;
  @HiveField(2)
  final DateTime date;
  @HiveField(3)
  final CategoryType type;
  @HiveField(4)
  final CategoryModel category;

  TransactionModel({
  required  this.Purpose,
   required this.amount,
   required this.date,
   required this.type,
   required this.category,
  });
}
