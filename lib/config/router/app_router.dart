import 'package:cai_digital/features/groups/presentation/groups_screen.dart';
import 'package:cai_digital/features/home/presentation/home_screen.dart';
import 'package:cai_digital/features/login/presentation/login_screen.dart';
import 'package:cai_digital/features/promos/presentation/promos_screen.dart';
import 'package:cai_digital/features/qr/presentation/qr_screen.dart';
import 'package:cai_digital/features/shop/presentation/shop_screen.dart';
import 'package:cai_digital/features/social_cuote/presentation/social_cuota_screen.dart';
import 'package:cai_digital/features/tickets/presentation/tickets_screen.dart';
import 'package:cai_digital/features/user/presentation/user_info_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static const String login = '/';
  static const String homeRoute = '/home';
  static const String detailRoute = '/detail';
  static const String settingsRoute = '/settings';
  static const String profileRoute = '/profile';

  static final GoRouter router = GoRouter(
    initialLocation: login,
    debugLogDiagnostics: true,
    routes: <RouteBase>[
      GoRoute(
        path: login,
        name: 'login',
        builder: (BuildContext context, GoRouterState state) {
          return const LoginScreen();
        },
      ),
      GoRoute(
        path: homeRoute,
        name: 'home',
        builder: (BuildContext context, GoRouterState state) {
          return const MyHomePage();
        },
        routes: <RouteBase>[
          GoRoute(
            path: 'carnet-info',
            name: 'carnetInfo',
            builder: (BuildContext context, GoRouterState state) {
              return const QrScreen();
            },
          ),
          GoRoute(
            path: 'tienda-roja',
            name: 'tiendaRoja',
            builder: (BuildContext context, GoRouterState state) {
              return const TiendaRojaScreen();
            },
          ),
          GoRoute(
            path: 'social-cuote',
            name: 'CuotaSocial',
            builder: (BuildContext context, GoRouterState state) {
              return const SocialCuotaScreen();
            },
          ),
          GoRoute(
            path: 'proximo-partido',
            name: 'ProximoPartido',
            builder: (BuildContext context, GoRouterState state) {
              return const MatchTicketingScreen();
            },
          ),
          GoRoute(
            path: 'groups',
            name: 'groups',
            builder: (BuildContext context, GoRouterState state) {
              return const GroupsScreen();
            },
          ),
          GoRoute(
            path: 'user-info',
            name: 'userInfo',
            builder: (BuildContext context, GoRouterState state) {
              return const UserInfoScreen();
            },
          ),
          GoRoute(
            path: 'promos',
            name: 'promos',
            builder: (BuildContext context, GoRouterState state) {
              return const PromosScreen();
            },
          ),
          GoRoute(
            path: 'detail/:id',
            name: 'detail',
            builder: (BuildContext context, GoRouterState state) {
              final id = state.pathParameters['id'] ?? 'unknown';
              return DetailScreen(id: id);
            },
          ),
          GoRoute(
            path: 'settings',
            name: 'settings',
            builder: (BuildContext context, GoRouterState state) {
              return const SettingsScreen();
            },
          ),
        ],
      ),
      GoRoute(
        path: profileRoute,
        name: 'profile',
        builder: (BuildContext context, GoRouterState state) {
          return const ProfileScreen();
        },
      ),
    ],
    errorBuilder: (context, state) => ErrorScreen(error: state.error),
  );
}

// Pantallas de ejemplo

class DetailScreen extends StatelessWidget {
  final String id;

  const DetailScreen({required this.id, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detalle')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('ID: $id'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => context.go('/'),
              child: const Text('Volver al Inicio'),
            ),
          ],
        ),
      ),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Configuración')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Pantalla de Configuración'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => context.go('/'),
              child: const Text('Volver al Inicio'),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Perfil')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Pantalla de Perfil'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => context.go('/'),
              child: const Text('Volver al Inicio'),
            ),
          ],
        ),
      ),
    );
  }
}

class ErrorScreen extends StatelessWidget {
  final Exception? error;

  const ErrorScreen({this.error, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Error')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Página no encontrada'),
            const SizedBox(height: 20),
            if (error != null) Text('Error: $error'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => context.go('/'),
              child: const Text('Ir al Inicio'),
            ),
          ],
        ),
      ),
    );
  }
}
