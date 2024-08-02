import 'package:qfinity/export.dart';

class DateTimeFilterDropdown extends BaseDropdownItemModel {
  final String text;
  final DateTime startDate;

  const DateTimeFilterDropdown._({
    required this.text,
    required this.startDate,
  }) : super(id: text, name: text);

  DateTimeFilterDropdown.last7Days()
      : this._(
          text: 'Last 7 Days',
          startDate: DateTimeHelper.last7Days,
        );

  DateTimeFilterDropdown.last30Days()
      : this._(
          text: 'Last 30 Days',
          startDate: DateTimeHelper.last30Days,
        );

  DateTimeFilterDropdown.last3Months()
      : this._(
          text: 'Last 3 Months',
          startDate: DateTimeHelper.last3Months,
        );

  DateTimeFilterDropdown.last6Months()
      : this._(
          text: 'Last 6 Months',
          startDate: DateTimeHelper.last6Months,
        );

  DateTimeFilterDropdown.lastYear()
      : this._(
          text: 'Last Year',
          startDate: DateTimeHelper.lastYear,
        );
}
