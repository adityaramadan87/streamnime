import 'package:flutter/material.dart';
import 'package:stream_nime/constant/color.dart';
import 'package:stream_nime/model/anime.dart';

class CardAnime extends StatelessWidget {
  CardAnime({required this.entity, required this.onTap, required this.width, required this.height, this.imageHeight = 200});

  final AnimeEntity entity;
  final ValueChanged<AnimeEntity> onTap;
  final double width;
  final double height;
  final double imageHeight;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        this.onTap(entity);
      },
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        color: darkCard,
        child: Container(
          height: this.height,
          width: this.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
                child: Image.network(
                  "${entity.thumb}",
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high,
                  height: this.imageHeight,
                  width: double.infinity,
                  loadingBuilder: (context, widget, chunk) {
                    if (chunk == null) return widget;
                    return Container(
                      width: double.infinity,
                      height: this.imageHeight,
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
              Padding(
                padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
                child: Text(
                    "${entity.title}",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: textInCard
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 24,
                        ),
                        Text(
                          "${entity.score?.toStringAsFixed(1) ?? " - "}",
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFFECDBBA)
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.amp_stories_rounded,
                          color: Colors.yellow,
                          size: 24,
                        ),
                        Text(
                          "${entity.episode ?? " - "}",
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFFECDBBA)
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
