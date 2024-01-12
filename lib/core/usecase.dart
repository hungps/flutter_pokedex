import 'dart:async';

abstract class UseCase<Data, Params> {
  const UseCase();

  FutureOr<Data> call(Params params);
}

class NoParams {}
