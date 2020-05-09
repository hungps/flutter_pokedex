import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex/core/network.dart';
import 'package:pokedex/data/repositories/pokemon_repository.dart';
import 'package:pokedex/data/source/github/github_datasource.dart';
import 'package:pokedex/data/source/local/local_datasource.dart';
import 'package:pokedex/domain/usecases/pokemon_usecases.dart';
import 'package:pokedex/states/states.dart';

part 'data_sources.dart';
part 'repositories.dart';
part 'services.dart';
part 'states.dart';
part 'use_cases.dart';
