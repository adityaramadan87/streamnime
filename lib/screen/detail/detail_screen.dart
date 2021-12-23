import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:stream_nime/commons/base_view.dart';
import 'package:stream_nime/constant/color.dart';
import 'package:stream_nime/model/anime.dart';
import 'package:stream_nime/screen/detail/detail_controller.dart';
import 'package:stream_nime/utils/custom_widget.dart';

class DetailScreen extends GetView<DetailController> {
  DetailScreen({required this.entity});
  final AnimeEntity entity;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailController>(
      init: DetailController(animeEntity: this.entity),
      builder: (controller) => SafeArea(
        child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            leading: CustomWidget.roundedBackButton(onTap: () => Get.back()),
          ),
          backgroundColor: darkBackground,
          body: BaseView(
            isLoading: this.controller.isLoading,
            child: Container(
              height: double.infinity,
              width: double.infinity,
              child: SmartRefresher(
                  enablePullDown: true,
                  controller: this.controller.refreshController,
                  header: WaterDropMaterialHeader(),
                  onRefresh: this.controller.onRefresh,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 300,
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.topCenter,
                                child: Image.network(
                                  "${this.controller.kitsuEntity?.coverImage ?? this.controller.animeDetailResponse?.thumb}",
                                  width: double.infinity,
                                  height: 230,
                                  fit: BoxFit.cover,
                                  loadingBuilder: (context, widget, chunk) {
                                    if (chunk == null) return widget;
                                    return Container(
                                      width: double.infinity,
                                      height: 200,
                                      child: Center(
                                        child: CircularProgressIndicator(),
                                      ),
                                    );
                                  },
                                  errorBuilder: (context, widget, _) {
                                    return Text("failed");
                                  },
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Image.network(
                                  "${this.controller.animeDetailResponse?.thumb}",
                                  width: 100,
                                  height: 150,
                                  fit: BoxFit.fill,
                                  loadingBuilder: (context, widget, chunk) {
                                    if (chunk == null) return widget;
                                    return Container(
                                      width: 100,
                                      height: 150,
                                      child: Center(
                                        child: CircularProgressIndicator(),
                                      ),
                                    );
                                  },
                                  errorBuilder: (context, widget, _) {
                                    return Text("failed");
                                  },
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
              ),
            ),
          ),
        ),
      )
    );
  }
}
