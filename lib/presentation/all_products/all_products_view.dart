import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/cubit/app_cubit.dart';
import 'package:la_vie/cubit/app_states.dart';
import 'package:la_vie/data/const/const.dart';
import 'package:la_vie/data/models/products_model.dart';
import 'package:la_vie/presentation/resources/color_manager.dart';
import 'package:la_vie/presentation/resources/constant_manager.dart';
import 'package:la_vie/presentation/resources/styles_manager.dart';
import 'package:la_vie/presentation/resources/values_manager.dart';

class ALlproducts extends StatefulWidget {
  const ALlproducts({Key? key}) : super(key: key);

  @override
  State<ALlproducts> createState() => _ALlproductsState();
}

class _ALlproductsState extends State<ALlproducts> {
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
                      cubit.productsModel.data,
                      constraints,
                    ),
                    itemCount: cubit.productsModel.data!.length,
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
                Container(
                  width: double.infinity,
                  child: Row(
                    //  mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Image(
                          image: NetworkImage(
                            '$BASEURL${products![index].imageUrl}',
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
                                // setState(() {
                                //   products[index].price;
                                // });
                                cubit.miunscartitem(index);
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
                      Text('${quantityList[index].quantity}',
                          style: getRegularStyle(color: ColorManger.lightGrey)),
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
                                  // setState(() {
                                  //   products[index].price;
                                  // });
                                  cubit.addcartitem(index);
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
                SizedBox(height: constraints.maxHeight * 0.03),
                Text(
                  '${products[index].name}',
                  style: getMediumStyle(color: ColorManger.black, size: 20),
                  maxLines: 1,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: constraints.maxHeight * 0.02),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      '${products[index].price}  EGP',
                      style: getRegularStyle(
                        color: ColorManger.black,
                      ),
                      //textAlign: TextAlign.start,
                    ),
                  ],
                ),
                SizedBox(height: constraints.maxHeight * 0.01),
                //  Spacer(),
                Constant.deafaultButton(
                  buttonText: 'Add To My Chart',
                  onPressed: () {
                    cubit.addItemFormCart(index);
                  },
                  buttonColor: ColorManger.primary,
                  context: context,
                )
              ],
            ),
          ),
        ],
      );
}
