import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:stream_nime/commons/base_controller.dart';
import 'package:stream_nime/model/anime.dart';
import 'package:stream_nime/network/network_call.dart';
import 'package:stream_nime/screen/detail/detail_screen.dart';

class SeeAllController extends BaseController {
  SeeAllController({required this.isComplete});

  final bool isComplete;

  PagingController<int, AnimeEntity> pagingController = new PagingController(firstPageKey: 1);
  RefreshController refreshController = new RefreshController(initialRefresh: false);

  @override
  void onInit() {
    pagingController.addPageRequestListener((pageKey) {
      fetchPage(pageKey);
    });
    super.onInit();
  }

  @override
  void onClose() {
    this.pagingController.dispose();
    super.onClose();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void goDetail(AnimeEntity entity) {
    Get.to(() => DetailScreen(entity: entity));
  }

  Future<void> fetchPage(pageKey) async {
    try {
      final newItems = this.isComplete ? await NetworkCall().getCompletePagination(pageKey) : await NetworkCall().getOngoingPagination(pageKey);

      if (newItems.status == "success") {
        // newItems.data?.data?.sort((a, b) {
        //   return b.updatedAt!.compareTo(a.updatedAt!);
        // });

        final isLastPage = newItems.animeList!.length < 25;

        this.refreshController.refreshCompleted();

        if (isLastPage) {
          pagingController.appendLastPage(newItems.animeList!);
        } else {
          final nextPageKey = pageKey + 1;
          pagingController.appendPage(newItems.animeList!, nextPageKey);
        }
      } else {
        this.refreshController.refreshFailed();
        this.pagingController.error = "Error";
        // this.getView().showError(newItems.statusMessage!, newItems.statusCode!);
      }
    } catch (e) {
      this.refreshController.refreshFailed();
      this.pagingController.error = e;
      // this.getView().showError(e.toString(), 0);
      print(e);
    }
  }

  void onRefresh() async {
    this.pagingController.refresh();
  }
}
