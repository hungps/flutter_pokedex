// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:pokedex/data/repositories/item_repository.dart' as _i282;
import 'package:pokedex/data/repositories/item_repository.default.dart' as _i25;
import 'package:pokedex/data/repositories/pokemon_repository.dart' as _i456;
import 'package:pokedex/data/repositories/pokemon_repository.default.dart'
    as _i525;
import 'package:pokedex/data/source/github/github_datasource.dart' as _i408;
import 'package:pokedex/data/source/github/network.dart' as _i510;
import 'package:pokedex/data/source/local/local_datasource.dart' as _i880;
import 'package:pokedex/data/states/item/item_bloc.dart' as _i622;
import 'package:pokedex/data/states/pokemon/pokemon_bloc.dart' as _i577;
import 'package:pokedex/data/states/settings/settings_bloc.dart' as _i240;
import 'package:pokedex/data/usecases/item_usecases.dart' as _i416;
import 'package:pokedex/data/usecases/pokemon_usecases.dart' as _i988;
import 'package:pokedex/di.dart' as _i326;
import 'package:pokedex/presenter/pages/splash/splash_bloc.dart' as _i841;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.factory<_i841.SplashBloc>(() => _i841.SplashBloc());
    gh.singleton<_i361.Dio>(() => registerModule.dio);
    await gh.singletonAsync<_i880.LocalDataSource>(
      () {
        final i = const _i880.LocalDataSource();
        return i.initialize().then((_) => i);
      },
      preResolve: true,
    );
    gh.singleton<_i240.SettingsBloc>(() => _i240.SettingsBloc());
    gh.singleton<_i510.NetworkManager>(
        () => _i510.NetworkManager(dio: gh<_i361.Dio>()));
    gh.singleton<_i408.GithubDataSource>(() =>
        _i408.GithubDataSource(networkManager: gh<_i510.NetworkManager>()));
    gh.singleton<_i456.PokemonRepository>(() => _i525.PokemonDefaultRepository(
          githubDataSource: gh<_i408.GithubDataSource>(),
          localDataSource: gh<_i880.LocalDataSource>(),
        ));
    gh.singleton<_i282.ItemRepository>(() => _i25.DefaultItemRepository(
          githubDataSource: gh<_i408.GithubDataSource>(),
          localDataSource: gh<_i880.LocalDataSource>(),
        ));
    gh.singleton<_i577.PokemonBloc>(() =>
        _i577.PokemonBloc(pokemonRepository: gh<_i456.PokemonRepository>()));
    gh.singleton<_i988.GetAllPokemonsUseCase>(() => _i988.GetAllPokemonsUseCase(
        pokemonRepository: gh<_i456.PokemonRepository>()));
    gh.singleton<_i988.GetPokemonsUseCase>(() => _i988.GetPokemonsUseCase(
        pokemonRepository: gh<_i456.PokemonRepository>()));
    gh.singleton<_i988.GetPokemonUseCase>(() => _i988.GetPokemonUseCase(
        pokemonRepository: gh<_i456.PokemonRepository>()));
    gh.singleton<_i622.ItemBloc>(
        () => _i622.ItemBloc(itemRepository: gh<_i282.ItemRepository>()));
    gh.singleton<_i416.GetItemUseCase>(
        () => _i416.GetItemUseCase(itemRepository: gh<_i282.ItemRepository>()));
    return this;
  }
}

class _$RegisterModule extends _i326.RegisterModule {}
