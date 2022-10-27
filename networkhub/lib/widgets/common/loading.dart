import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:networkhub/config/themes/palette.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: LoadingAnimationWidget.discreteCircle(
      color: Palette.primaryColor,
      secondRingColor: Palette.accentColor,
      thirdRingColor: Palette.secondaryColor,
      size: 200,
    ));
  }
}
