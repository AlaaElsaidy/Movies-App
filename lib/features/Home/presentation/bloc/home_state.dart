part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial(
  {
    @Default(RequestStaus.init)RequestStaus popularStatus,
    @Default(RequestStaus.init)RequestStaus recommendedStatus,
    @Default(RequestStaus.init)RequestStaus upcomingStatus,
    @Default(RequestStaus.init)RequestStaus movieDetailsStatus,
    PopularModel? popularModel,
    RecommendedModel? recommendedModel,
    UpcomingModel? upcomingModel,
    MovieDetailsModel? movieDetailsModel,
    Failures? failures
}
      ) = _Initial;
}
