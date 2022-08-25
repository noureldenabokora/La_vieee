import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:la_vie/cubit/app_cubit.dart';
import 'package:la_vie/cubit/app_states.dart';
import 'package:la_vie/data/const/const.dart';
import 'package:la_vie/data/models/products_model.dart';
import 'package:la_vie/presentation/resources/color_manager.dart';
import 'package:la_vie/presentation/resources/constant_manager.dart';
import 'package:la_vie/presentation/resources/styles_manager.dart';
import 'package:la_vie/presentation/resources/values_manager.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return BlocConsumer<AppCubit, Appstates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        // var total = cubit.cartItems[0].data![0].price! +
        //     cubit.cartItems[1].data![1].price!;
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 8,
            ),
            child: cubit.cartItems.isNotEmpty
                ? Column(
                    children: [
                      Expanded(
                        flex: 4,
                        child: ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) => buildCartItem(
                              context, index, cubit, height, width),
                          itemCount: cubit.cartItems.length,
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 2),
                        ),
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          const Text('Total'),
                          const Spacer(),
                          Text(
                            '${cubit.total}',
                            style: getRegularStyle(
                                color: ColorManger.primary, size: AppSize.s18),
                          ),
                          SizedBox(width: width * 0.01),
                          Text(
                            'EGP',
                            style: getRegularStyle(
                                color: ColorManger.primary, size: AppSize.s18),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Constant.deafaultButton(
                        buttonText: 'CheckOut',
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        context: context,
                      ),
                    ],
                  )
                : Center(
                    child: Column(
                      children: [
                        Expanded(
                            flex: 3,
                            child: SvgPicture.asset('assets/svg/Frame.svg')),
                        Text(
                          'Your Cart is Empty',
                          style: getSemiboldStyle(
                            size: AppSize.s40,
                            color: ColorManger.black,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            '  Sorry, the keyword you entered cannot be found, please check again or search with another keyword.',
                            style: getSemiboldStyle(
                              size: AppSize.s14,
                              color: Colors.black45,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
          ),
        );
      },
    );
  }

  buildCartItem(context, index, AppCubit cubit, height, width) => Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Image.network(
                  '$BASEURL${cubit.cartItems[index].data![index].imageUrl}',
                  height: 80,
                ),
              ),
              // const SizedBox(width: 4),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${cubit.cartItems[index].data![index].name}',
                      style: getRegularStyle(
                          color: ColorManger.black, size: AppSize.s20),
                    ),
                    SizedBox(height: height * 0.03),
                    Text('${cubit.cartItems[index].data![index].price}  EGP',
                        style: getRegularStyle(
                            color: ColorManger.primary, size: AppSize.s16)),
                    SizedBox(height: height * 0.03),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppSize.s14),
                        color: Colors.grey.shade100,
                      ),
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              cubit.miunscartitem(index);
                            },
                            icon: const Icon(
                              Icons.remove,
                            ),
                            color: ColorManger.primary,
                            alignment: Alignment.center,
                          ),
                          const Spacer(),
                          Text(
                            '${quantityList[index].quantity}',
                          ),
                          const Spacer(),
                          IconButton(
                            onPressed: () {
                              cubit.addcartitem(index);
                            },
                            icon: const Icon(
                              Icons.add,
                            ),
                            color: ColorManger.primary,
                            alignment: Alignment.center,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Expanded(
                child: CircleAvatar(
                  backgroundColor: Colors.grey.withOpacity(0.1),
                  child: IconButton(
                      onPressed: () {
                        cubit.clearItemFormCart(index);
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: ColorManger.primary,
                        size: 22,
                      )),
                ),
              ),
            ],
          ),
        ),
      );
}
