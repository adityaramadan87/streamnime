import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:stream_nime/commons/base_controller.dart';
import 'package:stream_nime/model/anime.dart';
import 'package:stream_nime/network/dto/complete_pagination_response.dart';
import 'package:stream_nime/network/dto/home_response.dart';
import 'package:stream_nime/network/network_call.dart';
import 'package:stream_nime/screen/detail/detail_screen.dart';

class HomeController extends BaseController {
  CompletePaginationResponse onGoingpaginationResponse = new CompletePaginationResponse();
  CompletePaginationResponse completepaginationResponse = new CompletePaginationResponse();

  RefreshController refreshController = new RefreshController(initialRefresh: false);

  int done = 0;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    call();
    super.onReady();
  }

  void call() async {
    showLoading(true);
    this.completepaginationResponse = await NetworkCall().getCompletePagination(1).catchError((e) {
      showLoading(false);
      refreshController.refreshFailed();
    });

    this.onGoingpaginationResponse = await NetworkCall().getOngoingPagination(1).catchError((e) {
      showLoading(false);
      refreshController.refreshFailed();
    });

    this.showLoading(false);
    refreshController.refreshCompleted();
  }

  void onRefresh() async {
    this.call();
  }

  void goDetail(AnimeEntity entity) {
    Get.to(() => DetailScreen(entity: entity));
  }
}
