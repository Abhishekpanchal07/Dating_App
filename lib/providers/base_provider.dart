import 'package:demoapp/enums/enum.dart';
import 'package:demoapp/locator.dart';
import 'package:demoapp/services/api.dart';
import 'package:flutter/material.dart';

class BaseProvider extends ChangeNotifier  {
  ViewState _state = ViewState.idle;

  ViewState get state => _state;
  bool _isDisposed = false;

  Api api = locator<Api>();

  void setState(ViewState viewState) {
    _state = viewState;
    customNotify();
  }

  void customNotify() {
    if (!_isDisposed) {
      notifyListeners();
    }
  }

  @override
  void dispose() {
    _isDisposed = true;
    super.dispose();
  }
  bool isLoading = false;

  void updateIsLoading(bool val) {
    isLoading = val;
    customNotify();
  }
}