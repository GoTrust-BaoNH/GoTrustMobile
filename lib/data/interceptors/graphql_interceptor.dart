import 'dart:io';

import 'package:go_trust/data/common/define_field.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

Object handleErrorGraphQL(OperationException exception) {
  if (exception.linkException != null) {
    if(exception.linkException is ServerException){
      final message = exception.linkException!.originalException as SocketException;
      return message.osError!.message;
    }
    final statusCode = (exception.linkException as HttpLinkParserException).response.statusCode;
    _handleStatusCodeServer(exception, statusCode);
    return statusCode;

  } else {
     _handleGraphQlErrorServer(exception, exception.graphqlErrors.first.extensions!['code']);
     return exception.graphqlErrors.first.extensions!['message'];
  }
}

void _handleStatusCodeServer(OperationException exception, int statusCode) {
  switch (statusCode) {
    case 400:
      print('400 Bad Request: $exception');
      break;
    case 401:
      print('401 Expired token: $exception');
      break;
    case 403:
      print('403 Forbidden HTTP: $exception');
      break;
    case 404:
      print('404 Not Found: $exception');
      break;
    case 500:
      print('500 Internal Error: $exception');
      break;
    case 503:
      print('503 Service Unavailable: $exception');
      break;
    default:
      print('StatusCode $statusCode: $exception');
      break;
  }
}

void _handleGraphQlErrorServer(OperationException exception, String code) {
  switch (code) {
    case ACCESS_DENIED:
      print('401 Expired token: $exception');
      break;
    default:
      print('Error $code: $exception');
      break;
  }
}