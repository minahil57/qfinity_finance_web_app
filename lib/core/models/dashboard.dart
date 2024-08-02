import 'package:qfinity/export.dart';

class DashBoard {
  final int id;
  final double value;
  final double sum;
  final double processBar;
  final String metric;
  final String tag;
  final String title;
  final String email;
  final String image;

  DashBoard(
    this.id,
    this.value,
    this.sum,
    this.metric,
    this.tag,
    this.processBar,
    this.title,
    this.email,
    this.image,
  );

  factory DashBoard.fromJson(Map<String, dynamic> json) {
    JSONDecoder decoder = JSONDecoder(json);

    double value = decoder.getDouble('value');
    double sum = decoder.getDouble('sum');
    String metric = decoder.getString('metric');
    String tag = decoder.getString('tag');
    double processBar = decoder.getDouble('processBar');
    String title = decoder.getString('title');
    String email = decoder.getString('email');
    String image = AppImages.randomImage(AppImages.avatars);

    return DashBoard(
      decoder.getId,
      value,
      sum,
      metric,
      tag,
      processBar,
      title,
      email,
      image,
    );
  }

  static List<DashBoard> listFromJSON(List<dynamic> list) {
    return list.map((e) => DashBoard.fromJson(e)).toList();
  }

  static List<DashBoard>? _dummyList;

  static Future<List<DashBoard>> get dummyList async {
    if (_dummyList == null) {
      dynamic data = json.decode(await getData());
      _dummyList = listFromJSON(data);
    }

    return _dummyList!.sublist(0, 5);
  }

  static Future<String> getData() async {
    return rootBundle.loadString('assets/dummy/dashboard.json');
  }
}
