import 'package:flutter/material.dart';
import 'package:la_vie/data/models/quiz_model.dart';
import 'package:la_vie/presentation/home/home_view.dart';
import 'package:la_vie/presentation/resources/color_manager.dart';
import 'package:la_vie/presentation/resources/styles_manager.dart';
import 'package:la_vie/presentation/resources/values_manager.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({
    Key? key,
    required this.score,
  }) : super(key: key);
  final int score;
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: height * 0.2),
              Text(
                'Congratualtions !!',
                style: getSemiboldStyle(
                  color: ColorManger.black,
                  size: AppSize.s25,
                ),
              ),
              SizedBox(height: height * 0.05),
              Text(
                'You answer true  :  $score/ ${qusestions.length} ',
                style: getLightStyle(
                  color: ColorManger.black,
                  size: AppSize.s14,
                ),
              ),
              SizedBox(height: height * 0.05),
              Text(
                'You Get ${score * 2} Points ',
                style: getBoldStyle(
                  color: ColorManger.black,
                  size: AppSize.s25,
                ),
              ),
              SizedBox(height: height * 0.2),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const HomeView(),
                  ));
                },
                child: const Text('Home'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
