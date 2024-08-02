import 'package:qfinity/export.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorage.init();
  DioHelper.init();
  AppStyle.init();
  await ThemeCustomizer.init();
  HttpOverrides.global = AppHttpOverrides();

  runApp(
    Phoenix(
      child: ChangeNotifierProvider<AppNotifier>(
        create: (context) => AppNotifier(),
        child: const QfinityApp(),
      ),
    ),
  );
}
