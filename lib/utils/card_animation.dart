import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';

enum AniProps { opacity, translateY }

class CardAnimation extends StatelessWidget {
  final double delay;
  final Widget child;

  const CardAnimation({Key? key, required this.delay, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _tween = MultiTween<AniProps>() // <== ISSUE IS HERE
      ..add(AniProps.opacity, Tween(begin: 0.0, end: 1.0))
      ..add(AniProps.translateY, Tween(begin: -30.0, end: 0.0),
          const Duration(milliseconds: 500), Curves.easeOut);

    return PlayAnimation<MultiTweenValues<AniProps>>(
      // <== ISSUE IS ALSO HERE
      delay: Duration(milliseconds: (500 * delay).round()),
      duration: _tween.duration,
      tween: _tween,
      child: child,
      builder: (context, child, animation) => Opacity(
        opacity: animation.get(AniProps.opacity),
        child: Transform.translate(
            offset: Offset(0, animation.get(AniProps.translateY)),
            child: child),
      ),
    );
  }
}
// enum AniProps2 { opacity, translateY }
//
// class CardAnimation extends StatelessWidget {
//   final double delay;
//   final Widget child;
//   const CardAnimation({Key? key, required this.child, required this.delay})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final tween = MultiTween<AntiProps>()
//       ..add(AniProps2.opacity, 0.0.tweenTo(1.0), 500.milliseconds)
//       ..add(AniProps2.translateY, (-30.0).tweenTo(0.0), 500.milliseconds,
//           Curves.easeOut);
//
//     return PlayAnimation<MultiTweenValues<AniProps2>>(
//       delay: Duration(milliseconds: (500 * delay).round()),
//       duration: tween.duration,
//       tween: tween,
//       child: child,
//       builder: (context, child, value) => Opacity(
//         opacity: value.get(AniProps2.opacity),
//         child: Transform.translate(
//             offset: Offset(0, value.get(AniProps2.translateY)), child: child),
//       ),
//     );
//   }
// }
