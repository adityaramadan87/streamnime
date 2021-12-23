import 'package:flutter/material.dart';
import 'package:stream_nime/model/anime.dart';
import 'package:stream_nime/screen/home/widget/card_anime.dart';

class ListAnimeWidget extends StatelessWidget {
  final List<AnimeEntity>? listAnime;
  final ValueChanged onTap;

  ListAnimeWidget({this.listAnime, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listAnime != null ? listAnime!.length : 0,
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.only(left: 16, right: 16),
      itemBuilder: (ctx, index) {
        AnimeEntity entity = this.listAnime![index];
        return CardAnime(entity: entity, onTap: onTap, width: 150, height: 200, imageHeight: 200,);
      },
    );
  }
}
