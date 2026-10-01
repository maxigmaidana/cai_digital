# Guía de GoRouter

Este proyecto está configurado con **GoRouter 14.x** para la navegación. GoRouter es un router basado en URLs para Flutter que proporciona una navegación declarativa y consistente.

## Instalación y Configuración ✅

Las dependencias han sido configuradas en `pubspec.yaml`:

```yaml
dependencies:
  go_router: ^14.0.0
```

## Estructura del Proyecto

```
lib/
  ├── config/
  │   └── router/
  │       └── app_router.dart    # Configuración de rutas
  ├── features/
  │   └── home/
  │       └── presentation/
  │           └── home_screen.dart
  └── main.dart                  # Envuelto con MaterialApp.router
```

## Rutas Configuradas

En `lib/config/router/app_router.dart` se encuentran las siguientes rutas:

- **`/`** - Página de Inicio (HomeScreen)
- **`/detail/:id`** - Página de Detalle con parámetro dinámico
- **`/detail/:id/settings`** - Configuración anidada
- **`/profile`** - Página de Perfil

## Uso en Widgets

### Navegar a una ruta

```dart
import 'package:go_router/go_router.dart';

// Navegar a una ruta simple
context.go('/');

// Navegar a una ruta con parámetros
context.go('/detail/123');

// Navegar y agregar a la pila (permite retroceso)
context.push('/profile');
```

### Obtener parámetros de ruta

```dart
// En el builder de GoRoute:
GoRoute(
  path: 'detail/:id',
  builder: (BuildContext context, GoRouterState state) {
    final id = state.pathParameters['id'];
    return DetailScreen(id: id);
  },
),

// En un widget:
class DetailScreen extends StatelessWidget {
  final String id;
  const DetailScreen({required this.id});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('ID: $id'),
    );
  }
}
```

## Crear Nuevas Rutas

### 1. Agregar en `app_router.dart`:

```dart
GoRoute(
  path: 'mi-nueva-ruta',
  name: 'miNuevaRuta',
  builder: (BuildContext context, GoRouterState state) {
    return const MiPantalla();
  },
),
```

### 2. Usar en tu widget:

```dart
context.go('/mi-nueva-ruta');
// o
context.pushNamed('miNuevaRuta');
```

## Patrones Comunes

### Rutas Anidadas

```dart
GoRoute(
  path: '/',
  builder: (context, state) => const HomePage(),
  routes: [
    GoRoute(
      path: 'detail/:id',
      builder: (context, state) => DetailScreen(
        id: state.pathParameters['id']!,
      ),
    ),
  ],
),
```

### Query Parameters

```dart
// Navegar con query params
context.go('/search?q=flutter&sort=date');

// Obtener en el builder
GoRoute(
  path: 'search',
  builder: (context, state) {
    final query = state.uri.queryParameters['q'];
    final sort = state.uri.queryParameters['sort'];
    return SearchScreen(query: query, sort: sort);
  },
),
```

### Redirección

```dart
GoRouter(
  redirect: (context, state) {
    // Si no está autenticado, redirigir a login
    if (!isUserLoggedIn && state.uri.path != '/login') {
      return '/login?from=${state.uri.path}';
    }
    return null; // Continuar con la ruta original
  },
  routes: [...],
)
```

### Manejo de Errores

```dart
GoRouter(
  errorBuilder: (context, state) => ErrorScreen(error: state.error),
  routes: [...],
)
```

## Transiciones Personalizadas

```dart
GoRoute(
  path: 'pagina',
  pageBuilder: (context, state) => CustomTransitionPage(
    key: state.pageKey,
    child: MiPantalla(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return SlideTransition(
        position: animation.drive(
          Tween(begin: const Offset(1, 0), end: Offset.zero),
        ),
        child: child,
      );
    },
  ),
),
```

## Comandos Útiles

```bash
# No es necesario correr build_runner para GoRouter
# Solo flutter pub get después de agregar dependencias

flutter pub get
flutter run
```

## Recursos

- [Documentación oficial de GoRouter](https://pub.dev/packages/go_router)
- [GoRouter Examples](https://github.com/flutter/packages/tree/main/packages/go_router/example)
- [Named Routes en GoRouter](https://pub.dev/documentation/go_router/latest/go_router/GoRouter-class.html)

---

¡GoRouter está configurado y listo para usar! 🚀
