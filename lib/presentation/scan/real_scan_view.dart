// ignore_for_file: unnecessary_null_comparison

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/cubit/app_cubit.dart';
import 'package:la_vie/cubit/app_states.dart';
import 'package:la_vie/presentation/detail_scan/detail_scan_view.dart';
import 'package:la_vie/presentation/resources/color_manager.dart';
import 'package:la_vie/presentation/resources/styles_manager.dart';
import 'package:la_vie/presentation/resources/values_manager.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class RealScanView extends StatefulWidget {
  RealScanView({Key? key}) : super(key: key);

  @override
  State<RealScanView> createState() => _RealScanViewState();
}

class _RealScanViewState extends State<RealScanView> {
  final qrkey = GlobalKey();
  Barcode? barcode;

  QRViewController? controller;
  @override
  void dispose() {
    super.dispose();
    controller?.dispose();
  }

  @override
  void reassemble() async {
    super.reassemble();
    if (Platform.isAndroid) {
      await controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

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
            backgroundColor: ColorManger.primary,
            // appBar: AppBar(
            //   // backgroundColor: ColorManger.white,
            //   elevation: 0,
            //   actions: [
            //     IconButton(
            //         onPressed: () {}, icon: const Icon(Icons.qr_code_scanner))
            //   ],
            // ),

            body: Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                buildQrSCan(context, width),
                Positioned(
                  bottom: height * 0.05,
                  child: barcode != null
                      ? buildResult(width)
                      : Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white24,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            'Scan a code',
                            style: TextStyle(color: ColorManger.white),
                          ),
                        ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildResult(width) => Container(
        padding: const EdgeInsets.all(AppSize.s12),
        decoration: BoxDecoration(
            color: ColorManger.lightGrey,
            borderRadius: BorderRadius.circular(AppSize.s12)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              barcode!.code!,
              style:
                  getRegularStyle(color: ColorManger.black, size: AppSize.s25),
            ),
            //       Spacer(),
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const DetailScanView(),
                  ));
                },
                icon: Icon(
                  Icons.arrow_circle_right,
                  color: ColorManger.primary,
                  size: width * 0.1,
                ))
          ],
        ),
      );

  Widget buildQrSCan(BuildContext context, width) => QRView(
        key: qrkey,
        onQRViewCreated: onQRViewCreated,
        overlay: QrScannerOverlayShape(
          cutOutSize: width * 0.6,
          borderLength: 20,
          borderWidth: 10,
          borderColor: ColorManger.white,
        ),
      );

  void onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((barecode) {
      setState(() {
        this.barcode = barecode;
      });
    });
  }
}
