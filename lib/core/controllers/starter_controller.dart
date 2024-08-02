import 'package:qfinity/export.dart';

class StarterController extends BaseController {
  List<DropdownItemModel> financialYears = [
    const DropdownItemModel(id: '', name: '--Select--'),
  ];

  DropdownItemModel selectedFinancialYear = const DropdownItemModel(id: '', name: '--Select--');

  String get selectedFinancialYearId =>
      selectedFinancialYear.id.isNotEmpty ? selectedFinancialYear.id : 'FY ${DateTime.now().year}';

  String get selectedFinancialYearName => selectedFinancialYear.name != '--Select--'
      ? selectedFinancialYear.name
      : 'From 01 Jan, ${DateTime.now().year} To 31 Dec, ${DateTime.now().year}';

  UserCompany? selectedUserCompany;

  LoginModel? loginModel;

  @override
  void onInit() {
    super.onInit();
    getLoginModel();
    getSelectedCompany();
    getFinancialYears();
  }

  List<UserCompany> get userCompanies {
    LoginModel? loginModel = LocalStorage.getLoginModel();
    if (loginModel != null) {
      return loginModel.userCompanies!;
    }
    return [];
  }

  void getLoginModel() {
    loginModel = AccountRepository.getLoginModel;
    update();
  }

  void getSelectedCompany() {
    var company = LocalStorage.getUserCompany();
    if (company != null) {
      selectedUserCompany = company;
    }
  }

  Future<void> onSelectedCompany(UserCompany company) async {
    if (company.id == selectedUserCompany!.id) return;
    await LocalStorage.setUserCompany(company);
    await Get.deleteAll(force: true); //deleting all controllers
    Phoenix.rebirth(Get.context!); // Restarting app
    Get.reset();
  }

  void onSelectedFinancialYear(DropdownItemModel value) {
    selectedFinancialYear = value;
    Get.put(DashboardController()).getVouchersCount();
    update();
  }

  Future<void> getFinancialYears() async {
    try {
      final response = await ApiProvider.qfinity.getFinancialYears();
      if (response.statusCode == 200) {
        financialYears =
            (response.data['data'] as List).map<DropdownItemModel>((e) => DropdownItemModel.fromJson(e)).toList();
        selectedFinancialYear = financialYears[0];
        update();
      }
    } catch (e, stackTrace) {
      AppLogger.e(e, stackTrace: stackTrace);
    }
    update();
  }
}
