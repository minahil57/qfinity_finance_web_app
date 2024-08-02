import 'package:qfinity/export.dart';

class VoucherCountCard extends StatelessWidget {
  const VoucherCountCard({
    super.key,
    required this.color,
    required this.icon,
    required this.count,
    required this.voucherType,
  });

  final Color color;
  final IconData icon;
  final int count;
  final VoucherType voucherType;

  @override
  Widget build(BuildContext context) {
    return MyCard(
      onTap: () {},
      shadow: MyShadow(elevation: .5),
      bordered: true,
      height: 140,
      color: Colors.white.withAlpha(150),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText.bodyLarge(
                  voucherType.displayText,
                  fontSize: 15,
                  fontWeight: 600,
                ),
                MyText.bodyLarge(
                  count.toString(),
                  fontWeight: 600,
                  fontSize: 20,
                ),
              ],
            ),
          ),
          Icon(
            icon,
            color: color,
          ),
        ],
      ),
    );
  }
}
