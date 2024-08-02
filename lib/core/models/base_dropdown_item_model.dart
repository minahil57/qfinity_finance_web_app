import 'package:qfinity/export.dart';

@immutable
class BaseDropdownItemModel extends Equatable {
  const BaseDropdownItemModel({
    required this.id,
    required this.name,
  });

  final String id;
  final String name;

  @override
  List<Object?> get props => [
        id,
        name,
      ];
}
