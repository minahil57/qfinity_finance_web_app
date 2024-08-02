part of 'api_provider.dart';

class _GeneralFinance {
  factory _GeneralFinance() {
    _instance ??= _GeneralFinance._sharedInstance();
    return _instance!;
  }

  _GeneralFinance._sharedInstance();

  static _GeneralFinance? _instance;

  Future<Response> getCostCenter1() {
    return DioHelper.getData(
      endPoint: EndPoints.generalFinance.getCostCenter1,
    );
  }

  Future<Response> getCostCenter2({required String costCenter1}) {
    return DioHelper.getData(
      endPoint: EndPoints.generalFinance.getCostCenter2(costCenter1: costCenter1),
    );
  }

  Future<Response> getCostCenter3(
    String costCenter1,
    String costCenter2,
  ) {
    return DioHelper.getData(
      endPoint: EndPoints.generalFinance.getCostCenter3(
        costCenter1: costCenter1,
        costCenter2: costCenter2,
      ),
    );
  }

  Future<Response> getCostCenter4({
    required String costCenter1,
    required String costCenter2,
    required String costCenter3,
  }) {
    return DioHelper.getData(
      endPoint: EndPoints.generalFinance.getCostCenter4(
        costCenter1: costCenter1,
        costCenter2: costCenter2,
        costCenter3: costCenter3,
      ),
    );
  }

  Future<Response> getAccountBalance({required String accountCode}) {
    return DioHelper.postData(
      endPoint: EndPoints.generalFinance.getAccountBalance,
      data: {
        'accountCode': accountCode,
        'financialYear': Get.find<StarterController>().selectedFinancialYearId,
        'approvedonly': false,
      },
    );
  }

  Future<Response> getFinanceSettings({required String accountCode}) {
    return DioHelper.getData(
      endPoint: EndPoints.generalFinance.getFinanceSettings,
    );
  }

  Future<Response> getDashboard({required Map<String, dynamic> data}) {
    return DioHelper.postData(
      endPoint: EndPoints.generalFinance.getDashboard,
      data: data,
    );
  }
}
