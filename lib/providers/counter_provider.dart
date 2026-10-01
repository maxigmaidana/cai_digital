import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'counter_provider.g.dart';

@riverpod
class Counter extends _$Counter {
  @override
  int build() {
    return 0;
  }

  void increment() {
    state++;
  }

  void decrement() {
    state--;
  }
}

// Provider de estado simple (sin mutación)
@riverpod
int simpleCounter(Ref ref) {
  return 42;
}

// Provider asincrónico de ejemplo
@riverpod
Future<String> fetchData(Ref ref) async {
  await Future.delayed(const Duration(seconds: 1));
  return 'Datos cargados desde Riverpod';
}
