import 'dart:async';

import 'package:flutter/material.dart';
import 'package:la_vie/presentation/resources/assets_manager.dart';
import 'package:la_vie/presentation/resources/color_manager.dart';
import 'package:la_vie/presentation/resources/constant_manager.dart';
import 'package:la_vie/presentation/resources/routes_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _timer;

  _spashTimer() {
    _timer = Timer(const Duration(seconds: Constant.delaySplash), _goToNext);
  }

  _goToNext() {
    Navigator.pushReplacementNamed(context, Routes.onBoardingRoute);
  }

  @override
  void initState() {
    super.initState();
    _spashTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManger.primary,
      body: const Center(
        child: Image(
          image: AssetImage(AssetsImages.splashLogo),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }
}
