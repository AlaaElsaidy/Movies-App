// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'core/api/apiManager.dart' as _i3;
import 'features/Home/data/data_sources/homeDs.dart' as _i4;
import 'features/Home/data/data_sources/homeDsImp.dart' as _i5;
import 'features/Home/data/repositories/homeRepoImp.dart' as _i9;
import 'features/Home/domain/repositories/homeRepo.dart' as _i8;
import 'features/Home/domain/use_cases/getDetails_UseCase.dart' as _i13;
import 'features/Home/domain/use_cases/getPopular_UseCase.dart' as _i10;
import 'features/Home/domain/use_cases/getRecommended_UseCase.dart' as _i11;
import 'features/Home/domain/use_cases/getUpComing_UseCase.dart' as _i12;
import 'features/Home/presentation/bloc/home_bloc.dart' as _i17;
import 'features/Search/data/data_sources/searchDs.dart' as _i6;
import 'features/Search/data/data_sources/searchDsImp.dart' as _i7;
import 'features/Search/data/repositories/searchRepoImp.dart' as _i15;
import 'features/Search/domain/repositories/searchRepo.dart' as _i14;
import 'features/Search/domain/use_cases/searchUseCase.dart' as _i16;
import 'features/Search/presentation/bloc/search_bloc.dart' as _i18;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.ApiManager>(() => _i3.ApiManager());
    gh.factory<_i4.HomeDs>(() => _i5.HomeDsImp(gh<_i3.ApiManager>()));
    gh.factory<_i6.SearchDs>(() => _i7.SearchDsImp(gh<_i3.ApiManager>()));
    gh.factory<_i8.HomeRepo>(() => _i9.HomeRepoImp(gh<_i4.HomeDs>()));
    gh.factory<_i10.GetPopularUseCase>(
        () => _i10.GetPopularUseCase(gh<_i8.HomeRepo>()));
    gh.factory<_i11.GetRecommendedUseCase>(
        () => _i11.GetRecommendedUseCase(gh<_i8.HomeRepo>()));
    gh.factory<_i12.GetUpComingUseCase>(
        () => _i12.GetUpComingUseCase(gh<_i8.HomeRepo>()));
    gh.factory<_i13.GetDetailsUseCase>(
        () => _i13.GetDetailsUseCase(gh<_i8.HomeRepo>()));
    gh.factory<_i14.SearchRepo>(() => _i15.SearchRepoImp(gh<_i6.SearchDs>()));
    gh.factory<_i16.SearchUseCase>(
        () => _i16.SearchUseCase(gh<_i14.SearchRepo>()));
    gh.factory<_i17.HomeBloc>(() => _i17.HomeBloc(
          gh<_i10.GetPopularUseCase>(),
          gh<_i12.GetUpComingUseCase>(),
          gh<_i13.GetDetailsUseCase>(),
          gh<_i11.GetRecommendedUseCase>(),
        ));
    gh.factory<_i18.SearchBloc>(
        () => _i18.SearchBloc(gh<_i16.SearchUseCase>()));
    return this;
  }
}
