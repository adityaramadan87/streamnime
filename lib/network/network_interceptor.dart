import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:stream_nime/utils/object_utils.dart';

class NetworkInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    ObjectUtils.printWrapped(options.uri.toString(), "NETWORK-INTERCEPTOR onRequest() - url");
    ObjectUtils.printWrapped(options.data.toString(), "NETWORK-INTERCEPTOR onRequest() - requestdata");
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (response.data != null) {
      if (response.requestOptions.baseUrl != "https://kitsu.io/api/edge/") {
        ObjectUtils.printWrapped(response.data.toString(), "NETWORK-INTERCEPTOR onResponse() - ${response.requestOptions.uri}");
      }else {
        log(response.data.toString());
      }
    }
    return handler.next(response);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (err != null) {
      print(err.message);
      ObjectUtils.printWrapped(err.message + " : " + err.error.toString(), "NETWORK-INTERCEPTOR onError() - ${err.requestOptions.uri}");
    }
    return handler.next(err);
  }
}
