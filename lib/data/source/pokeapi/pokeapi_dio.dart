import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: Dio)
@named
class PokeApiDio extends DioForNative {
  PokeApiDio()
      : super(BaseOptions(
          baseUrl: 'https://pokeapi.co',
        ));
}
