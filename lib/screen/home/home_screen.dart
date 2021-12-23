import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:stream_nime/commons/base_view.dart';
import 'package:stream_nime/constant/color.dart';
import 'package:stream_nime/screen/home/home_controller.dart';
import 'package:stream_nime/screen/home/widget/ListAnimeWidget.dart';
import 'package:stream_nime/screen/seeall/seeall_screen.dart';

class HomeScreen extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    HomeController controllerX = Get.put(HomeController());
    return GetBuilder<HomeController>(
      init: controllerX,
      builder: (controller) => SafeArea(
        child: Scaffold(
          backgroundColor: darkBackground,
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
                child: CustomScrollView(
                  shrinkWrap: true,
                  slivers: [
                    SliverPadding(
                      padding: EdgeInsets.all(16),
                      sliver: SliverToBoxAdapter(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Hello,\nfind what you\nwant to watch",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontFamily: "Comfortaa",
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            IconButton(
                              onPressed: () {

                              },
                              icon: Icon(
                                Icons.favorite,
                                size: 32,
                                color: Color(0xFFDA0037),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),

                    SliverPadding(
                      padding: EdgeInsets.all(16),
                      sliver: SliverToBoxAdapter(
                        child: Container(
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: darkCream
                          ),
                          padding: EdgeInsets.only(left: 16, right: 16),
                          child: Row(
                            children: [
                              Icon(
                                Icons.search,
                                size: 24,
                                color: darkGreys,
                              ),
                              SizedBox(width: 16,),
                              Text(
                                "Search...",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400, color: darkGreys
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),

                    SliverPadding(
                      padding: EdgeInsets.only(top: 16, left: 16, right: 16),
                      sliver: SliverToBoxAdapter(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "On Going",
                                style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Comfortaa', color: Colors.white, fontSize: 16),
                              ),
                              TextButton(
                                child: Text(
                                  "see all",
                                  style: TextStyle(fontWeight: FontWeight.w600, fontFamily: 'Comfortaa', color: Colors.lightBlue, fontSize: 14),
                                ),
                                style: ButtonStyle(
                                    padding: MaterialStateProperty.all(EdgeInsets.zero)
                                ),
                                onPressed: () {
                                  Get.to(() => SeeAllScreen(title: "On Going", isComplete: false,));
                                },
                              ),
                            ],
                          )
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Container(
                        height: 310,
                        width: double.infinity,
                        child: ListAnimeWidget(
                          listAnime: controller.onGoingpaginationResponse.animeList,
                          onTap: (entity) {
                            this.controller.goDetail(entity);
                          },
                        ),
                      ),
                    ),
                    SliverPadding(
                      padding: EdgeInsets.only(top: 16, left: 16, right: 16),
                      sliver: SliverToBoxAdapter(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Completed",
                                style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Comfortaa', color: Colors.white, fontSize: 16),
                              ),
                              TextButton(
                                child: Text(
                                  "see all",
                                  style: TextStyle(fontWeight: FontWeight.w600, fontFamily: 'Comfortaa', color: Colors.lightBlue, fontSize: 14),
                                ),
                                style: ButtonStyle(
                                    padding: MaterialStateProperty.all(EdgeInsets.zero)
                                ),
                                onPressed: () {
                                  Get.to(() => SeeAllScreen(title: "Completed", isComplete: true,));
                                },
                              ),
                            ],
                          )
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Container(
                        height: 310,
                        width: double.infinity,
                        child: ListAnimeWidget(
                          listAnime: controller.completepaginationResponse.animeList,
                          onTap: (entity) {
                            this.controller.goDetail(entity);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
