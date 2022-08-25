import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:la_vie/cubit/app_cubit.dart';
import 'package:la_vie/cubit/app_states.dart';
import 'package:la_vie/presentation/home/home_view.dart';
import 'package:la_vie/presentation/layout/layout_view.dart';
import 'package:la_vie/presentation/person/preson_view.dart';
import 'package:la_vie/presentation/resources/color_manager.dart';
import 'package:la_vie/presentation/resources/constant_manager.dart';
import 'package:la_vie/presentation/resources/styles_manager.dart';
import 'package:la_vie/presentation/resources/values_manager.dart';

import 'package:page_transition/page_transition.dart';

class EditNameView extends StatelessWidget {
  EditNameView({Key? key}) : super(key: key);

  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var addressController = TextEditingController();
  var emailController = TextEditingController();

  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, Appstates>(
      listener: (context, state) {
        if (state is AppUpdateNameUserSucsessState) {
          Fluttertoast.showToast(
            msg: "user updated",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: ColorManger.primary,
            textColor: Colors.white,
            fontSize: 16.0,
          ).then((value) {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const HomeView(),
            ));
          });
        }
      },
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        var person = cubit.personModel.data;

        firstNameController.text = person!.firstName!;
        lastNameController.text = person.lastName!;
        addressController.text = person.address!;
        emailController.text = person.email!;

        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  PageTransition(
                    child: const HomeView(),
                    type: PageTransitionType.fade,
                    alignment: Alignment.center,
                    duration: const Duration(
                      milliseconds: 800,
                    ),
                  ),
                );
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
            ),
          ),
          body: LayoutBuilder(
            builder: (context, constraints) => SingleChildScrollView(
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Form(
                    key: formkey,
                    child: Column(
                      children: [
                        Text(
                          'Change Name',
                          style: getSemiboldStyle(
                            color: ColorManger.black,
                            size: AppSize.s25,
                          ),
                        ),
                        SizedBox(height: constraints.maxHeight * 0.02),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'First Name',
                              style: getRegularStyle(
                                color: ColorManger.black,
                                size: AppSize.s18,
                              ),
                            ),
                            SizedBox(height: constraints.maxHeight * 0.01),
                            Container(
                              color: Colors.grey.shade300,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 2,
                                  vertical: 5,
                                ),
                                child: Constant.deafualtTextformField(
                                  controller: firstNameController,
                                  saved: (saved) {},
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'First name must not be empty';
                                    }
                                    return null;
                                  },
                                  obsecure: false,
                                  enableborder: InputBorder.none,
                                ),
                              ),
                            ),
                            SizedBox(height: constraints.maxHeight * 0.02),
                            Text(
                              'Last Name',
                              style: getRegularStyle(
                                color: ColorManger.black,
                                size: AppSize.s18,
                              ),
                            ),
                            SizedBox(height: constraints.maxHeight * 0.01),
                            Container(
                              color: Colors.grey.shade300,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 2,
                                  vertical: 5,
                                ),
                                child: Constant.deafualtTextformField(
                                  controller: lastNameController,
                                  saved: (saved) {},
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'LAst Name must not be empty';
                                    }
                                    return null;
                                  },
                                  obsecure: false,
                                  enableborder: InputBorder.none,
                                ),
                              ),
                            ),
                            SizedBox(height: constraints.maxHeight * 0.02),
                            Text(
                              'Address',
                              style: getRegularStyle(
                                color: ColorManger.black,
                                size: AppSize.s18,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Container(
                              color: Colors.grey.shade300,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 2,
                                  vertical: 5,
                                ),
                                child: Constant.deafualtTextformField(
                                  controller: addressController,
                                  saved: (saved) {},
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Address must not be empty';
                                    }
                                    return null;
                                  },
                                  obsecure: false,
                                  enableborder: InputBorder.none,
                                ),
                              ),
                            ),
                            SizedBox(height: constraints.maxHeight * 0.02),
                            Text(
                              'Email',
                              style: getRegularStyle(
                                color: ColorManger.black,
                                size: AppSize.s18,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Container(
                              color: Colors.grey.shade300,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 2,
                                  vertical: 5,
                                ),
                                child: Constant.deafualtTextformField(
                                  controller: emailController,
                                  saved: (saved) {},
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Email must not be empty';
                                    }
                                    return null;
                                  },
                                  obsecure: false,
                                  enableborder: InputBorder.none,
                                ),
                              ),
                            ),
                            SizedBox(height: constraints.maxHeight * 0.1),
                            // ConditionalBuilderRec(
                            //   condition:
                            //       state is! AppUpdateNameUserLoadingState,
                            //   builder: (context) => Constant.deafaultButton(
                            //     buttonColor: ColorManger.primary,
                            //     buttonText: 'Save',
                            //     onPressed: () {
                            //       if (formkey.currentState!.validate()) {
                            //         cubit.updateUSer(
                            //           firstName: firstNameController.text,
                            //           lastName: lastNameController.text,
                            //           address: addressController.text,
                            //           email: emailController.text,
                            //         );
                            //       }
                            //     },
                            //     context: context,
                            //   ),
                            //   fallback: (context) => const Center(
                            //       child: CircularProgressIndicator()),
                            // ),
                            Constant.deafaultButton(
                              buttonColor: ColorManger.primary,
                              buttonText: 'Save',
                              onPressed: () {
                                if (formkey.currentState!.validate()) {
                                  cubit.updateUSer(
                                    firstName: firstNameController.text,
                                    lastName: lastNameController.text,
                                    address: addressController.text,
                                    email: emailController.text,
                                  );
                                }
                              },
                              context: context,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
