import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/cubit/app_cubit.dart';
import 'package:la_vie/cubit/app_states.dart';
import 'package:la_vie/presentation/all_products/all_products_view.dart';
import 'package:la_vie/presentation/cart/cart_view.dart';
import 'package:la_vie/presentation/plants/plants_view.dart';
import 'package:la_vie/presentation/quiz_view/quiz_view.dart';
import 'package:la_vie/presentation/resources/assets_manager.dart';
import 'package:la_vie/presentation/resources/color_manager.dart';
import 'package:la_vie/presentation/resources/constant_manager.dart';
import 'package:la_vie/presentation/resources/styles_manager.dart';
import 'package:la_vie/presentation/resources/values_manager.dart';
import 'package:la_vie/presentation/search/search_view.dart';
import 'package:la_vie/presentation/seeds/seede_view.dart';
import 'package:la_vie/presentation/tools/tools_view.dart';
import 'package:page_transition/page_transition.dart';

class LayoutView extends StatelessWidget {
  // const LayoutView({Key? key}) : super(key: key);

  var searchControllrer = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return BlocConsumer<AppCubit, Appstates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            centerTitle: true,
            title: const Image(
              image: AssetImage(AssetsImages.splashLogo),
            ),
            elevation: 0,
            actions: [
              cubit.dayafterweek == DateTime(DateTime.now().day + 7)
                  ? CircleAvatar(
                      backgroundColor: ColorManger.primary,
                      child: IconButton(
                        onPressed: () {
                          // print(cubit.now);
                          print(cubit.dayafterweek.day);
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const QuizView(),
                          ));

                          // print(
                          //     "${cubit.lastDayOfMonth.month}/${cubit.lastDayOfMonth.day}");
                        },
                        icon: const Icon(Icons.question_mark),
                        color: ColorManger.white,
                      ),
                    )
                  : SizedBox(
                      width: width * .01,
                    ),
              SizedBox(width: width * 0.01)
            ],
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(height * 0.19),
              child: Container(
                height: height * 0.18,
                child: Padding(
                  padding: const EdgeInsets.all(AppPadding.p5),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 6,
                            child: Constant.deafualtTextformField(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => SearchView(),
                                ));
                              },
                              controller: searchControllrer,
                              keybordtype: TextInputType.name,
                              saved: (value) {},
                              obsecure: false,
                            ),
                          ),
                          SizedBox(width: width * 0.04),
                          Expanded(
                            //  flex: 1,
                            child: Stack(
                              alignment: AlignmentDirectional.center,
                              children: [
                                Container(
                                  width: double.infinity,
                                  height: height * 0.07,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(AppSize.s12),
                                    color: ColorManger.primary,
                                  ),
                                ),
                                IconButton(
                                  color: ColorManger.white,
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      PageTransition(
                                        child: const CartView(),
                                        type: PageTransitionType.fade,
                                        alignment: Alignment.center,
                                        duration: const Duration(
                                          milliseconds: 800,
                                        ),
                                      ),
                                    );

                                    cubit.getTotal();
                                  },
                                  icon: const Icon(
                                    Icons.shopping_cart,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: height * 0.02),
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: (() {
                                cubit.selectAll();
                                cubit.getProducts();
                              }),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: ColorManger.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      width: 1,
                                      color: cubit.all
                                          ? ColorManger.primary
                                          : ColorManger.darkGrey),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    'All',
                                    textAlign: TextAlign.center,
                                    style: getRegularStyle(
                                      color: cubit.all
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
                                cubit.selectPlants();
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      width: 1,
                                      color: cubit.plants
                                          ? ColorManger.primary
                                          : ColorManger.darkGrey),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    'Plants',
                                    textAlign: TextAlign.center,
                                    style: getRegularStyle(
                                      color: cubit.plants
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
                                cubit.selectSeeds();
                                cubit.getSeeds();
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 1,
                                    color: cubit.seeds
                                        ? ColorManger.primary
                                        : ColorManger.darkGrey,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    'Seeds',
                                    textAlign: TextAlign.center,
                                    style: getRegularStyle(
                                      color: cubit.seeds
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
                                cubit.selectTools();
                                //   cubit.getTools();
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1,
                                      color: cubit.tools
                                          ? ColorManger.primary
                                          : ColorManger.darkGrey),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    'tools',
                                    textAlign: TextAlign.center,
                                    style: getRegularStyle(
                                      color: cubit.tools
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
            if (state is AppInitailbottomtabBarBuyOldSucsessState) {
              return const ALlproducts();
            }

            if (state is ChangeBottomTabBarBuyOldState) {
              if (state.plants == true) {
                return const PlantsView();
              } else if (state.seeds == true) {
                return const SeedsView();
              } else if (state.tools == true) {
                return const ToolsView();
              } else if (state.all == true) {
                return const ALlproducts();
              }
            }
            return const ALlproducts();
          }),
        );
      },
    );
  }
}
