import 'dart:developer';

import 'package:bookia_app/core/constants/constants.dart';
import 'package:bookia_app/features/auth/data/models/post_auth_response/post_auth_response.dart';
import 'package:bookia_app/features/auth/presentation/manager/auth_states.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitialState());

  // login

  // register
  register({
    required String name,
    required String email,
    required String password,
    required String passwordConfirmation,
  }) async {
    emit(RegisterLoadingState());
    try {
      await Dio().post('${kBaseUrl}auth/register',
          options: Options(
            headers: {
              'Accept': 'application/json',
            },
          ),
          data: {
            'name': name,
            'email': email,
            'password': password,
            'password_confirmation': passwordConfirmation,
          }).then((value) {
        var res = PostAuthResponse.fromJson(value.data);
        emit(RegisterSuccessState((res)));
      });
    } catch (e) {
      log(e.toString());
      emit(RegisterErrorState(e.toString()));
    }
  }
}
