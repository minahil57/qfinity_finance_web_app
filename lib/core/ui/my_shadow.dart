import 'package:qfinity/export.dart';

enum MyShadowPosition {
  topLeft,
  top,
  topRight,
  centerLeft,
  center,
  centerRight,
  bottomLeft,
  bottom,
  bottomRight,
}

class MyShadow {
  int alpha;
  double elevation;
  double spreadRadius;
  double blurRadius;
  Offset offset;
  MyShadowPosition position;
  Color? color;
  bool darkShadow;

  MyShadow({
    this.elevation = 3,
    double? spreadRadius,
    double? blurRadius,
    Offset? offset,
    this.position = MyShadowPosition.bottom,
    int? alpha,
    this.color,
    this.darkShadow = false,
  })  : spreadRadius = spreadRadius ?? elevation * 0.125,
        blurRadius = blurRadius ?? elevation * 2,
        alpha = alpha ?? (darkShadow ? 80 : 25),
        offset = offset ?? _getOffset(position, elevation);

  static Offset _getOffset(MyShadowPosition position, double elevation) => switch (position) {
        MyShadowPosition.topLeft => Offset(-elevation, -elevation),
        MyShadowPosition.top => Offset(0, -elevation),
        MyShadowPosition.topRight => Offset(elevation, -elevation),
        MyShadowPosition.centerLeft => Offset(-elevation, elevation * 0.25),
        MyShadowPosition.center => Offset.zero,
        MyShadowPosition.centerRight => Offset(elevation, elevation * 0.25),
        MyShadowPosition.bottomLeft => Offset(-elevation, elevation),
        MyShadowPosition.bottom => Offset(0, elevation),
        MyShadowPosition.bottomRight => Offset(elevation, elevation)
      };

  @override
  String toString() {
    return 'MyShadow{alpha: $alpha, elevation: $elevation, spreadRadius: $spreadRadius, blurRadius: $blurRadius, offset: $offset, position: $position, color: $color, darkShadow: $darkShadow}';
  }
}
