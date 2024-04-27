import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/core/enums/enums.dart';
import 'package:movies/core/failure/failures.dart';
import 'package:movies/features/Home/data/models/PopularModel.dart';
import 'package:movies/features/Home/data/models/RecommendedModel.dart';
import 'package:movies/features/Home/data/models/movieDetailsModel.dart';
import 'package:movies/features/Home/data/models/upcomingModel.dart';
import 'package:movies/features/Home/domain/use_cases/getDetails_UseCase.dart';

import '../../domain/use_cases/getPopular_UseCase.dart';
import '../../domain/use_cases/getRecommended_UseCase.dart';
import '../../domain/use_cases/getUpComing_UseCase.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';
@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  GetPopularUseCase getPopularUseCase;
  GetUpComingUseCase getUpComingUseCase;
  GetDetailsUseCase getDetailsUseCase;
  GetRecommendedUseCase getRecommendedUseCase;
  HomeBloc(this.getPopularUseCase,this.getUpComingUseCase,this.getDetailsUseCase,this.getRecommendedUseCase) : super(const HomeState.initial()) {
   on<GetPopular>((event, emit)async{
     emit(state.copyWith(popularStatus: RequestStaus.loading));
     var result=await getPopularUseCase.call();
     result.fold((l) => emit(
       state.copyWith(
         popularModel: l,
         popularStatus: RequestStaus.success
       )
     ), (r) => emit(
       state.copyWith(
         popularStatus: RequestStaus.failure,
         failures: r
       )
     ));
   });
   on<GetUpComing>((event, emit)async{
     emit(state.copyWith(upcomingStatus: RequestStaus.loading));
     var result=await getUpComingUseCase.call();
     result.fold((l) => emit(
         state.copyWith(
             upcomingModel: l,
             upcomingStatus: RequestStaus.success
         )
     ), (r) => emit(
         state.copyWith(
             popularStatus: RequestStaus.failure,
             failures: r
         )
     ));
   });
   on<GetRecommended>((event, emit)async{
     emit(state.copyWith(recommendedStatus: RequestStaus.loading));
     var result=await getRecommendedUseCase.call();
     result.fold((l) => emit(
         state.copyWith(
             recommendedModel: l,
             recommendedStatus: RequestStaus.success
         )
     ), (r) => emit(
         state.copyWith(
             recommendedStatus: RequestStaus.failure,
             failures: r
         )
     ));
   });
   on<GetDetails>((event, emit)async{
     emit(state.copyWith(movieDetailsStatus: RequestStaus.loading));
     var result=await getDetailsUseCase.call(event.id);
     result.fold((l) => emit(
         state.copyWith(
             movieDetailsModel: l,
             movieDetailsStatus: RequestStaus.success
         )
     ), (r) => emit(
         state.copyWith(
             movieDetailsStatus: RequestStaus.failure,
             failures: r
         )
     ));
   });
  }
}
