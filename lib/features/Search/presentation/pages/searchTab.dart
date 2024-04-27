import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/config.dart';
import 'package:movies/features/Search/presentation/bloc/search_bloc.dart';

import '../../../../core/utilies/appColors.dart';

class SearchTab extends StatefulWidget {
  SearchTab({super.key});

  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  var searchBloc = getIt.get<SearchBloc>();
  @override
  void dispose() {
    searchBloc.close(); // Close the homeBloc when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => searchBloc..add(Search("the")),
      child: BlocConsumer<SearchBloc, SearchState>(
        listener: (context, state) {
          print(state.searchModel);
        },
        builder: (context, state) {
         var result=state.searchModel?.results??[];
          return Column(
            children: [
              Expanded(
                child: ListView.separated(
                  itemCount:result.length,
                  separatorBuilder: (context, index) => Divider(
                    height: 5.h,
                  ),
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        CachedNetworkImage(
                          imageUrl:result[index].backdropPath??"",
                          height: 89.h,
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) => Center(
                                  child: CircularProgressIndicator(
                                      color: AppColors.yellowColor,
                                      value: downloadProgress.progress)),
                          errorWidget: (context, url, error) => Icon(Icons.error),
                        ),
                        Column(
                          children: [
                            Text(result[index].backdropPath??""),
                            Text(result[index].releaseDate??""),
                            Text(result[index].overview??""),

                          ],
                        )
                      ],
                    );
                  },
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
