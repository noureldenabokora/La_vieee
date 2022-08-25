import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:la_vie/cubit/app_cubit.dart';
import 'package:la_vie/cubit/app_states.dart';
import 'package:la_vie/data/const/const.dart';
import 'package:la_vie/presentation/person/edit_name_person.dart';
import 'package:la_vie/presentation/resources/color_manager.dart';
import 'package:la_vie/presentation/resources/styles_manager.dart';
import 'package:la_vie/presentation/resources/values_manager.dart';

class PersonView extends StatelessWidget {
  const PersonView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return BlocConsumer<AppCubit, Appstates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);

        var points = cubit.personModel.data!.userPoints ?? 0;

        return SafeArea(
          child: Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Stack(
                      children: [
                        Expanded(
                          child: Image(
                            image: NetworkImage(
                              //   '${cubit.personModel.data!.imageUrl}',

                              '$BASEURL${cubit.plantsModel.data![3].imageUrl}',
                            ),
                            height: height * 0.3,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          color: Colors.black54,
                          height: height * 0.3,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                            // 'https://res.cloudinary.com/lms07/image/upload/v1645954589/avatar/6214b94ad832b0549b436264_avatar1645954588291.png'
                            '${cubit.personModel.data!.imageUrl}',
                          ),
                          maxRadius: height * 0.1,
                        ),
                        SizedBox(height: height * 0.02),
                        Text(
                          '${cubit.personModel.data!.firstName}  ${cubit.personModel.data!.lastName} ',
                          style: getSemiboldStyle(
                              color: ColorManger.white, size: AppSize.s20),
                        )
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        color: ColorManger.primary.withOpacity(0.3),
                        padding: const EdgeInsets.all(AppSize.s12),
                        child: Row(
                          children: [
                            SvgPicture.asset('assets/svg/points.svg'),
                            SizedBox(width: width * 0.02),
                            Text('You have $points  points'),
                          ],
                        ),
                      ),
                      SizedBox(height: height * 0.02),
                      Text(
                        'Edit profile',
                        style: getRegularStyle(
                            color: ColorManger.black, size: AppSize.s16),
                      ),
                      SizedBox(height: height * 0.02),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => EditNameView(),
                          ));
                        },
                        child: Container(
                          height: height * 0.1,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                width: 2,
                                color: ColorManger.lightGrey,
                              )),
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 1,
                                  child:
                                      SvgPicture.asset('assets/svg/icon.svg')),
                              Expanded(
                                  flex: 2,
                                  child: Text(
                                    'Update User ',
                                    style: getRegularStyle(
                                        color: ColorManger.black,
                                        size: AppSize.s16),
                                  )),
                              Expanded(
                                child: IconButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) => EditNameView(),
                                    ));
                                  },
                                  icon: const Icon(Icons.arrow_forward),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: height * 0.02),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: height * 0.1,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                width: 2,
                                color: ColorManger.lightGrey,
                              )),
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 1,
                                  child:
                                      SvgPicture.asset('assets/svg/icon.svg')),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  'Change Email',
                                  style: getRegularStyle(
                                      color: ColorManger.black,
                                      size: AppSize.s16),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.arrow_forward),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
