import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:la_vie/cubit/app_cubit.dart';
import 'package:la_vie/cubit/app_states.dart';
import 'package:la_vie/data/const/const.dart';
import 'package:la_vie/presentation/blogs/blogs_view.dart';
import 'package:la_vie/presentation/resources/color_manager.dart';
import 'package:la_vie/presentation/resources/styles_manager.dart';
import 'package:la_vie/presentation/resources/values_manager.dart';

class DetailScanView extends StatelessWidget {
  const DetailScanView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return BlocConsumer<AppCubit, Appstates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        var sunLight = cubit.scanplants.data![8].sunLight! / 100;
        var WaterCapacity = cubit.scanplants.data![8].waterCapacity! / 100;
        var Temperature = cubit.scanplants.data![8].temperature! / 100;

        var convertSunlight = sunLight.toStringAsFixed(0);
        var convertWaterCapacity = WaterCapacity.toStringAsFixed(0);
        var convertTemperature = Temperature.toStringAsFixed(0);

        return SafeArea(
          child: Scaffold(
            body: Column(
              children: [
                Stack(
                  alignment: AlignmentDirectional.topStart,
                  children: [
                    Image(
                      height: height * 0.6,
                      width: double.infinity,
                      image: NetworkImage(
                        '$BASEURL${cubit.scanplants.data![8].imageUrl}',
                      ),
                      fit: BoxFit.cover,
                    ),
                    Stack(
                      children: [
                        Container(
                          color: Colors.black26,
                          width: double.infinity,
                          height: height * 0.6,
                        ),
                        Column(
                          children: [
                            SizedBox(height: height * 0.1),
                            buildItem(
                                convertSunlight, 'Sun light', width, 'sun'),
                            SizedBox(height: height * 0.02),
                            buildItem(convertWaterCapacity, 'Water Capcity',
                                width, 'water'),
                            SizedBox(height: height * 0.02),
                            buildItem(convertTemperature, 'Tempertuer', width,
                                'temp'),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                Expanded(
                  child: Container(
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        // color: Colors.transparent,
                        color: Colors.grey.shade200,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(
                              20,
                            ),
                            topRight: Radius.circular(
                              20,
                            ))),
                    child: Column(
                      children: [
                        SizedBox(height: height * 0.02),
                        Text(
                          '${cubit.scanplants.data![8].name}',
                          style: getBoldStyle(
                              color: ColorManger.black, size: AppSize.s40),
                        ),
                        SizedBox(height: height * 0.02),
                        Text(
                          '${cubit.scanplants.data![8].description}',
                          style: getSemiboldStyle(
                              color: ColorManger.black, size: AppSize.s18),
                        ),
                        Spacer(),
                        FlatButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const BlogsView(),
                              ));
                            },
                            color: ColorManger.primary,
                            child: Text(
                              'Go to Blog',
                              style: getRegularStyle(
                                color: ColorManger.white,
                                size: AppSize.s18,
                              ),
                            ))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildItem(sunlight, title, width, imagetext) => Row(
        children: [
          SizedBox(width: width * 0.1),
          Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.black38,
              ),
              child: Image(image: AssetImage('assets/images/$imagetext.png'))),
          SizedBox(width: width * 0.05),
          Column(
            children: [
              Row(
                textBaseline: TextBaseline.alphabetic,
                children: [
                  // SizedBox(width: width * 0.1),
                  Text(
                    sunlight,
                    style: getRegularStyle(
                      color: ColorManger.white,
                    ),
                  ),
                  SizedBox(width: width * 0.01),
                  Text(
                    '%',
                    style: getRegularStyle(
                      color: ColorManger.white,
                    ),
                  ),
                ],
              ),
              SizedBox(width: width * 0.01),
              Text(
                '$title',
                style: getLightStyle(
                  color: ColorManger.white,
                  size: AppSize.s16,
                ),
              ),
            ],
          )
        ],
      );
}
