import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// Constantes de color para mantener la estética del club
const Color kBackgroundColor = Color(0xFF121212);
const Color kCardColor = Color(0xFF1F1F1F);
const Color kPrimaryRed = Color(0xFFD32F2F);
const Color kSecondaryRed = Color(0xFF8B0000);
const Color kWhite = Colors.white;
const Color kGray = Colors.grey;

void main() {
  runApp(const LoginApp());
}

class LoginApp extends StatelessWidget {
  const LoginApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login - Rey de Copas',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: kBackgroundColor,
        // Configuración para que los campos de texto sigan la estética
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: kCardColor,
          hintStyle: const TextStyle(color: kGray, fontSize: 14),
          prefixIconColor: kGray,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 18,
            horizontal: 20,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: kPrimaryRed, width: 1.5),
          ),
        ),
        checkboxTheme: CheckboxThemeData(
          fillColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) return kPrimaryRed;
            return kCardColor;
          }),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        ),
      ),
      home: const LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscurePassword = true;
  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 60),

                // 1. Cabecera (Logo y Bienvenida)
                Center(
                  child: Column(
                    children: [
                      // TODO: Reemplazar con el logo/escudo PNG real del club
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [kPrimaryRed, kSecondaryRed],
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: kPrimaryRed.withValues(alpha: 0.3),
                              blurRadius: 20,
                              offset: const Offset(0, 8),
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.shield,
                          size: 50,
                          color: kWhite,
                        ),
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        'Rey de Copas',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: kWhite,
                          letterSpacing: 1.2,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Ingresá con tu número de socio o DNI',
                        style: TextStyle(fontSize: 14, color: kGray),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 48),

                // 2. Formulario
                const Text(
                  'Socio / DNI',
                  style: TextStyle(
                    color: kWhite,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  keyboardType: TextInputType.number,
                  style: const TextStyle(color: kWhite),
                  decoration: const InputDecoration(
                    hintText: 'Ej: 123456',
                    prefixIcon: Icon(Icons.person_outline),
                  ),
                ),

                const SizedBox(height: 24),

                const Text(
                  'Contraseña',
                  style: TextStyle(
                    color: kWhite,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  obscureText: _obscurePassword,
                  style: const TextStyle(color: kWhite),
                  decoration: InputDecoration(
                    hintText: 'Tu contraseña',
                    prefixIcon: const Icon(Icons.lock_outline),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: kGray,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // 3. Recordarme y Olvidé contraseña
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 24,
                          height: 24,
                          child: Checkbox(
                            value: _rememberMe,
                            onChanged: (value) {
                              setState(() {
                                _rememberMe = value ?? false;
                              });
                            },
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          'Recordarme',
                          style: TextStyle(color: kGray, fontSize: 13),
                        ),
                      ],
                    ),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: const Size(50, 30),
                        alignment: Alignment.centerRight,
                      ),
                      child: const Text(
                        '¿Olvidaste tu clave?',
                        style: TextStyle(
                          color: kPrimaryRed,
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 32),

                // 4. Botón de Ingreso
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      GoRouter.of(context).go('/home');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kPrimaryRed,
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 4,
                      shadowColor: kPrimaryRed.withValues(alpha: 0.4),
                    ),
                    child: const Text(
                      'Iniciar Sesión',
                      style: TextStyle(
                        color: kWhite,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 48),

                // 5. Botón para no socios
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      '¿No sos socio?',
                      style: TextStyle(color: kGray, fontSize: 14),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Asociate acá',
                        style: TextStyle(
                          color: kWhite,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
