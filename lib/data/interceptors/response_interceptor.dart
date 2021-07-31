import 'dart:async';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:go_trust/shared/utils/common_widget.dart';
import 'package:gotrust_repository_data/shared/models/response/error_response.dart';

FutureOr<dynamic> responseInterceptor(Request request, Response response) async {
  await EasyLoading.dismiss();

  // Error
  if (response.statusCode != 200) {
    handleErrorStatus(response);
    return;
  }

  return response;
}

void handleErrorStatus(Response response) {
  switch (response.statusCode) {
    case 400:
      final message = ErrorResponse.fromJson(response.body);
      CommonWidget.toast(message.error ?? message.type!);
      break;
    case 401:
      final message = ErrorResponse.fromJson(response.body);
      CommonWidget.toast(message.error ?? message.type!);
      break;
    case 500:
      final message = ErrorResponse.fromJson(response.body);
      CommonWidget.toast(message.error ?? message.type!);
      break;
    default:
      CommonWidget.toast('unknown_error'.tr);
      break;
  }

  return;
}
