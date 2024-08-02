//ignore_for_file: library_private_types_in_public_api

library endpoints;

part 'account_trees.dart';
part 'accounts.dart';
part 'activities.dart';
part 'auth.dart';
part 'bank_account.dart';
part 'banks.dart';
part 'billwise_payments.dart';
part 'billwise_receipts.dart';
part 'checklist_activity.dart';
part 'checklist_category.dart';
part 'checklist_item.dart';
part 'checklist_job_type.dart';
part 'cheque_bounced_reason.dart';
part 'cheque_discount.dart';
part 'contra_vouchers.dart';
part 'cost_center1.dart';
part 'cost_center2.dart';
part 'cost_center3.dart';
part 'cost_center4.dart';
part 'currencies.dart';
part 'departments.dart';
part 'employees.dart';
part 'general_facility.dart';
part 'general_finance.dart';
part 'general_ledgers.dart';
part 'ic_category.dart';
part 'ic_company_settings.dart';
part 'journal_vouchers.dart';
part 'manage_payments.dart';
part 'payment_vouchers.dart';
part 'petty_cash_vouchers.dart';
part 'primary_accounts.dart';
part 'project_master.dart';
part 'purchase_vouchers.dart';
part 'qfinity.dart';
part 'recurring_vouchers.dart';
part 'reverse_entries.dart';
part 'sale_vouchers.dart';
part 'supplier_master.dart';
part 'task_category.dart';
part 'tax_master.dart';
part 'technician_master.dart';
part 'technician_role.dart';
part 'transaction_listing.dart';
part 'transaction_type.dart';
part 'trial_balance.dart';
part 'uploads.dart';
part 'work_order_type.dart';

abstract final class EndPoints {
  // static const String baseUrl = 'https://api.newcrm.freemyip.com'; // PROD
  static const String baseUrl = 'https://dev.api.newcrm.freemyip.com'; // DEV
  static const String _apiBaseUrl = '$baseUrl/api';

  static _Accounts get accounts => _Accounts(apiBaseUrl: _apiBaseUrl);

  static _Auth get auth => _Auth(apiBaseUrl: _apiBaseUrl);

  static _GeneralFinance get generalFinance => _GeneralFinance(apiBaseUrl: _apiBaseUrl);

  static _Uploads get uploads => _Uploads(apiBaseUrl: _apiBaseUrl);

  static _Qfinity get qfinity => _Qfinity(apiBaseUrl: _apiBaseUrl);

  static _TransactionListing get transactionListing => _TransactionListing(apiBaseUrl: _apiBaseUrl);

  static _JournalVouchers get journalVouchers => _JournalVouchers(apiBaseUrl: _apiBaseUrl);

  static _PaymentVouchers get paymentVouchers => _PaymentVouchers(apiBaseUrl: _apiBaseUrl);

  static _ContraVouchers get contraVouchers => _ContraVouchers(apiBaseUrl: _apiBaseUrl);

  static _PurchaseVouchers get purchaseVouchers => _PurchaseVouchers(apiBaseUrl: _apiBaseUrl);

  static _SaleVouchers get saleVouchers => _SaleVouchers(apiBaseUrl: _apiBaseUrl);

  static _PettyCashVouchers get pettyCashVouchers => _PettyCashVouchers(apiBaseUrl: _apiBaseUrl);

  static _AccountTrees get accountTrees => _AccountTrees(apiBaseUrl: _apiBaseUrl);

  static _GeneralLedgers get generalLedgers => _GeneralLedgers(apiBaseUrl: _apiBaseUrl);

  static _TrialBalance get trialBalance => _TrialBalance(apiBaseUrl: _apiBaseUrl);

  static _BillwisePayments get billwisePayments => _BillwisePayments(apiBaseUrl: _apiBaseUrl);

  static _BillwiseReceipts get billwiseReceipts => _BillwiseReceipts(apiBaseUrl: _apiBaseUrl);

  static _ReverseEntries get reverseEntries => _ReverseEntries(apiBaseUrl: _apiBaseUrl);

  static _ManagePayments get managePayments => _ManagePayments(apiBaseUrl: _apiBaseUrl);

  static _CostCenter1 get costCenter1 => _CostCenter1(apiBaseUrl: _apiBaseUrl);

  static _CostCenter2 get costCenter2 => _CostCenter2(apiBaseUrl: _apiBaseUrl);

  static _CostCenter3 get costCenter3 => _CostCenter3(apiBaseUrl: _apiBaseUrl);

  static _CostCenter4 get costCenter4 => _CostCenter4(apiBaseUrl: _apiBaseUrl);

  static _Banks get banks => _Banks(apiBaseUrl: _apiBaseUrl);

  static _Currencies get currencies => _Currencies(apiBaseUrl: _apiBaseUrl);

  static _IcCategory get icCategory => _IcCategory(apiBaseUrl: _apiBaseUrl);

  static _IcCompanySettings get icCompanySettings => _IcCompanySettings(apiBaseUrl: _apiBaseUrl);

  static _PrimaryAccounts get primaryAccounts => _PrimaryAccounts(apiBaseUrl: _apiBaseUrl);

  static _Departments get departments => _Departments(apiBaseUrl: _apiBaseUrl);

  static _Employees get employees => _Employees(apiBaseUrl: _apiBaseUrl);

  static _ChequeBouncedReason get chequeBouncedReason => _ChequeBouncedReason(apiBaseUrl: _apiBaseUrl);

  static _ChequeDiscount get chequeDiscount => _ChequeDiscount(apiBaseUrl: _apiBaseUrl);

  static _TransactionType get transactionType => _TransactionType(apiBaseUrl: _apiBaseUrl);

  static _BankAccount get bankAccount => _BankAccount(apiBaseUrl: _apiBaseUrl);

  static _TaxMaster get taxMaster => _TaxMaster(apiBaseUrl: _apiBaseUrl);

  static _RecurringVouchers get recurringVouchers => _RecurringVouchers(apiBaseUrl: _apiBaseUrl);

  static _SupplierMaster get supplierMaster => _SupplierMaster(apiBaseUrl: _apiBaseUrl);

  static _WorkOrderType get workOrderType => _WorkOrderType(apiBaseUrl: _apiBaseUrl);

  static _TechnicianRole get technicianRole => _TechnicianRole(apiBaseUrl: _apiBaseUrl);

  static _TaskCategory get taskCategory => _TaskCategory(apiBaseUrl: _apiBaseUrl);

  static _ProjectMaster get projectMaster => _ProjectMaster(apiBaseUrl: _apiBaseUrl);

  static _Activities get activities => _Activities(apiBaseUrl: _apiBaseUrl);

  static _GeneralFacility get generalFacility => _GeneralFacility(apiBaseUrl: _apiBaseUrl);

  static _CheckListJobType get checkListJobType => _CheckListJobType(apiBaseUrl: _apiBaseUrl);

  static _CheckListItem get checkListItem => _CheckListItem(apiBaseUrl: _apiBaseUrl);

  static _CheckListCategory get checkListCategory => _CheckListCategory(apiBaseUrl: _apiBaseUrl);

  static _CheckListActivity get checkListActivity => _CheckListActivity(apiBaseUrl: _apiBaseUrl);

  static _TechnicianMaster get technicianMaster => _TechnicianMaster(apiBaseUrl: _apiBaseUrl);
}
