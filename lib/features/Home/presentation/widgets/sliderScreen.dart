import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/utilies/appColors.dart';
import 'package:movies/features/Home/data/models/PopularModel.dart';

class Sliderscreen extends StatelessWidget {
  Sliderscreen({super.key, required this.results,required this.onClick});

  List<Results> results;
  Function onClick;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
        itemCount: results.length,
        options: CarouselOptions(
            autoPlay: true,
            aspectRatio: 2.0.r,
            enlargeCenterPage: true,
            height: 289.h,
            autoPlayCurve: Curves.fastOutSlowIn,
            disableCenter: true),
        itemBuilder: (context, index, realIdx) {
          return InkWell(
            onTap: () {
              onClick(results[index].id.toString());
            },
            child: Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20.r),
                          child: CachedNetworkImage(
                            height: 217.h,
                            width: 412.w,
                            imageUrl:
                                "https://image.tmdb.org/t/p/w500/${results[index].backdropPath??""}",
                            progressIndicatorBuilder:
                                (context, url, downloadProgress) => Center(
                                    child: CircularProgressIndicator(
                                        color: AppColors.yellowColor,
                                        value: downloadProgress.progress)),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                        ),
                        Icon(
                          Icons.play_circle,
                          size: 55.sp,
                          color: Colors.white,
                        )
                      ],
                    ),
                    Text(
                      results[index].title ?? "",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Text(
                      results[index].releaseDate ?? "",
                      style: Theme.of(context).textTheme.displaySmall,
                    )
                  ],
                ),
                Positioned(
                  right: 160.w,
                  child: Container(
                    width: 199.w,
                    height: 199.h,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10.r)),
                    child: CachedNetworkImage(
                      imageUrl:
                          "https://image.tmdb.org/t/p/w500/${results[index].posterPath??""}",
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) => Center(
                              child: CircularProgressIndicator(
                                  color: AppColors.yellowColor,
                                  value: downloadProgress.progress)),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                ),
                Positioned(
                    bottom: 153.h,
                    right: 282.w,
                    child:ImageIcon(AssetImage("assets/images/bookmark.png",),size: 60.sp,color: AppColors.grayColor,)),
              ],
            ),
          );
        });
  }
}
