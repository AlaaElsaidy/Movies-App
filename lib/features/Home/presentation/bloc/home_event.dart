part of 'home_bloc.dart';

@freezed
class HomeEvent with _$HomeEvent {
  const factory HomeEvent.started() = _Started;
  const factory HomeEvent.getpopular() = GetPopular;
  const factory HomeEvent.getrecommended() = GetRecommended;
  const factory HomeEvent.getupcoming() = GetUpComing;
  const factory HomeEvent.getdetails(
      String id
      ) = GetDetails;
}
