# Guía de Riverpod con Anotaciones

Este proyecto está configurado con **Riverpod 3.x** usando anotaciones (`@riverpod`). Esta guía te muestra cómo usar Riverpod en tu aplicación Flutter.

## Instalación y Configuración ✅

Las dependencias han sido configuradas en `pubspec.yaml`:

```yaml
dependencies:
  flutter_riverpod: ^3.0.0
  riverpod_annotation: ^4.0.0

dev_dependencies:
  riverpod_generator: ^4.0.0
  build_runner: ^2.4.0
```

## Estructura del Proyecto

```
lib/
  ├── providers/           # Todos tus providers aquí
  │   └── counter_provider.dart
  └── main.dart           # Envuelto con ProviderScope
```

## Crear un Provider con Anotaciones

### 1. Provider de Notificador (para estado mutable)

```dart
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'my_provider.g.dart';

@riverpod
class MyNotifier extends _$MyNotifier {
  @override
  int build() {
    return 0; // Estado inicial
  }

  void increment() {
    state++;
  }

  void reset() {
    state = 0;
  }
}
```

### 2. Provider Simple (estado inmutable)

```dart
@riverpod
String greeting(GreetingRef ref) {
  return 'Hola desde Riverpod';
}
```

### 3. Provider Asincrónico

```dart
@riverpod
Future<List<String>> fetchUsers(FetchUsersRef ref) async {
  final response = await http.get(Uri.parse('https://api.example.com/users'));
  return parseUsers(response);
}
```

### 4. Provider que Depende de Otros Providers

```dart
@riverpod
int doubleCounter(DoubleCounterRef ref) {
  final count = ref.watch(counterProvider);
  return count * 2;
}
```

## Usar Providers en Widgets

### Con ConsumerWidget

```dart
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CounterWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(counterProvider);
    
    return Column(
      children: [
        Text('Contador: $count'),
        ElevatedButton(
          onPressed: () => ref.read(counterProvider.notifier).increment(),
          child: const Text('Incrementar'),
        ),
      ],
    );
  }
}
```

### Con ConsumerStatefulWidget

```dart
class MyStatefulWidget extends ConsumerStatefulWidget {
  @override
  ConsumerState<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends ConsumerState<MyStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    final count = ref.watch(counterProvider);
    
    return Text('Contador: $count');
  }
}
```

## Generar Archivos

Cuando crees o modifiques providers, ejecuta:

```bash
dart run build_runner build
```

O para modo watch (regenera automáticamente):

```bash
dart run build_runner watch
```

Esto genera los archivos `.g.dart` necesarios para que funcionen las anotaciones.

## Comandos Útiles

```bash
# Generar código
dart run build_runner build

# Modo watch (regenera automáticamente)
dart run build_runner watch

# Limpiar todo
flutter clean

# Obtener dependencias
flutter pub get
```

## Patrones Comunes

### Actualizar estado desde un provider

```dart
final myProvider = StateNotifierProvider<MyNotifier, int>((ref) {
  return MyNotifier();
});

// En tu widget
ref.read(myProvider.notifier).increment();
```

### Escuchar cambios de un provider

```dart
ref.listen(myProvider, (previous, next) {
  if (next > 10) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Límite alcanzado')),
    );
  }
});
```

### Invalidar un provider

```dart
ref.invalidate(myProvider); // Reinicia el provider
```

## Recursos

- [Documentación Oficial de Riverpod](https://riverpod.dev)
- [Generator Documentation](https://riverpod.dev/docs/essentials/combining_providers#using-codegen)
- [Riverpod on pub.dev](https://pub.dev/packages/riverpod)

---

¡Listo! Riverpod está configurado y listo para usar en tu proyecto Flutter. 🚀
