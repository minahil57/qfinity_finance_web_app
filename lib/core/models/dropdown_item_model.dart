import 'package:qfinity/export.dart';

class DropdownItemModel extends BaseDropdownItemModel {
  const DropdownItemModel({
    required super.id,
    required super.name,
  });

  factory DropdownItemModel.fromJson(Map<String, dynamic> json) => DropdownItemModel(
        id: json['id'].toString(),
        name: json['name'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };

  factory DropdownItemModel.allItem() => const DropdownItemModel(
        id: 'All',
        name: 'All',
      );
}
