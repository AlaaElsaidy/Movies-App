import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/core/enums/enums.dart';
import 'package:movies/core/failure/failures.dart';
import 'package:movies/features/Search/data/models/searchModel.dart';

import '../../domain/use_cases/searchUseCase.dart';

part 'search_event.dart';
part 'search_state.dart';
part 'search_bloc.freezed.dart';
@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchUseCase searchUseCase;
  SearchBloc(this.searchUseCase) : super(const SearchState.initial()) {
    on<Search>((event, emit) async{
      emit(state.copyWith(searchStatus: RequestStaus.loading));
      var result=await searchUseCase.call(event.searchtxt);
      result.fold((l) =>emit(
        state.copyWith(
          searchStatus: RequestStaus.success,
          searchModel: l
        )
      ), (r) => emit(
        state.copyWith(
          searchStatus: RequestStaus.failure,
          failures: r
        )
      ));
    });
  }
}
