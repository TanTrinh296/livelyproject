import 'dart:async';

import 'package:lightproject/main.dart';
import 'package:lightproject/utils/log_debug.dart';
import 'package:lightproject/widgets/common_dialog.dart';
// import 'package:gmhangduc/utils/log_debug.dart';
// import 'package:gmhangduc/widgets/common_dialog.dart';

abstract class BaseBloc {
  StreamController<bool> _loaddingController =
      StreamController<bool>.broadcast();
  Stream<bool> get loaddingStream => _loaddingController.stream;
  Sink<bool> get loaddingSink => _loaddingController.sink;

  void showLoading() {
    loaddingSink.add(true);
  }

  void hideLoading() {
    loaddingSink.add(false);
  }

  void dispose() {
    _loaddingController.close();
  }

  String? _checkException(dynamic exception) {
    if (exception == null) return null;
    log(exception.runtimeType, "Type Exception");
    log(exception.toString(), "Value Exception");
    if (exception is FormatException) return "Lỗi định dạng dữ liệu";
    return null;
  }

  /// nếu exception null thì sử dụng textError
  Future showError(String? textError,
      {dynamic exception, Function? ontapOk}) async {
    loaddingSink.add(false);
    await showOkDialog(StateManager.navigatorKey.currentContext!,
        _checkException(exception) ?? textError ?? "Loi khong xac dinh", () {
      if (ontapOk != null) ontapOk();
    });
  }
}
