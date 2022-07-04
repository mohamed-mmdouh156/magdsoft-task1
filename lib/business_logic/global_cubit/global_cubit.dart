import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/data/remote/dio_helper.dart';
import 'package:magdsoft_flutter_structure/presentation/router/app_router.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/user/user_profile.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/toast.dart';

part 'global_state.dart';

class GlobalCubit extends Cubit<GlobalState> {
  GlobalCubit() : super(GlobalInitial());

  static GlobalCubit get(context) => BlocProvider.of(context);


  String ?userName;
  String ?userEmail;
  String ?userPhone;


  void createUser({
    required String fullName,
    required String email,
    required String phone,
    required String password,
    context
  }) {
    emit(CreateUserLoadingState());
    DioHelper.postData(url:'register', body: {
      'name': fullName,
      'email': email,
      'password': password,
      'phone': phone,
    }).then((value) {
      print(value.data['message']);
      Navigator.pushReplacementNamed(context, RoutesManager.loginRoute);
      emit(CreateUserSuccessState());
    }).catchError((error) {
      print('createUser Error is ${error.toString()}');
      emit(CreateUserErrorState());
    });
  }


  Future getUser({
    required String email,
    required String password,
    context
  }) async{
    emit(GetUserLoadingState());
    DioHelper.postData(url: 'login', body: {
      'email': email,
      'password': password
    }).then((value) {
      userName = value.data['account'][0]['name'];
      userEmail = value.data['account'][0]['email'];
      userPhone = value.data['account'][0]['phone'];

      Navigator.pushReplacementNamed(context, RoutesManager.profileRoute);

      emit(GetUserSuccessState());
    }).catchError((error) {
      print('getUser Error is ${error.toString()}');
      emit(GetUserErrorState());
    });
  }




}