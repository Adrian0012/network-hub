import 'package:beamer/beamer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:networkhub/config/urls.dart';
import 'package:networkhub/modules/intro/cubit/intro_cubit.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const IntroScreen());
  }
}

class _IntroScreenState extends State<IntroScreen> {
  final introKey = GlobalKey<_IntroScreenState>();

  Widget _buildFullscreenImage(String assetName) {
    return Image.asset(
      'assets/$assetName',
      fit: BoxFit.cover,
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
    );
  }

  Widget _buildImage(String assetName, [double width = 350]) {
    return Image.asset('assets/$assetName', width: width);
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);

    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      // pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );
    return BlocProvider(
      create: (_) => IntroCubit(),
      child: BlocBuilder<IntroCubit, IntroState>(builder: (context, state) {
        return IntroductionScreen(
          key: introKey,
          globalBackgroundColor: Colors.white,
          globalHeader: const Align(
            alignment: Alignment.topRight,
            // child: SafeArea(
            //   child: Padding(
            //     padding: const EdgeInsets.only(top: 16, right: 16),
            //     child: _buildImage('flutter.png', 100),
            //   ),
            // ),
          ),
          globalFooter: SizedBox(
            width: double.infinity,
            height: 60,
            child: ElevatedButton(
              child: const Text(
                '== Initialize Skynet ==',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                context.read<IntroCubit>().initSkynet(context);
              },
            ),
          ),
          pages: [
            // PageViewModel(
            //   title: "Fractional shares",
            //   body:
            //       "Instead of having to buy an entire share, invest any amount you want.",
            //   image: _buildImage('img1.jpg'),
            //   decoration: pageDecoration,
            // ),
            // PageViewModel(
            //   title: "Learn as you go",
            //   body:
            //       "Download the Stockpile app and master the market with our mini-lesson.",
            //   image: _buildImage('img2.jpg'),
            //   decoration: pageDecoration,
            // ),
            // PageViewModel(
            //   title: "Kids and teens",
            //   body:
            //       "Kids and teens can track their stocks 24/7 and place trades that you approve.",
            //   image: _buildImage('img3.jpg'),
            //   decoration: pageDecoration,
            // ),
            PageViewModel(
              title: "",
              body: "",
              image: _buildFullscreenImage('img3.jpg'),
              decoration: pageDecoration.copyWith(
                contentMargin: const EdgeInsets.symmetric(horizontal: 16),
                fullScreen: true,
                bodyFlex: 2,
                imageFlex: 3,
              ),
            ),
            PageViewModel(
              title: "",
              body: "",
              image: _buildFullscreenImage('img2.jpg'),
              decoration: pageDecoration.copyWith(
                contentMargin: const EdgeInsets.symmetric(horizontal: 16),
                fullScreen: true,
                bodyFlex: 2,
                imageFlex: 3,
              ),
            ),
            // PageViewModel(
            //   title: "Another title page",
            //   body: "Another beautiful body text for this example onboarding",
            //   image: _buildImage('img2.jpg'),
            //   footer: ElevatedButton(
            //     onPressed: () {},
            //     style: ElevatedButton.styleFrom(
            //       primary: Colors.lightBlue,
            //       shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(8.0),
            //       ),
            //     ),
            //     child: const Text(
            //       'FooButton',
            //       style: TextStyle(color: Colors.white),
            //     ),
            //   ),
            //   decoration: pageDecoration,
            // ),
            // PageViewModel(
            //   title: "Title of last page - reversed",
            //   bodyWidget: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: const [
            //       Text("Click on ", style: bodyStyle),
            //       Icon(Icons.edit),
            //       Text(" to edit a post", style: bodyStyle),
            //     ],
            //   ),
            //   decoration: pageDecoration.copyWith(
            //     bodyFlex: 2,
            //     imageFlex: 4,
            //     bodyAlignment: Alignment.bottomCenter,
            //     imageAlignment: Alignment.topCenter,
            //   ),
            //   image: _buildImage('img1.jpg'),
            //   reverse: true,
            // ),
          ],
          onDone: () => Beamer.of(context).beamToNamed(Routes.dashboard),
          //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
          showSkipButton: true,
          skipOrBackFlex: 0,
          nextFlex: 0,
          showBackButton: false,
          //rtl: true, // Display as right-to-left
          back: const Icon(Icons.arrow_back),
          skip:
              const Text('Skip', style: TextStyle(fontWeight: FontWeight.w600)),
          next: const Icon(Icons.arrow_forward),
          done:
              const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
          showDoneButton: true,
          curve: Curves.fastLinearToSlowEaseIn,
          controlsMargin: const EdgeInsets.all(16),
          controlsPadding: kIsWeb
              ? const EdgeInsets.all(12.0)
              : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
          dotsDecorator: const DotsDecorator(
            size: Size(10.0, 10.0),
            color: Color(0xFFBDBDBD),
            activeSize: Size(22.0, 10.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
            ),
          ),
          dotsContainerDecorator: const ShapeDecoration(
            color: Colors.black87,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
          ),
        );
      }),
    );
  }
}
