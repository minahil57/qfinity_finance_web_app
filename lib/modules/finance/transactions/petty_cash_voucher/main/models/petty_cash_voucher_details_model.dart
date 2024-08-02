import 'package:qfinity/export.dart';

class PettyCashVoucherDetailsModel {
  PettyCashVoucherMainModel? main;
  List<AttachmentModel>? attachments;
  List<PettyCashVoucherTransactionModel>? transactions;

  PettyCashVoucherDetailsModel({
    this.main,
    this.attachments,
    this.transactions,
  });

  factory PettyCashVoucherDetailsModel.fromJson(Map<String, dynamic> json) {
    return PettyCashVoucherDetailsModel(
      main: PettyCashVoucherMainModel.fromJson(json['data']['main']),
      attachments: json['data']['attachments'] != null
          ? List<AttachmentModel>.from(
              json['data']['attachments'].map(
                (item) => AttachmentModel.fromJson(item),
              ),
            )
          : [],
      transactions: List<PettyCashVoucherTransactionModel>.from(
        json['data']['transactions'].map(
          (transaction) => PettyCashVoucherTransactionModel.fromJson(transaction),
        ),
      ),
    );
  }
}
