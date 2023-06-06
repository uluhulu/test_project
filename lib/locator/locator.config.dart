// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../domain/repos/catalog_repo/catalog_repo.dart' as _i4;
import '../domain/repos/catalog_repo/catalog_repo_impl.dart' as _i5;
import '../network/api_client/api_client.dart' as _i6;
import '../use_cases/cart/cart_store.dart'
    as _i3; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  gh.lazySingleton<_i3.CartStore>(() => _i3.CartStore());
  gh.lazySingleton<_i4.CatalogRepository>(
      () => _i5.CatalogRepositoryImpl(apiClient: get<_i6.ApiClient>()));
  return get;
}
