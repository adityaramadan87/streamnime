import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:stream_nime/commons/base_view.dart';
import 'package:stream_nime/constant/color.dart';
import 'package:stream_nime/model/anime.dart';
import 'package:stream_nime/screen/home/widget/card_anime.dart';
import 'package:stream_nime/screen/seeall/seeall_controller.dart';

class SeeAllScreen extends GetView<SeeAllController> {
  SeeAllScreen({required this.title, required this.isComplete});
  final String title;
  final bool isComplete;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SeeAllController>(
      init: SeeAllController(isComplete: this.isComplete),
      builder: (controller) {
        return Scaffold(
          backgroundColor: darkBackground,
          appBar: AppBar(
            backgroundColor: darkCard,
            elevation: 0,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.white,
              ),
              onPressed: () {
                Get.back();
              },
            ),
            centerTitle: true,
            title: Text(
              "$title",
              style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white, fontFamily: 'Comfortaa'),
            ),
          ),
          body: BaseView(
            isLoading: this.controller.isLoading,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              child: SmartRefresher(
                enablePullDown: true,
                controller: this.controller.refreshController,
                header: WaterDropMaterialHeader(),
                onRefresh: this.controller.onRefresh,
                child: PagedGridView(
                  pagingController: this.controller.pagingController,
                  showNewPageErrorIndicatorAsGridChild: false,
                  showNewPageProgressIndicatorAsGridChild: false,
                  showNoMoreItemsIndicatorAsGridChild: false,
                  padding: EdgeInsets.all(16),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 5,
                      childAspectRatio: 0.56,
                      mainAxisSpacing: 5
                  ),
                  builderDelegate: PagedChildBuilderDelegate<AnimeEntity>(
                    itemBuilder: (ctx, entity, index) {
                      return CardAnime(entity: entity, onTap: this.controller.goDetail, width: 100, height: 200,);
                    },
                    firstPageErrorIndicatorBuilder: (context) {
                      return Text("ERROR", style: TextStyle(color: Colors.white));
                    },
                    noItemsFoundIndicatorBuilder: (context) {
                      return Text("items not found", style: TextStyle(color: Colors.white),);
                    },
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
