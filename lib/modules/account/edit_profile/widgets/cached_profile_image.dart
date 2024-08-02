import 'package:qfinity/export.dart';

class CachedProfileImage extends StatelessWidget {
  const CachedProfileImage({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: BoxFit.cover,
      placeholder: (context, url) => const GreyAvatar(),
      errorWidget: (context, url, error) => const GreyAvatar(),
    );
  }
}
