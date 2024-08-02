import 'package:qfinity/export.dart';

enum AnimationProps { opacity, translateY }

class FadeAnimation extends StatelessWidget {
  const FadeAnimation({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final MovieTween tween = MovieTween()
      ..tween(
        AnimationProps.opacity,
        Tween<double>(begin: 0, end: 1),
        duration: const Duration(milliseconds: 500),
      )
      ..tween(
        AnimationProps.translateY,
        Tween<double>(begin: -30, end: 0),
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeOut,
      );

    return CustomAnimationBuilder<Movie>(
      delay: const Duration(milliseconds: 250),
      duration: tween.duration,
      tween: tween,
      builder: (
        BuildContext context,
        Movie animation,
        Widget? child,
      ) {
        return Opacity(
          opacity: animation.get(AnimationProps.opacity),
          child: Transform.translate(
            offset: Offset(
              0,
              animation.get(
                AnimationProps.translateY,
              ),
            ),
            child: child,
          ),
        );
      },
      child: child,
    );
  }
}
