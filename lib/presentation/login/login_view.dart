// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:conditional_builder_rec/conditional_builder_rec.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:la_vie/cubit/app_cubit.dart';
import 'package:la_vie/cubit/app_states.dart';
import 'package:la_vie/data/shared/cached/shared_prefence.dart';
import 'package:la_vie/presentation/home/home_view.dart';
import 'package:la_vie/presentation/resources/assets_manager.dart';
import 'package:la_vie/presentation/resources/color_manager.dart';
import 'package:la_vie/presentation/resources/constant_manager.dart';
import 'package:la_vie/presentation/resources/font_manager.dart';
import 'package:la_vie/presentation/resources/styles_manager.dart';
import 'package:la_vie/presentation/resources/values_manager.dart';

class LoginView extends StatelessWidget {
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var emailRegisterController = TextEditingController();
  var passwordRegisterController = TextEditingController();
  var confirmPasswordController = TextEditingController();

  var emailLoginController = TextEditingController();
  var passwordLoginController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return BlocConsumer<AppCubit, Appstates>(
      listener: (context, state) {
        if (state is AppRegisterSucsessState) {
          Fluttertoast.showToast(
            msg: "${state.model.message}",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: ColorManger.primary,
            textColor: Colors.white,
            fontSize: 16.0,
          );

          CacheHellper.setData(
            key: 'apiToken',
            value: state.model.data!.accessToken,
          ).then((value) {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const HomeView(),
            ));
          });
        }
        if (state is AppLoginWithGoogleSucsessState) {
          Fluttertoast.showToast(
            msg: "google login sucessfully ",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: ColorManger.primary,
            textColor: Colors.white,
            fontSize: 16.0,
          );
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const HomeView(),
          ));

          print(AppCubit.get(context).googleAccount!.email);
        }
        if (state is AppRegisterErorrtate) {
          Fluttertoast.showToast(
            msg: "${state.model.message}",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0,
          );
        }

        if (state is AppLoginSucsessState) {
          Fluttertoast.showToast(
            msg: "${state.model.message}",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: ColorManger.primary,
            textColor: Colors.white,
            fontSize: 16.0,
          );

          CacheHellper.setData(
            key: 'apiToken',
            value: state.model.data!.accessToken,
          ).then((value) {
            print(state.model.data!.accessToken);

            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const HomeView(),
            ));
          });
        }
        if (state is AppLoginErorrtate) {
          Fluttertoast.showToast(
            msg: "${state.model.message}",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0,
          );
        }
      },
      builder: (context, state) {
        var cubit = AppCubit.get(context);

        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(145),
              child: Container(
                //height * 0.25
                height: 200,
                child: Padding(
                  padding: const EdgeInsets.all(AppPadding.p5),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Spacer(),
                          Image.asset(
                            AssetsImages.decorationUpTree,
                            height: height * 0.12,

                            //fit: BoxFit.fill,
                          ),
                        ],
                      ),
                      const Image(
                        image: AssetImage(AssetsImages.splashLogo),
                      ),
                      SizedBox(height: height * 0.02),
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: (() {
                                cubit.selectsignin();
                              }),
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      width: 2,
                                      color: cubit.signin
                                          ? ColorManger.primary
                                          : ColorManger.white,
                                    ),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    'SignIn',
                                    textAlign: TextAlign.center,
                                    style: getRegularStyle(
                                      color: cubit.signin
                                          ? ColorManger.primary
                                          : ColorManger.darkGrey,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: width * 0.04),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                cubit.selectLogin();
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      width: 2,
                                      color: cubit.login
                                          ? ColorManger.primary
                                          : ColorManger.white,
                                    ),
                                  ),
                                  //  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    'Login',
                                    textAlign: TextAlign.center,
                                    style: getRegularStyle(
                                      color: cubit.login
                                          ? ColorManger.primary
                                          : ColorManger.darkGrey,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          body: Builder(builder: (context) {
            if (state is AppInitailbottomtabBarloginAndSignState) {
              return BuildSignin(
                  height,
                  firstNameController,
                  lastNameController,
                  emailRegisterController,
                  passwordRegisterController,
                  confirmPasswordController,
                  cubit,
                  width,
                  state);
            }

            if (state is ChangeBottomTabBarLoginAndSignState) {
              if (state.signup == true) {
                return BuildSignin(
                    height,
                    firstNameController,
                    lastNameController,
                    emailRegisterController,
                    passwordRegisterController,
                    confirmPasswordController,
                    cubit,
                    width,
                    state);
              } else if (state.login == true) {
                return BuildLogin(height, emailLoginController,
                    passwordLoginController, cubit, width, state);
              }
            }
            return BuildLogin(height, emailLoginController,
                passwordLoginController, cubit, width, state);
          }),
        );
      },
    );
  }
}

class BuildSignin extends StatelessWidget {
  //const buildSignin({Key? key}) : super(key: key);
  BuildSignin(
    this.height,
    this.firstNameController,
    this.lastNameController,
    this.emailController,
    this.passwordController,
    this.confirmPasswordController,
    this.cubit,
    this.width,
    this.state,
  );
  double height;
  double width;
  var firstNameController;
  var lastNameController;
  var emailController;
  var passwordController;
  var confirmPasswordController;
  AppCubit cubit;
  Appstates state;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('First Name',
                          style: getRegularStyle(
                            color: ColorManger.darkGrey,
                            size: FontSize.s14,
                          )),
                      SizedBox(height: height * 0.01),
                      Constant.deafualtTextformField(
                        controller: firstNameController,
                        keybordtype: TextInputType.name,
                        saved: (value) {},
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'First name Must not be Empty';
                          }
                          return null;
                        },
                        obsecure: false,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Last Name',
                            style: getRegularStyle(
                              size: FontSize.s14,
                              color: ColorManger.darkGrey,
                            )),
                        SizedBox(height: height * 0.01),
                        Constant.deafualtTextformField(
                          controller: lastNameController,
                          keybordtype: TextInputType.name,
                          saved: (value) {},
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Last name Must not be Empty';
                            }
                            return null;
                          },
                          obsecure: false,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Text('E-mail',
                style: getRegularStyle(
                  size: FontSize.s14,
                  color: ColorManger.darkGrey,
                )),
            SizedBox(height: height * 0.01),
            Constant.deafualtTextformField(
              controller: emailController,
              keybordtype: TextInputType.name,
              saved: (value) {},
              validator: (value) {
                if (value!.isEmpty) {
                  return 'E-mail Must not be Empty';
                }
                return null;
              },
              obsecure: false,
            ),
            SizedBox(height: height * 0.01),
            Text('Password',
                style: getRegularStyle(
                  size: FontSize.s14,
                  color: ColorManger.darkGrey,
                )),
            SizedBox(height: height * 0.01),
            Constant.deafualtTextformField(
              controller: passwordController,
              keybordtype: TextInputType.name,
              saved: (value) {},
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Password Must not be Empty';
                }
                return null;
              },
              obsecure: false,
            ),
            SizedBox(height: height * 0.01),
            Text('Confirm password',
                style: getRegularStyle(
                  size: FontSize.s14,
                  color: ColorManger.darkGrey,
                )),
            SizedBox(height: height * 0.01),
            Constant.deafualtTextformField(
              controller: confirmPasswordController,
              keybordtype: TextInputType.name,
              saved: (value) {},
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Confirm password  Must not be Empty';
                }
                return null;
              },
              obsecure: false,
            ),

            SizedBox(height: height * 0.02),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ConditionalBuilderRec(
                condition: state is! AppRegisterLoadingState,
                builder: (context) => Constant.deafaultButton(
                  buttonColor: ColorManger.primary,
                  buttonText: 'Sign Up',
                  onPressed: () {
                    if (cubit.formRegisterKey.currentState!.validate()) {
                      cubit.register(
                        firstName: firstNameController.text,
                        lastName: lastNameController.text,
                        email: emailController.text,
                        password: passwordController.text,
                      );
                    }
                  },
                  context: context,
                ),
                fallback: (context) =>
                    const Center(child: CircularProgressIndicator()),
              ),
            ),
            SizedBox(height: height * 0.01),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: width * 0.09,
                      height: AppSize.s1_5,
                      color: ColorManger.lightGrey,
                    ),
                    SizedBox(width: width * 0.02),
                    Text(
                      'or continue with',
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontSize: FontSize.s16,
                            color: Colors.black54,
                          ),
                    ),
                    SizedBox(width: width * 0.02),
                    Container(
                      width: width * 0.09,
                      height: AppSize.s1_5,
                      color: ColorManger.lightGrey,
                    ),
                  ],
                ),
                SizedBox(height: height * 0.01),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                        onTap: () {},
                        child: SvgPicture.asset(AssetsImages.google)),
                    SizedBox(width: width * 0.07),
                    InkWell(
                        onTap: () {},
                        child: SvgPicture.asset(AssetsImages.facebook)),
                  ],
                ),
              ],
            ),
            //    const Spacer(),
            Row(
              children: [
                Image.asset(
                  AssetsImages.decorationDownTree,
                  height: height * 0.11,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class BuildLogin extends StatelessWidget {
  BuildLogin(
    this.height,
    this.emailController,
    this.passwordController,
    this.cubit,
    this.width,
    this.state,
  );
  double height;
  double width;
  var emailController;
  var passwordController;
  AppCubit cubit;
  Appstates state;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: cubit.formloginKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('E-mail',
                  style: getRegularStyle(
                    size: FontSize.s14,
                    color: ColorManger.darkGrey,
                  )),
              SizedBox(height: height * 0.01),
              Constant.deafualtTextformField(
                controller: emailController,
                keybordtype: TextInputType.name,
                saved: (value) {},
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'E-mail Must not be Empty';
                  }
                  return null;
                },
                obsecure: false,
              ),
              SizedBox(height: height * 0.06),
              Text('Password',
                  style: getRegularStyle(
                    size: FontSize.s14,
                    color: ColorManger.darkGrey,
                  )),
              SizedBox(height: height * 0.01),
              Constant.deafualtTextformField(
                controller: passwordController,
                keybordtype: TextInputType.name,
                saved: (value) {},
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Password Must not be Empty';
                  }
                  return null;
                },
                obsecure: false,
              ),
              SizedBox(height: height * 0.02),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ConditionalBuilderRec(
                  condition: state is! AppRegisterLoadingState,
                  builder: (context) => Constant.deafaultButton(
                    buttonColor: ColorManger.primary,
                    buttonText: 'Sign In',
                    onPressed: () {
                      if (cubit.formloginKey.currentState!.validate()) {
                        cubit.userLogin(
                            email: emailController.text,
                            password: passwordController.text);
                      }
                    },
                    context: context,
                  ),
                  fallback: (context) =>
                      const Center(child: CircularProgressIndicator()),
                ),
              ),

              SizedBox(height: height * 0.01),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: width * 0.09,
                        height: AppSize.s1_5,
                        color: ColorManger.lightGrey,
                      ),
                      SizedBox(width: width * 0.02),
                      Text(
                        'or continue with',
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              fontSize: FontSize.s16,
                              color: Colors.black54,
                            ),
                      ),
                      SizedBox(width: width * 0.02),
                      Container(
                        width: width * 0.09,
                        height: AppSize.s1_5,
                        color: ColorManger.lightGrey,
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.01),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                          onTap: () {
                            cubit.loginWithGoogle().then((value) =>
                                cubit.postSignInGoogle(
                                  id: cubit.googleAccount!.id,
                                  email: cubit.googleAccount!.email,
                                  firstName: cubit.googleAccount!.displayName!,
                                  lastName: cubit.googleAccount!.displayName!,
                                  picture: cubit.googleAccount!.photoUrl!,
                                ));
                          },
                          child: SvgPicture.asset(AssetsImages.google)),
                      SizedBox(width: width * 0.07),
                      InkWell(
                          onTap: () {},
                          child: SvgPicture.asset(AssetsImages.facebook)),
                    ],
                  ),
                ],
              ),
              //     const Spacer(),
              SizedBox(height: height * 0.05),

              Row(
                children: [
                  Image.asset(
                    AssetsImages.decorationDownTree,
                    height: height * 0.11,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
