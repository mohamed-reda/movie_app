import 'dart:convert';

import 'package:http/http.dart';
import 'package:movie_app/models/reposetory_helper.dart';
import 'package:movie_app/models/session/get_session.dart';

import '../commons/common.dart';
import '../models/account/get_account_details.dart';
import '../models/auth/get_new_token.dart';
import '../models/auth/validate/get_validate_with_login.dart';
import '../models/auth/validate/send_validate_with_login.dart';

class AuthRepository {
  static Future<ResponseHelper<GetNewToken>> generateToken(
      {String url = Common.generateTokenURL}) async {
    ResponseHelper<GetNewToken> _responseHelper = ResponseHelper(
        data: GetNewToken(expiresAt: '', requestToken: '', success: false));
    try {
      final response = await get(Uri.parse(url));

      if (response.statusCode == 200) {
        var responseData = json.decode(response.body);
        GetNewToken getNewToken = GetNewToken.fromJson(responseData);
        _responseHelper.data = getNewToken;
        _responseHelper.hasError = false;
        _responseHelper.isLoading = false;
        return _responseHelper;
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print('${e.toString()}}');
      _responseHelper.errorMessage = 'try again';
    }
    _responseHelper.isLoading = false;
    _responseHelper.hasError = true;

    return _responseHelper;
  }

  static Future<ResponseHelper<GetValidateWithLogin>> getValidateToken(
      {String url = Common.generateTokenURL,
      required SendValidateWithLogin sendValidateWithLogin}) async {
    ResponseHelper<GetValidateWithLogin> _responseHelper = ResponseHelper(
        data: GetValidateWithLogin(
            expiresAt: '', requestToken: '', success: false));
    try {
      final response = await get(Uri.parse(url));

      if (response.statusCode == 200) {
        var responseData = json.decode(response.body);
        GetValidateWithLogin getValidateWithLogin =
            GetValidateWithLogin.fromJson(responseData);
        _responseHelper.data = getValidateWithLogin;
        _responseHelper.hasError = false;
        _responseHelper.isLoading = false;
        return _responseHelper;
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print('${e.toString()}}');
      _responseHelper.errorMessage = 'try again';
    }
    _responseHelper.isLoading = false;
    _responseHelper.hasError = true;

    return _responseHelper;
  }

  static Future<ResponseHelper<GetNewToken>> getSessionID(
      {String url = Common.generateTokenURL,
      required SendValidateWithLogin sendValidateWithLogin}) async {
    ResponseHelper<GetNewToken> _responseHelper = ResponseHelper(
        data: GetNewToken(expiresAt: '', requestToken: '', success: false));
    try {
      final response = await get(Uri.parse(url));

      if (response.statusCode == 200) {
        var responseData = json.decode(response.body);
        GetNewToken getNewToken = GetNewToken.fromJson(responseData);
        _responseHelper.data = getNewToken;
        _responseHelper.hasError = false;
        _responseHelper.isLoading = false;
        return _responseHelper;
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print('${e.toString()}}');
      _responseHelper.errorMessage = 'try again';
    }
    _responseHelper.isLoading = false;
    _responseHelper.hasError = true;

    return _responseHelper;
  }

  static Future<ResponseHelper<GetAccountDetails>> getAccountDetails(
      {String url = Common.generateTokenURL,
      required SendValidateWithLogin sendValidateWithLogin}) async {
    ResponseHelper<GetAccountDetails> _responseHelper =
        ResponseHelper(data: GetAccountDetails());
    try {
      final response = await get(Uri.parse(url));

      if (response.statusCode == 200) {
        var responseData = json.decode(response.body);
        GetAccountDetails getAccountDetails =
            GetAccountDetails.fromJson(responseData);
        _responseHelper.data = getAccountDetails;
        _responseHelper.hasError = false;
        _responseHelper.isLoading = false;
        return _responseHelper;
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print('${e.toString()}}');
      _responseHelper.errorMessage = 'try again';
    }
    _responseHelper.isLoading = false;
    _responseHelper.hasError = true;

    return _responseHelper;
  }
}
