import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/cubit/app_cubit.dart';
import 'package:la_vie/cubit/app_states.dart';
import 'package:la_vie/data/const/const.dart';
import 'package:la_vie/data/models/products_model.dart';
import 'package:la_vie/presentation/resources/color_manager.dart';
import 'package:la_vie/presentation/resources/styles_manager.dart';
import 'package:la_vie/presentation/resources/values_manager.dart';

class BlogsView extends StatelessWidget {
  const BlogsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return BlocConsumer<AppCubit, Appstates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
          body: ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) =>
                buildCartItem(context, index, cubit, height, width),
            itemCount: cubit.plantsModel.data!.length,
            separatorBuilder: (context, index) => const SizedBox(height: 2),
          ),
        );
      },
    );
  }

  buildCartItem(context, index, AppCubit cubit, height, width) =>
      GestureDetector(
        onTap: () {},
        child: Card(
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                    flex: 2,
                    child: Image(
                      image: NetworkImage(
                        cubit.plantsModel.data![index].imageUrl == ""
                            ? cubit.plantsModel.data![index].imageUrl!
                            : 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQEVh2EdmmmOx385qi0qU9N52rIBzgEOIdLgByN_xWMyg&s',
                      ),
                    )
                    //      cubit.plantsModel.data![index].imageUrl != null ?
                    //            Image.network(
                    //       '$BASEURL${cubit.plantsModel.data![index].imageUrl}',
                    //       height: 80,
                    //     )
                    //  :   NetworkImage('url'),
                    //     ,
                    ),
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${cubit.plantsModel.data![index].name}',
                        style: getRegularStyle(
                            color: ColorManger.black, size: AppSize.s20),
                      ),
                      SizedBox(height: height * 0.03),
                      Text('${cubit.plantsModel.data![index].name}',
                          style: getRegularStyle(
                              color: ColorManger.primary, size: AppSize.s16)),
                      SizedBox(height: height * 0.03),
                      Text('${cubit.plantsModel.data![index].description}',
                          style: getRegularStyle(
                              color: ColorManger.lightGrey, size: AppSize.s12)),
                      // Container(
                      //   decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(AppSize.s14),
                      //     color: Colors.grey.shade100,
                      //   ),
                      //   child: Row(
                      //     children: [
                      //       IconButton(
                      //         onPressed: () {
                      //           cubit.miunscartitem(index);
                      //         },
                      //         icon: const Icon(
                      //           Icons.remove,
                      //         ),
                      //         color: ColorManger.primary,
                      //         alignment: Alignment.center,
                      //       ),
                      //       const Spacer(),
                      //       Text(
                      //         '${quantityList[index].quantity}',
                      //       ),
                      //       const Spacer(),
                      //       IconButton(
                      //         onPressed: () {
                      //           cubit.addcartitem(index);
                      //         },
                      //         icon: const Icon(
                      //           Icons.add,
                      //         ),
                      //         color: ColorManger.primary,
                      //         alignment: Alignment.center,
                      //       ),
                      //     ],
                      //   ),
                      // ),
                    ],
                  ),
                ),
                // const Spacer(),
                // Expanded(
                //   child: CircleAvatar(
                //     backgroundColor: Colors.grey.withOpacity(0.1),
                //     child: IconButton(
                //         onPressed: () {
                //           cubit.clearItemFormCart(index);
                //         },
                //         icon: const Icon(
                //           Icons.delete,
                //           color: ColorManger.primary,
                //           size: 22,
                //         )),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      );
}
