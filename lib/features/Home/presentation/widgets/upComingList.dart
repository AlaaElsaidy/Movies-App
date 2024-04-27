import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utilies/appColors.dart';
import '../../data/models/upcomingModel.dart';

class UpComingList extends StatelessWidget {
  UpComingList({super.key, required this.results,required this.onClick});

  List<Results> results;
  Function onClick;

  @override
  Widget build(BuildContext context) {
      return CarouselSlider.builder(
        itemCount: results.length,
        options: CarouselOptions(
            height: 127.74.h,
            autoPlay: true,
            aspectRatio: 2.0.r,
            viewportFraction: 0.25,
            autoPlayCurve: Curves.fastOutSlowIn,
            disableCenter: true),
        itemBuilder: (context, index, realIdx) {
          return InkWell(
            onTap: () {
              onClick();
            },
            child: Stack(
              children: [
                Container(
                   width: 96.87.w,
                child:
                  CachedNetworkImage(
                  imageUrl:
                      "https://image.tmdb.org/t/p/w500/${results[index].posterPath??""}",
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      Center(
                          child: CircularProgressIndicator(
                              color: AppColors.yellowColor,
                              value: downloadProgress.progress)),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                )),
                Positioned(
                  right: 51.w,
                    bottom: 80.h,
                    child: ImageIcon(AssetImage("assets/images/bookmark.png",),size: 60.sp,color: AppColors.grayColor,))
              ],
            ),
          );
        },
      );
  }
}
