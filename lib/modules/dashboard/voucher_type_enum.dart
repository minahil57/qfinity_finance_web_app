import 'package:qfinity/export.dart';

enum VoucherType {
  billwisePayment(
    apiName: 'Billwise Payment',
    displayText: 'Billwise Payments',
    route: Routes.billwisePayment,
  ),
  purchase(
    apiName: 'Purchase',
    displayText: 'Purchase Vouchers',
    route: Routes.purchaseVoucher,
  ),
  billwiseReceipt(
    apiName: 'Billwise Receipt',
    displayText: 'Billwise Receipts',
    route: Routes.billwiseReceipt,
  ),
  payment(
    apiName: 'Payment',
    displayText: 'Payment Vouchers',
    route: Routes.paymentVoucher,
  ),
  journal(
    apiName: 'Journal',
    displayText: 'Journal Vouchers',
    route: Routes.journalVoucher,
  ),
  contra(
    apiName: 'Contra',
    displayText: 'Contra Vouchers',
    route: Routes.contraVoucher,
  ),
  sale(
    apiName: 'Sale',
    displayText: 'Sale Vouchers',
    route: Routes.saleVoucher,
  ),
  pettyCash(
    apiName: 'Petty Cash',
    displayText: 'Petty Cash Vouchers',
    route: Routes.pettyCashVoucher,
  );

  final String apiName;
  final String displayText;
  final String route;

  const VoucherType({
    required this.apiName,
    required this.displayText,
    required this.route,
  });
}
