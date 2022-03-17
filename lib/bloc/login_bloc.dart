import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../models/auth/get_new_token.dart';
import '../models/reposetory_helper.dart';
import '../pages/auth/validate_token_page.dart';
import '../repository/auth_repository.dart';

class LoginCubit extends Cubit<LoginState> {
  // int _page = 1;
  LoginCubit() : super(InitLoginState());
  ResponseHelper<GetNewToken> _responseHelper = ResponseHelper(
      hasError: true,
      errorMessage: 'An Error occurred',
      isLoading: false,
      data: GetNewToken(success: false, requestToken: '', expiresAt: ''));

  ResponseHelper<GetNewToken> get responseHelper => _responseHelper;

  Future<void> getDataEvent(BuildContext context) async {
    emit(LoadingLoginState());

    _responseHelper = await AuthRepository.generateToken();
    if (!_responseHelper.hasError &&
        _responseHelper.data.requestToken.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ValidateToken(
            token: _responseHelper.data.requestToken,
          ),
        ),
      );
    }
    emit(InitLoginState());
  }
}

class LoginState {}

class InitLoginState extends LoginState {}

class LoadingLoginState extends LoginState {}

// class WeHaveDataState extends LoginState {}
//
// class PullToState extends LoginState {}
