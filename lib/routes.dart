import 'package:qfinity/export.dart';
import 'package:qfinity/modules/account_recieveable/sales%20voucher/bindings/sale_voucher_binding.dart';
import 'package:qfinity/modules/account_recieveable/sales%20voucher/sales_voucher_page.dart';

class Routes {
  static const String login = '/auth/login';
  static const String createCompanyAccount = '/auth/create-company-account';
  static const String forgetPassword = '/auth/forget-password';
  static const String resetPassword = '/auth/reset-password';
  static const String dashboard = '/dashboard';
  static const String transactionListingAndApproval = '/finance/transaction-listing-and-approval';
  static const String journalVoucher = '/finance/transactions/journal-voucher';
  static const String createJournalVoucher = '/finance/transactions/journal-voucher/create';
  static const String editJournalVoucher = '/finance/transactions/journal-voucher/edit';
  static const String contraVoucher = '/finance/transactions/contra-voucher';
  static const String createContraVoucher = '/finance/transactions/contra-voucher/create';
  static const String editcontraVoucher = '/finance/transactions/contra-voucher/edit';
  static const String accountsTree = '/finance/accounts-tree';
  static const String generalLedger = '/finance/general-ledger';
  static const String managePayments = '/finance/manage-payments';
  static const String trialBalance = '/finance/final-account/trial-balance';
  static const String editProfile = '/account/edit-profile';
  static const String changePassword = '/account/change-password';
  static const String myProfile = '/account/my-profile';
  static const String settings = '/account/settings';
  static const String paymentVoucher = '/ap/payment-voucher';
  static const String createPaymentVoucher = '/ap/payment-voucher/create';
  static const String editPaymentVoucher = '/ap/payment-voucher/edit';
  static const String purchaseVoucher = '/ap/purchase-voucher';
  static const String createPurchaseVoucher = '/ap/purchase-voucher/create';
  static const String updatePurchaseVoucher = '/ap/purchase-voucher/update';
  static const String billwisePayment = '/ap/billwise-payment';
  static const String createBillwisePayment = '/ap/billwise-payment/create';
  static const String updateBillwisePayment = '/ap/billwise-payment/update';
  static const String billwiseReceipt = '/finance/transactions/billwise-receipt';
  static const String createBillwiseReceipt = '/finance/transactions/billwise-receipt/create';
  static const String updateBillwiseReceipt = '/finance/transactions/billwise-receipt/update';
  static const String saleVoucher = '/account_recieveable/sale-voucher';
  static const String reverseEntries = '/finance/transactions/reverse-entries';
  static const String pettyCashVoucher = '/finance/transactions/petty-cash-voucher';
  static const String createPettyCashVoucher = '/finance/transactions/petty-cash-voucher/create';
  static const String editPettyCashVoucher = '/finance/transactions/petty-cash-voucher/update';
  static const String costCenter1 = '/finance/master/cost-center1';
  static const String costCenter2 = '/finance/master/cost-center2';
  static const String costCenter3 = '/finance/master/cost-center3';
  static const String costCenter4 = '/finance/master/cost-center4';
  static const String department = '/finance/master/department';
  static const String employee = '/finance/master/employee';
  static const String icCategory = '/finance/master/ic-category';
  static const String chequeBouncedReason = '/finance/master/cheque-bounced-reason';
  static const String chequeDiscount = '/finance/master/cheque-discount';
  static const String bank = '/finance/master/bank';
  static const String bankAccount = '/finance/master/bank-account';
  static const String primaryAccount = '/finance/master/primary-account';
  static const String currency = '/finance/master/currency';
  static const String icAccountSetting = '/finance/master/ic-account-setting';
  static const String transactionType = '/finance/master/transaction-type';
  static const String taxMaster = '/finance/master/tax-master';
  static const String supplierMaster = '/finance/master/supplier-master';

  // Facility - Master
  static const String activities = '/facility/master/activities';
  static const String checkListCategory = '/facility/master/checklist-category';
  static const String checkListActivity = '/facility/master/checklist-activity';
  static const String checkListItem = '/facility/master/checklist-item';
  static const String checkListJobType = '/facility/master/checklist-job-type';
  static const String technicianRole = '/facility/master/technician-role';
  static const String technicianMaster = '/facility/master/technician-master';

  // Facility - Complaint Management
  static const String facilityDashboard = '/facility/complaint-management/dashboard';
}

class AppRouter {
  static String initialRoute = Routes.dashboard;

  static List<GetPage> pages() {
    return [
      GetPage(name: Routes.login, page: () => const LoginPage()),
      GetPage(
        name: Routes.forgetPassword,
        page: () => const ForgotPasswordPage(),
      ),
      GetPage(
        name: Routes.createCompanyAccount,
        page: () => const CreateCompanyAccountPage(),
      ),
      GetPage(
        name: Routes.resetPassword,
        page: () => const ResetPasswordPage(),
      ),
      GetPage(
        name: Routes.dashboard,
        page: () => const DashboardPage(),
        middlewares: [AuthMiddleware()],
        bindings: [
          StarterBinding(),
          DashboardBinding(),
        ],
      ),
      GetPage(
        name: Routes.editProfile,
        page: () => const EditProfilePage(),
        middlewares: [AuthMiddleware()],
      ),
      GetPage(
        name: Routes.changePassword,
        page: () => const ChangePasswordPage(),
        middlewares: [AuthMiddleware()],
      ),
      GetPage(
        name: Routes.myProfile,
        page: () => const MyProfilePage(),
        middlewares: [AuthMiddleware()],
      ),
      GetPage(
        name: Routes.settings,
        page: () => const SettingsPage(),
        middlewares: [AuthMiddleware()],
      ),
      GetPage(
        name: Routes.pettyCashVoucher,
        page: () => const PettyCashVoucherPage(),
        middlewares: [AuthMiddleware()],
        bindings: [
          StarterBinding(),
          PettyCashVoucherBinding(),
        ],
      ),
      GetPage(
        name: Routes.createPettyCashVoucher,
        page: () => const CreatePettyCashVoucherPage(),
        middlewares: [AuthMiddleware()],
        bindings: [
          StarterBinding(),
          PettyCashVoucherBinding(),
          CreatePettyCashVoucherBinding(),
        ],
      ),
      GetPage(
        name: Routes.editPettyCashVoucher,
        page: () => const EditPettyCashVoucherPage(),
        middlewares: [AuthMiddleware()],
        bindings: [
          StarterBinding(),
          PettyCashVoucherBinding(),
          EditPettyCashVoucherBinding(),
        ],
      ),
      GetPage(
        name: Routes.saleVoucher,
        page: () => const SalesVoucherPage(),
        middlewares: [AuthMiddleware()],
        bindings: [
          StarterBinding(),
         SaleVoucherBinding(),
          // EditPettyCashVoucherBinding(),
        ],
      ),
    ];
  }
}

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    // log(route.toString());
    if (!AuthRepository.isLoggedIn) {
      // log('here');
      return const RouteSettings(name: Routes.login);
    }
    // log('here 2');
    return null;
  }
}
