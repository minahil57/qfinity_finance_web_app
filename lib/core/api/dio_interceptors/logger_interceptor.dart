import 'package:qfinity/export.dart';

final Interceptor loggerInterceptor = TalkerDioLogger(
  settings: TalkerDioLoggerSettings(
    requestPen: AnsiPen()..blue(bold: true),
    printRequestHeaders: true,
  ),
);
