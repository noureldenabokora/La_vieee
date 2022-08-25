import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/cubit/app_cubit.dart';
import 'package:la_vie/data/const/const.dart';
import 'package:la_vie/data/shared/cached/shared_prefence.dart';
import 'package:la_vie/data/shared/dio/dio_helper.dart';
import 'package:la_vie/presentation/login/login_view.dart';
import 'package:la_vie/presentation/resources/assets_manager.dart';
import 'package:la_vie/presentation/resources/color_manager.dart';
import 'package:la_vie/presentation/resources/constant_manager.dart';
import 'package:page_transition/page_transition.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await CacheHellper.init();

  DioHelper.init();

  apiToken = CacheHellper.getData(key: 'apiToken');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: ((context) => AppCubit()
            ..getProducts()
            ..getPlants()
            ..getSeeds()
            ..getTools()
            ..getPerson()
            ..scanPlants()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(
          startWidget: LoginView(),
        ),
      ),
    );
  }
}

class SplashScreen extends StatelessWidget {
  Widget startWidget;

  SplashScreen({Key? key, required this.startWidget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: const Center(
        child: Image(
            image: AssetImage(
          AssetsImages.splashLogo,
        )),
      ),
      duration: Constant.durationSplash,
      backgroundColor: ColorManger.white,
      splashTransition: SplashTransition.sizeTransition,
      pageTransitionType: PageTransitionType.leftToRight,
      animationDuration: const Duration(seconds: Constant.delaySplash),
      nextScreen: startWidget,
    );
  }
}
