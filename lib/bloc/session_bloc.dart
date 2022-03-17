import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../models/auth/get_new_token.dart';
import '../models/reposetory_helper.dart';
import '../repository/auth_repository.dart';

class SessionCubit extends Cubit<SessionState> {
  // int _page = 1;
  SessionCubit() : super(InitSessionState());
  ResponseHelper<GetNewToken> _responseHelper = ResponseHelper(
      hasError: true,
      errorMessage: 'An Error occurred',
      isLoading: false,
      data: GetNewToken(success: false, requestToken: '', expiresAt: ''));

  ResponseHelper<GetNewToken> get responseHelper => _responseHelper;

  Future<void> getDataEvent(BuildContext context) async {
    emit(LoadingSessionState());

    _responseHelper = await AuthRepository.generateToken();
    if (!_responseHelper.hasError &&
        _responseHelper.data.requestToken.isNotEmpty) {
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => SessionToken(
      //       token: _responseHelper.data.requestToken,
      //     ),
      //   ),
      // );
    }
    emit(InitSessionState());
  }
}

class SessionState {}

class InitSessionState extends SessionState {}

class LoadingSessionState extends SessionState {}

// class WeHaveDataState extends SessionState {}
//
// class PullToState extends SessionState {}
