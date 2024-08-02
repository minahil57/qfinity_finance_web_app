//ignore_for_file: library_private_types_in_public_api

library api_provider;

import 'package:qfinity/export.dart';

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
part 'transaction_type.dart';
part 'trial_balance.dart';
part 'uploads.dart';
part 'work_order_type.dart';

abstract final class ApiProvider {
  static _Accounts get accounts => _Accounts();

  static _Auth get auth => _Auth();

  static _GeneralFinance get generalFinance => _GeneralFinance();

  static _Uploads get uploads => _Uploads();

  static _Qfinity get qfinity => _Qfinity();

  static _JournalVouchers get journalVouchers => _JournalVouchers();

  static _PaymentVouchers get paymentVouchers => _PaymentVouchers();

  static _ContraVouchers get contraVouchers => _ContraVouchers();

  static _PurchaseVouchers get purchaseVouchers => _PurchaseVouchers();

  static _SaleVouchers get saleVouchers => _SaleVouchers();

  static _PettyCashVouchers get pettyCashVouchers => _PettyCashVouchers();

  static _AccountTrees get accountTrees => _AccountTrees();

  static _GeneralLedgers get generalLedgers => _GeneralLedgers();

  static _TrialBalance get trialBalance => _TrialBalance();

  static _BillwisePayments get billwisePayments => _BillwisePayments();

  static _BillwiseReceipts get billwiseReceipts => _BillwiseReceipts();

  static _ReverseEntries get reverseEntries => _ReverseEntries();

  static _ManagePayments get managePayments => _ManagePayments();

  static _CostCenter1 get costCenter1 => _CostCenter1();

  static _CostCenter2 get costCenter2 => _CostCenter2();

  static _CostCenter3 get costCenter3 => _CostCenter3();

  static _CostCenter4 get costCenter4 => _CostCenter4();

  static _Banks get banks => _Banks();

  static _Currencies get currencies => _Currencies();

  static _IcCategory get icCategory => _IcCategory();

  static _IcCompanySettings get icCompanySettings => _IcCompanySettings();

  static _PrimaryAccounts get primaryAccounts => _PrimaryAccounts();

  static _Departments get departments => _Departments();

  static _Employees get employees => _Employees();

  static _ChequeBouncedReason get chequeBouncedReason => _ChequeBouncedReason();

  static _ChequeDiscount get chequeDiscount => _ChequeDiscount();

  static _TransactionType get transactionType => _TransactionType();

  static _BankAccount get bankAccount => _BankAccount();

  static _TaxMaster get taxMaster => _TaxMaster();

  static _RecurringVouchers get recurringVouchers => _RecurringVouchers();

  static _SupplierMaster get supplier => _SupplierMaster();

  static _WorkOrderType get workOrderType => _WorkOrderType();

  static _TechnicianRole get technicianRole => _TechnicianRole();

  static _TaskCategory get taskCategory => _TaskCategory();

  static _ProjectMaster get projectMaster => _ProjectMaster();

  static _Activities get activities => _Activities();

  static _GeneralFacility get generalFacility => _GeneralFacility();

  static _CheckListJobType get checkListJobType => _CheckListJobType();

  static _CheckListItem get checkListItem => _CheckListItem();

  static _CheckListCategory get checkListCategory => _CheckListCategory();

  static _CheckListActivity get checkListActivity => _CheckListActivity();

  static _TechnicianMaster get technicianMaster => _TechnicianMaster();
}
