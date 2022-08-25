import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/cubit/app_cubit.dart';
import 'package:la_vie/cubit/app_states.dart';
import 'package:la_vie/presentation/resources/color_manager.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, Appstates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: CurvedNavigationBar(
            onTap: (index) {
              cubit.changeBottomNAvBAr(index);
            },
            backgroundColor: ColorManger.primary,
            index: cubit.currentIndex,
            items: [
              Icon(
                Icons.qr_code_scanner,
                color: ColorManger.black,
              ),
              Icon(
                Icons.qr_code_scanner_outlined,
                color: ColorManger.black,
              ),
              const Icon(
                Icons.home,
                color: ColorManger.primary,
              ),
              Icon(
                Icons.notifications,
                color: ColorManger.black,
              ),
              Icon(
                Icons.person,
                color: ColorManger.black,
              ),
            ],
          ),
        );
      },
    );
  }
}
