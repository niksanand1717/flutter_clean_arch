import 'dart:async';

import 'package:flutter/material.dart';
import 'package:clean_arch/presentation/resources/assets_manager.dart';
import 'package:clean_arch/presentation/resources/color_manager.dart';
import 'package:clean_arch/presentation/resources/routes_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _timer;

  _startDelay() {
    _timer = Timer(Duration(seconds: 2), _goNext);
  }

  _goNext() {
    Navigator.pushReplacementNamed(context, Routes.onboardingRoute);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _startDelay();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: Center(
        child: Image(
          // alignment: Alignment.center,
          image: AssetImage(ImageAssets.splashLogo),
        ),
      ),
    );
  }
}
