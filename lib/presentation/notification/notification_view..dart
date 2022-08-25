import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/cubit/app_cubit.dart';
import 'package:la_vie/cubit/app_states.dart';
import 'package:la_vie/data/models/notificatiom_model.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, Appstates>(
      listener: (context, state) {
        // if (state is AppDeleteNotificationsSucsessState) {
        //   Fluttertoast.showToast(
        //     msg: "Notification  Deleted  successfully",
        //     toastLength: Toast.LENGTH_SHORT,
        //     gravity: ToastGravity.BOTTOM,
        //     timeInSecForIosWeb: 1,
        //     backgroundColor: deafaultColor,
        //     textColor: Colors.white,
        //     fontSize: 16.0,
        //   );
        // }
      },
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
          body: SafeArea(
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) =>
                  notifItem(context, notificationList, index),
              separatorBuilder: (context, index) => Container(
                height: 2,
                color: const Color(0xffF2F2F5),
              ),
              itemCount: notificationList.length,
            ),
          ),
        );
      },
    );
  }

  Widget notifItem(context, notificationList, index) => Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 5,
          vertical: 10,
        ),
        child: ListTile(
          leading: CircleAvatar(
            child: Image(
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
                image: NetworkImage(
                  '${notificationList[index].imageUrl}',
                )),
          ),
          title: Text(
            '${notificationList[index].textNotification}',
            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                  color: Colors.black,
                  fontSize: 14,
                ),
          ),
          subtitle: Text(
            '${notificationList[index].date}',
            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                  color: const Color(0xff686874),
                  fontSize: 12,
                ),
          ),
          // trailing: Text(
          //   '${model.data?.datalist[index].notify_custom_date}',
          //   style: Theme.of(context).textTheme.bodyText2!.copyWith(
          //         //color: Colors.black,
          //         //    height: 1.2,
          //         //  color: Color(0xff686874),
          //         fontSize: 8,
          //         wordSpacing: 0.1,
          //       ),
          // ),
        ),
      );
}
