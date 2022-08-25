// ignore_for_file: unnecessary_null_comparison

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/cubit/app_cubit.dart';
import 'package:la_vie/cubit/app_states.dart';
import 'package:la_vie/presentation/resources/color_manager.dart';
import 'package:la_vie/presentation/scan/real_scan_view.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ScanView extends StatefulWidget {
  const ScanView({Key? key}) : super(key: key);

  @override
  State<ScanView> createState() => _ScanViewState();
}

class _ScanViewState extends State<ScanView> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return BlocConsumer<AppCubit, Appstates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return SafeArea(
          child: Scaffold(
            backgroundColor: ColorManger.white,
            appBar: AppBar(
              backgroundColor: ColorManger.white,
              elevation: 0,
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => RealScanView(),
                      ));
                    },
                    icon: const Icon(
                      Icons.qr_code_scanner,
                      color: ColorManger.primary,
                    ))
              ],
            ),
            body: cubit.scanplants != null
                ? Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: [
                      //            QrCode(1, 1);
                      Center(
                        child: QrImage(
                          data: cubit.scanplants.data![8].name!,
                          backgroundColor: ColorManger.white,
                          size: 200,
                        ),
                      ),
                    ],
                  )
                : const Center(child: CircularProgressIndicator()),
          ),
        );
      },
    );
  }
}
