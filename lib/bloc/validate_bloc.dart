import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/pages/auth/session_page.dart';

import '../models/auth/get_new_token.dart';
import '../models/reposetory_helper.dart';
import '../repository/auth_repository.dart';

class ValidateCubit extends Cubit<ValidateState> {
  // int _page = 1;
  ValidateCubit() : super(InitValidateState());
  ResponseHelper<GetNewToken> _responseHelper = ResponseHelper(
      hasError: true,
      errorMessage: 'An Error occurred',
      isLoading: false,
      data: GetNewToken(success: false, requestToken: '', expiresAt: ''));

  ResponseHelper<GetNewToken> get responseHelper => _responseHelper;

  Future<void> getDataEvent(BuildContext context) async {
    emit(LoadingValidateState());

    _responseHelper = await AuthRepository.generateToken();
    if (!_responseHelper.hasError &&
        _responseHelper.data.requestToken.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SessionPage(
            token: _responseHelper.data.requestToken,
          ),
        ),
      );
    }
    emit(InitValidateState());
  }
}

class ValidateState {}

class InitValidateState extends ValidateState {}

class LoadingValidateState extends ValidateState {}

// class WeHaveDataState extends ValidateState {}
//
// class PullToState extends ValidateState {}
