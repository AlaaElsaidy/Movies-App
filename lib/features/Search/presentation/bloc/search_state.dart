part of 'search_bloc.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState.initial(
  {
    @Default(RequestStaus.init)RequestStaus searchStatus,
    SearchModel? searchModel,
    Failures? failures
}
      ) = _Initial;
}
