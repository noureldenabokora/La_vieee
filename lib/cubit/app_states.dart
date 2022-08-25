import 'package:la_vie/data/models/person_model.dart';
import 'package:la_vie/data/models/update_person_model.dart';
import 'package:la_vie/data/models/user_model.dart';

abstract class Appstates {}

class AppInitialState extends Appstates {}

class AppChangeNavBarState extends Appstates {}

class AppInitailbottomtabBarloginAndSignState extends Appstates {}

class ChangeBottomTabBarLoginAndSignState extends Appstates {
  final bool signup;
  final bool login;

  ChangeBottomTabBarLoginAndSignState(
    this.signup,
    this.login,
  );
}

class AppInitailbottomtabBarBuyOldSucsessState extends Appstates {}

class ChangeBottomTabBarBuyOldState extends Appstates {
  final bool all;
  final bool plants;
  final bool seeds;
  final bool tools;

  ChangeBottomTabBarBuyOldState(this.all, this.plants, this.seeds, this.tools);
}

class AppRegisterLoadingState extends Appstates {}

class AppRegisterSucsessState extends Appstates {
  final UserModel model;
  AppRegisterSucsessState(this.model);
}

class AppRegisterErorrtate extends Appstates {
  final UserModel model;
  AppRegisterErorrtate(this.model);
}

class AppLoginLoadingState extends Appstates {}

class AppLoginSucsessState extends Appstates {
  final UserModel model;
  AppLoginSucsessState(this.model);
}

class AppLoginErorrtate extends Appstates {
  final UserModel model;
  AppLoginErorrtate(this.model);
}

class AppAddCartItemSucsessState extends Appstates {}

class AppMiunsCartItemSucsessState extends Appstates {}

class AppRemoveItemFromCartSucsessState extends Appstates {}

class AppAddItemFromCartSucsessState extends Appstates {}

class AppUpdateNameUserLoadingState extends Appstates {}

class AppUpdateNameUserSucsessState extends Appstates {}

class AppUpdateNameUserErorrState extends Appstates {}

class AppUpdateEmailUserLoadingState extends Appstates {}

class AppUpdateEmailUserSucsessState extends Appstates {}

class AppUpdateEmailUserErorrState extends Appstates {}

class AppSelectPlanSucsessState extends Appstates {}

class AppRemmbermeCheckBoxSucsessState extends Appstates {}

class AppLoginWithGoogleLoadingState extends Appstates {}

class AppLoginWithGoogleSucsessState extends Appstates {}

class AppGoogleSigninLoadingState extends Appstates {}

class AppGoogleSigninSucsessState extends Appstates {
  // final UserModel model;
  // AppRegisterSucsessState(this.model);
}

class AppGoogleSigninErorrtate extends Appstates {
  // final UserModel model;
  // AppRegisterErorrtate(this.model);
}
