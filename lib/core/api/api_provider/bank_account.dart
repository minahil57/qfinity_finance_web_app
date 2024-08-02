part of 'api_provider.dart';

class _BankAccount {
  factory _BankAccount() {
    _instance ??= _BankAccount._sharedInstance();
    return _instance!;
  }

  _BankAccount._sharedInstance();

  static _BankAccount? _instance;

  Future<Response> listing({
    required Map<String, dynamic> data,
  }) async {
    return DioHelper.postData(
      endPoint: EndPoints.bankAccount.listing,
      data: data,
    );
  }

  Future<Response> details({
    required int id,
  }) async {
    return DioHelper.getData(
      endPoint: EndPoints.bankAccount.details(
        id: id,
      ),
    );
  }

  Future<Response> update({
    required int id,
    required Map<String, dynamic> data,
  }) async {
    return DioHelper.putData(
      endPoint: EndPoints.bankAccount.update(
        id: id,
      ),
      data: data,
    );
  }

  Future<Response> delete({
    required int id,
  }) async {
    return DioHelper.deleteData(
      endPoint: EndPoints.bankAccount.delete(
        id: id,
      ),
    );
  }

  Future<Response> create({
    required Map<String, dynamic> data,
  }) async {
    return DioHelper.postData(
      endPoint: EndPoints.bankAccount.create,
      data: data,
    );
  }

  Future<Response> dropdowns() async {
    return DioHelper.getData(
      endPoint: EndPoints.bankAccount.dropdowns(
        financialYear: Get.find<StarterController>().selectedFinancialYearId,
      ),
    );
  }
}
