enum FinanceReportCodes {
  transactionListing,
  generalLedger,
  trialbalance,
  billwisePayment,
  billwiseReceipt,
  chartOfAccounts,
  saleVoucher,
  customerReceipt,
  leaseReceiptVoucher,
  pettyCashVoucher,
  contraVoucher,
  journalVoucher,
  paymentVoucher,
  purchaseVoucher,
  reverseEntry
}

enum Sorting { asc, desc }

enum ExportedFileType {
  pdf,
  html,
  word,
  excel,
}

enum BalanceType {
  debit,
  credit,
}

enum ToSalesOrPurchaseTax {
  sales,
  purchase,
}

enum ItemsAlignment {
  row,
  column,
}
