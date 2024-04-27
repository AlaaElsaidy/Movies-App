import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/config/routing/appRouting.dart';
import 'package:movies/core/enums/enums.dart';
import 'package:movies/core/utilies/appColors.dart';
import 'package:movies/features/Home/domain/use_cases/getUpComing_UseCase.dart';
import 'package:movies/features/Home/presentation/bloc/home_bloc.dart';
import 'package:movies/features/Home/presentation/widgets/RecommendedList.dart';
import 'package:movies/features/Home/presentation/widgets/sliderScreen.dart';
import 'package:movies/features/Home/presentation/widgets/upComingList.dart';
import '../../../../config.dart';

class HomeTab extends StatefulWidget {
  HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  var homeBloc = getIt.get<HomeBloc>();
  @override
  void dispose() {
    homeBloc.close(); // Close the homeBloc when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => homeBloc,
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state.movieDetailsStatus == RequestStaus.success) {
              print(state.movieDetailsStatus);
            Navigator.pushNamed(
                context, AppRoutesName.details,
                arguments: state.movieDetailsStatus);
          }
          if (state.popularStatus == RequestStaus.failure) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                content: Text(state.failures!.message),
              ),
            );
          }
        },
        builder: (context, state) {
          homeBloc.add(GetPopular());
          homeBloc.add(GetRecommended());
          homeBloc.add(GetUpComing());

          return Column(
            children: [
              Sliderscreen(
                results: state.popularModel?.results ?? [],
                onClick: (String id) {
                  homeBloc.add(GetDetails(id));
                },
              ),
              SizedBox(
                height: 30.h,
              ),
              Container(
                height: 187.h,
                width: double.infinity,
                color: AppColors.bggrayColor,
                padding: EdgeInsets.all(5.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "New Releases",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    UpComingList(
                        results: state.upcomingModel?.results ?? [],
                        onClick: () {})
                  ],
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Container(
                height: 187.h,
                width: double.infinity,
                color: AppColors.bggrayColor,
                padding: EdgeInsets.all(5.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "Recommended",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    RecommendedList(
                        results: state.recommendedModel?.results ?? [],
                        onClick: () {})
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
