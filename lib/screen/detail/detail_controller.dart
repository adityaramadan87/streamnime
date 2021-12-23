import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:stream_nime/commons/base_controller.dart';
import 'package:stream_nime/model/anime.dart';
import 'package:stream_nime/model/kitsu.dart';
import 'package:stream_nime/network/dto/anime_detail_response.dart';
import 'package:stream_nime/network/dto/kitsu_response.dart';
import 'package:stream_nime/network/network_call.dart';

class DetailController extends BaseController {
  DetailController({required this.animeEntity});
  AnimeEntity animeEntity;

  RefreshController refreshController = new RefreshController(initialRefresh: false);

  AnimeDetailResponse? animeDetailResponse;
  KitsuEntity? kitsuEntity;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    call();
    super.onReady();
  }

  void onRefresh() async {
    this.call();
  }

  void call() async {
    showLoading(true);

    this.animeDetailResponse = await NetworkCall().getAnimeDetail(this.animeEntity.id!).catchError((e) {
      showLoading(false);
      refreshController.refreshFailed();
    });

    await NetworkCall().getDetailKitsu("${animeDetailResponse?.japanase}").then((value) {
      if (value.kitsu != null && value.kitsu!.isNotEmpty) {
        for (KitsuEntity entity in value.kitsu!) {
          if (this.animeDetailResponse?.japanase == entity.japaneseTitle || this.animeDetailResponse?.title == entity.canonicalTitle) {
            this.kitsuEntity = entity;

            return;
          }
        }
      }
    }).catchError((e) {
      showLoading(false);
      refreshController.refreshFailed();
    });

    showLoading(false);
    refreshController.refreshCompleted();
  }


}