import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/cubit/app_cubit.dart';
import 'package:la_vie/cubit/app_states.dart';
import 'package:la_vie/presentation/resources/color_manager.dart';
import 'package:la_vie/presentation/resources/constant_manager.dart';
import 'package:la_vie/presentation/resources/styles_manager.dart';
import 'package:la_vie/presentation/resources/values_manager.dart';

import '../../data/models/seed_model.dart';

class SeedsView extends StatefulWidget {
  const SeedsView({Key? key}) : super(key: key);

  @override
  State<SeedsView> createState() => _SeedsViewState();
}

class _SeedsViewState extends State<SeedsView> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, Appstates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return LayoutBuilder(
          builder: (context, constraints) => Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              children: [
                Expanded(
                  child: GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1 / 1.4,
                      mainAxisSpacing: 0,
                      crossAxisSpacing: 5,
                    ),
                    itemBuilder: (context, index) => buildGridItem(
                      cubit,
                      index,
                      context,
                      cubit.seedsModel.data,
                      constraints,
                    ),
                    itemCount: cubit.seedsModel.data!.length,
                  ),
                ),
                SizedBox(height: constraints.maxHeight * 0.01),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildGridItem(AppCubit cubit, index, context, List<Data>? products,
          BoxConstraints constraints) =>
      Stack(
        children: [
          Card(
            elevation: 3,
            child: Container(
              height: constraints.maxHeight * 0.6,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  5,
                ),
                color: Colors.white,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(AppPadding.p8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 4,
                  child: Container(
                    width: double.infinity,
                    child: Row(
                      //  mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Image(
                            image: NetworkImage(
                              products![index].imageUrl == ''
                                  ? 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTwDYkq7zsjSqv-5UjNMRlZYhdyGREzwvvPwg&usqp=CAU'
                                  : 'https://lavie.orangedigitalcenteregypt.com${products[index].imageUrl}',
                            ),
                            fit: BoxFit.contain,
                          ),
                        ),
                        Expanded(
                          child: Stack(
                            alignment: AlignmentDirectional.center,
                            children: [
                              Container(
                                color: Colors.grey.shade200,
                                height: constraints.maxHeight * 0.06,
                                width: constraints.maxHeight * 0.06,
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    products[index].name;
                                  });
                                },
                                icon: Icon(
                                  Icons.remove,
                                  size: constraints.maxWidth * 0.05,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text('1',
                            style:
                                getRegularStyle(color: ColorManger.lightGrey)),
                        Expanded(
                          child: Stack(
                            alignment: AlignmentDirectional.center,
                            children: [
                              Container(
                                color: Colors.grey.shade200,
                                height: constraints.maxHeight * 0.06,
                                width: constraints.maxHeight * 0.06,
                              ),
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      products[index].name;
                                    });
                                  },
                                  icon: Icon(
                                    Icons.add,
                                    size: constraints.maxWidth * 0.05,
                                    color: Colors.grey,
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: constraints.maxHeight * 0.03),
                Expanded(
                  flex: 1,
                  child: Text(
                    '${products[index].name}',
                    style: getMediumStyle(color: ColorManger.black, size: 20),
                    maxLines: 1,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: constraints.maxHeight * 0.02),
                // Expanded(
                //   //   flex: 1,
                //   child: Text(
                //     '${products[index].waterCapacity}  EGP',
                //     style: getRegularStyle(
                //       color: ColorManger.black,
                //     ),
                //     //textAlign: TextAlign.start,
                //   ),
                // ),
                SizedBox(height: constraints.maxHeight * 0.01),
                //  Spacer(),
                Expanded(
                  child: Constant.deafaultButton(
                    buttonText: 'Add To My Chart',
                    onPressed: () {},
                    buttonColor: ColorManger.primary,
                    context: context,
                  ),
                )
              ],
            ),
          ),
        ],
      );
}
