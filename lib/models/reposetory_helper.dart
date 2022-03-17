import 'dart:async';

import 'package:flutter/services.dart';

class ResponseHelper<T> {
  T data;
  bool hasError;
  String errorMessage;
  bool isLoading;
  int total_pages;

  ResponseHelper({
    required this.data,
    this.errorMessage = 'There is No Data yet',
    this.hasError = false,
    this.isLoading = true,
    this.total_pages = 1,
  });
}
