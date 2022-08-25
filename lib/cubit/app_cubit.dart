import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:intl/intl.dart';
import 'package:la_vie/cubit/app_states.dart';
import 'package:la_vie/data/const/const.dart';
import 'package:la_vie/data/models/blogs_model.dart';
import 'package:la_vie/data/models/person_model.dart';
import 'package:la_vie/data/models/plants_model.dart';
import 'package:la_vie/data/models/products_model.dart';
import 'package:la_vie/data/models/search_model.dart';
import 'package:la_vie/data/models/seed_model.dart';
import 'package:la_vie/data/models/tools_model.dart';
import 'package:la_vie/data/models/update_person_model.dart';
import 'package:la_vie/data/models/user_model.dart';
import 'package:la_vie/data/shared/dio/dio_helper.dart';
import 'package:la_vie/presentation/blogs/blogs_view.dart';
import 'package:la_vie/presentation/layout/layout_view.dart';
import 'package:la_vie/presentation/notification/notification_view..dart';
import 'package:la_vie/presentation/person/preson_view.dart';
import 'package:la_vie/presentation/scan/scan_view.dart';

class AppCubit extends Cubit<Appstates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  List<Widget> screens = [
    const BlogsView(),
    const ScanView(),
    LayoutView(),
    const NotificationView(),
    const PersonView(),
  ];

  int currentIndex = 0;

  void changeBottomNAvBAr(int index) {
    //getBlogs();
    currentIndex = index;
    if (index == 0) getBlogs();
    if (index == 1) scanPlants();
    if (index == 4) getPerson();

    emit(AppChangeNavBarState());
  }

  bool signin = true;
  bool login = false;

  void selectsignin() {
    emit(AppInitailbottomtabBarloginAndSignState());

    signin = true;
    login = false;

    emit(ChangeBottomTabBarLoginAndSignState(signin, login));
  }

  void selectLogin() {
    emit(AppInitailbottomtabBarloginAndSignState());

    signin = false;
    login = true;

    emit(ChangeBottomTabBarLoginAndSignState(signin, login));
  }

  bool all = true;
  bool plants = false;
  bool seeds = false;
  bool tools = false;

  void selectAll() {
    emit(AppInitailbottomtabBarBuyOldSucsessState());
    all = true;
    plants = false;
    seeds = false;
    tools = false;

    emit(ChangeBottomTabBarBuyOldState(all, plants, seeds, tools));
  }

  void selectPlants() {
    emit(AppInitailbottomtabBarBuyOldSucsessState());

    all = false;
    plants = true;
    seeds = false;
    tools = false;
    emit(ChangeBottomTabBarBuyOldState(all, plants, seeds, tools));
  }

  void selectSeeds() {
    emit(AppInitailbottomtabBarBuyOldSucsessState());

    all = false;
    plants = false;
    seeds = true;
    tools = false;

    emit(ChangeBottomTabBarBuyOldState(all, plants, seeds, tools));
  }

  void selectTools() {
    emit(AppInitailbottomtabBarBuyOldSucsessState());

    all = false;
    plants = false;
    seeds = false;
    tools = true;

    emit(ChangeBottomTabBarBuyOldState(all, plants, seeds, tools));
  }

  UserModel? user;
  void register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) {
    emit(AppRegisterLoadingState());
    DioHelper.postData(
      url: SIGNUP,
      data: {
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'password': password,
      },
    ).then((value) {
      user = UserModel.fromJson(value.data);

      emit(AppRegisterSucsessState(user!));
    }).catchError((erorr) {
      print(erorr.toString());
      emit(AppRegisterErorrtate(user!));
    });
  }

  var formRegisterKey = GlobalKey<FormState>();

  var formloginKey = GlobalKey<FormState>();

  void userLogin({
    required String email,
    required String password,
  }) {
    emit(ChangeBottomTabBarLoginAndSignState(signin, login));

    emit(AppLoginLoadingState());
    DioHelper.postData(
      url: SIGNIN,
      data: {
        'password': password,
        'email': email,
      },
    ).then((value) {
      user = UserModel.fromJson(value.data);
      emit(ChangeBottomTabBarLoginAndSignState(signin, login));

      emit(AppLoginSucsessState(user!));
    }).catchError((erorr) {
      print(erorr.toString());
      emit(AppLoginErorrtate(user!));
    });
  }

  late ToolsModel toolsModel;

  void getTools() {
    DioHelper.getData(
      url: TOOLS,
      token: apiToken,
    ).then((value) {
      toolsModel = ToolsModel.fromJson(value.data);
    }).catchError((erorr) {
      print(erorr.toString());
    });
  }

  late ProductsModel productsModel;

  void getProducts() {
    DioHelper.getData(
      url: PROODUCTS,
      token: apiToken,
    ).then((value) {
      productsModel = ProductsModel.fromJson(value.data);
    }).catchError((erorr) {
      print(erorr.toString());
    });
  }

  late PlantsModel plantsModel;

  void getPlants() {
    DioHelper.getData(
      url: PLANTS,
      token: apiToken,
    ).then((value) {
      plantsModel = PlantsModel.fromJson(value.data);
    }).catchError((erorr) {
      print(erorr.toString());
    });
  }

  late SeedsModel seedsModel;

  void getSeeds() {
    DioHelper.getData(
      url: SEEDS,
      token: apiToken,
    ).then((value) {
      seedsModel = SeedsModel.fromJson(value.data);
    }).catchError((erorr) {
      print(erorr.toString());
    });
  }

  late SearchModel searchModel;
  List plattts = [];

  Future getSearch(String query) async {
    await DioHelper.getData(
      url: SEARCH,
      token: apiToken,
    ).then((value) {
      plattts.map((e) => SearchModel.fromJson(value.data)).where((book) {
        final plant = book.data!.plants!;
        final seed = book.data!.seeds;
        final tool = book.data!.seeds;
        final searchLower = query.toLowerCase();

        return plant.contains(searchLower) ||
            seed!.contains(searchLower) ||
            tool!.contains(searchLower);
      }).toList();

      print(plattts);
    }).catchError((erorr) {
      print(erorr.toString());
    });
  }

  //<ProductsModel>

  void addcartitem(int index) {
    quantityList[index].quantity++;

    emit(AppAddCartItemSucsessState());
  }

  void miunscartitem(int index) {
    quantityList[index].quantity == 1 ? null : quantityList[index].quantity--;

    emit(AppMiunsCartItemSucsessState());
  }

  List<ProductsModel> cartItems = [];
  List<Quan> quantityItems = [];

  void addItemFormCart(int index) {
    cartItems.add(
      ProductsModel(
        productsModel.message,
        productsModel.type,
        productsModel.data,
        quantityList[index].quantity,
      ),
    );

    print(cartItems[index].data![index].name);
    print(quantityList[index].quantity);

    emit(AppAddItemFromCartSucsessState());
  }

  void clearItemFormCart(int index) {
    cartItems.removeAt(index);
    emit(AppRemoveItemFromCartSucsessState());
  }

  var total;

  void getTotal() {
    total = cartItems[0].data![0].price! +
        cartItems[1].data![1].price! +
        cartItems[2].data![2].price!;
  }

  // void gettotal() {
  //   cartItems.forEach((element) {
  //     element.data!.;
  //   });
  // }

  late BlogsModel blogsModel;

  void getBlogs() {
    DioHelper.getData(
      url: BLOGS,
      token: apiToken,
    ).then((value) {
      blogsModel = BlogsModel.fromJson(value.data);
    }).catchError((erorr) {
      print(erorr.toString());
    });
  }

  late PlantsModel scanplants;

  void scanPlants() {
    DioHelper.getData(
      url: GetScanPlants,
      token: apiToken,
    ).then((value) {
      scanplants = PlantsModel.fromJson(value.data);
      print(scanplants.data![0].imageUrl);
    }).catchError((erorr) {
      print(erorr.toString());
    });
  }

  late PersonModel personModel;

  void getPerson() {
    DioHelper.getData(
      url: GETPERSON,
      token: apiToken,
    ).then((value) {
      personModel = PersonModel.fromJson(value.data);

      print(personModel.data!.firstName);
    }).catchError((erorr) {
      print(erorr.toString());
    });
  }

  late UpdatePerson updatePersonModel;

  void updateUSer({
    required String firstName,
    required String lastName,
    required String email,
    required String address,
  }) {
    emit(AppUpdateNameUserLoadingState());
    DioHelper.updateData(
      url: GETPERSON,
      token: apiToken,
      data: {
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'address': address,
      },
    ).then((value) {
      print('sucsess');

      updatePersonModel = UpdatePerson.fromJson(value.data);
      print(updatePersonModel.data!.firstName);
      print(updatePersonModel.data!.address);
      print(updatePersonModel.data!.email);

      emit(AppUpdateNameUserSucsessState());
    }).catchError((erorr) {
      print(erorr.toString());
      emit(AppUpdateNameUserErorrState());
    });
  }

  static DateTime now = DateTime.now();
  DateFormat formatter = DateFormat('yyyy-MM-dd');
//  String formatted = formatter.format(now);

  DateTime dayafterweek = DateTime(now.day + 7);

  bool selectedPlan1 = false;
  bool selectedPlan2 = false;
  bool selectedPlan3 = false;

  void selectPlan1() {
    selectedPlan1 = !selectedPlan1;
    selectedPlan2 = false;
    selectedPlan3 = false;

    if (selectedPlan1 == true) {
      monthsPlanone = true;
      daysperWeekPlanOne = true;
      gagggPlanOne = true;
      monthsPlanTwo = false;
      daysperWeekPlanTwo = false;
      gagggPlanTwo = false;
      monthsPlanThree = false;
      daysperWeekPlanThree = false;
      gagggPlanThree = false;
    }
    if (selectedPlan1 == false) {
      monthsPlanone = false;
      daysperWeekPlanOne = false;
      gagggPlanOne = false;
    }

    emit(AppSelectPlanSucsessState());
  }

  void selectPlan2() {
    selectedPlan2 = !selectedPlan2;
    selectedPlan1 = false;
    selectedPlan3 = false;

    if (selectedPlan2 == true) {
      // monthsPlanTwo = true;
      // daysperWeekPlanTwo = true;
      // gagggPlanTwo = true;

      // monthsPlanone = false;
      // daysperWeekPlanOne = false;
      // gagggPlanOne = false;
      // monthsPlanThree = false;
      // daysperWeekPlanThree = false;
      // gagggPlanThree = false;
    }
    if (selectedPlan2 == false) {
      // monthsPlanTwo = false;
      // daysperWeekPlanTwo = false;
      // gagggPlanTwo = false;
    }
    emit(AppSelectPlanSucsessState());
  }

  void selectPlan3() {
    selectedPlan3 = !selectedPlan3;
    selectedPlan2 = false;
    selectedPlan1 = false;
    if (selectedPlan3 == true) {
      // monthsPlanThree = true;
      // daysperWeekPlanThree = true;
      // gagggPlanThree = true;

      // monthsPlanone = false;
      // daysperWeekPlanOne = false;
      // gagggPlanOne = false;
      // monthsPlanTwo = false;
      // daysperWeekPlanTwo = false;
      // gagggPlanTwo = false;
    }
    if (selectedPlan3 == false) {
      // monthsPlanThree = false;
      // daysperWeekPlanThree = false;
      // gagggPlanThree = false;
    }
    emit(AppSelectPlanSucsessState());
  }

  bool monthsPlanone = false;

  void monthsPlanOneCheckBox(bool valueone) {
    monthsPlanone = valueone;

    emit(AppRemmbermeCheckBoxSucsessState());
  }

  bool daysperWeekPlanOne = false;
  bool gagggPlanOne = false;

  bool monthsPlanTwo = false;
  bool daysperWeekPlanTwo = false;
  bool gagggPlanTwo = false;

  bool monthsPlanThree = false;
  bool daysperWeekPlanThree = false;
  bool gagggPlanThree = false;

  var googleSignIn = GoogleSignIn();
  GoogleSignInAccount? googleAccount;

  Future<void> loginWithGoogle() async {
    emit(AppLoginWithGoogleLoadingState());

    googleAccount = await googleSignIn.signIn();
    print(googleAccount!.email);
    emit(AppLoginWithGoogleSucsessState());
  }

  //UserModel? user;
  void postSignInGoogle({
    required String id,
    required String email,
    required String firstName,
    required String lastName,
    required String picture,
  }) {
    emit(AppRegisterLoadingState());
    DioHelper.postData(
      url: PostGoogleSignin,
      data: {
        'id': id,
        'email': email,
        'firstName': firstName,
        'lastName': lastName,
        'picture': picture,
      },
    ).then((value) {
      // user = UserModel.fromJson(value.data);
      print(value.data);
      emit(AppRegisterSucsessState(user!));
    }).catchError((erorr) {
      print(erorr.toString());
      emit(AppRegisterErorrtate(user!));
    });
  }
}
