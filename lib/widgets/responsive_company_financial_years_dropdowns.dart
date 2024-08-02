import 'package:qfinity/export.dart';

class ResponsiveCompanyFinancialYearsDropdowns extends StatelessWidget {
  const ResponsiveCompanyFinancialYearsDropdowns({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const FinancialYearDropdown(),
        MySpacing.width(12),
        const CompanySelectionDropdown(),
        MySpacing.width(12),
      ],
    );
  }
}
