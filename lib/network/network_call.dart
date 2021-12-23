import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart' as g;
import 'package:stream_nime/constant/endpoint.dart';
import 'package:stream_nime/network/dto/anime_detail_response.dart';
import 'package:stream_nime/network/dto/complete_pagination_response.dart';
import 'package:stream_nime/network/dto/home_response.dart';
import 'package:stream_nime/network/dto/kitsu_response.dart';
import 'package:stream_nime/network/network_interceptor.dart';
import 'package:stream_nime/utils/custom_widget.dart';
import 'package:stream_nime/utils/object_utils.dart';

class NetworkCall {
  final dio = createDio();

  static Dio createDio() {
    Dio dio = Dio(BaseOptions(
        baseUrl: Endpoint.BASE_URL,
        connectTimeout: 30000,
        receiveTimeout: 10000,
        validateStatus: (stats) {
          return stats! < 500;
        }));

    dio.interceptors.clear();
    dio.interceptors.add(NetworkInterceptor());
    return dio;
  }

  Future<HomeResponse> getHome() async {
    Response response = await dio.get(Endpoint.HOME).catchError((e) {
      CustomWidget.showDialogError(g.Get.context!, "Internal Error", e.toString());
    });

    return HomeResponse.fromJson(response.data);
  }

  Future<CompletePaginationResponse> getOngoingPagination(int page) async {
    Response response = await dio.get(Endpoint.ONGOING_PAGINATION + "$page").catchError((e) {
      CustomWidget.showDialogError(g.Get.context!, "Internal Error", e.toString());
    });

    return CompletePaginationResponse.fromJson(response.data);
  }

  Future<CompletePaginationResponse> getCompletePagination(int page) async {
    Response response = await dio.get(Endpoint.COMPLETE_PAGINATION + "$page").catchError((e) {
      CustomWidget.showDialogError(g.Get.context!, "Internal Error", e.toString());
    });

    return CompletePaginationResponse.fromJson(response.data);
  }
  
  Future<AnimeDetailResponse> getAnimeDetail(String animeId) async {
    Response response = await dio.get(Endpoint.ANIME_DETAIL + "$animeId").catchError((e) {
      CustomWidget.showDialogError(g.Get.context!, "Internal Error", e.toString());
    });

    return AnimeDetailResponse.fromJson(response.data);
  }

  Future<KitsuResponse> getDetailKitsu(String japaneseTitle) async {
    dio.options.baseUrl = "https://kitsu.io/api/edge/" ;

    Response response = await dio.get("anime?filter[text]=$japaneseTitle")
        .catchError((e) {
      CustomWidget.showDialogError(g.Get.context!, "Internal Error", e.toString());
    });

    return KitsuResponse.fromJson(jsonDecode(response.data));
  }
}
