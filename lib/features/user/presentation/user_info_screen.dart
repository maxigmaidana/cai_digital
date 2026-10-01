import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// Constantes de color para el tema oscuro y detalles
const Color kBackgroundColor = Color(0xFF121212);
const Color kCardColor = Color(0xFF1F1F1F);
const Color kPrimaryRed = Color(0xFFD32F2F);
const Color kGoldColor = Color(0xFFFFD700);
const Color kWhite = Colors.white;
const Color kGray = Colors.grey;

class UserInfoScreen extends StatelessWidget {
  const UserInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: kWhite),
          onPressed: () {
            GoRouter.of(context)
                .pop(); // Navega hacia atrás en la pila de navegación
          },
        ),
        title: const Text(
          'Rey de Copas',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: kWhite,
          ),
        ),
        centerTitle: true,
        actions: [
          Stack(
            alignment: Alignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.notifications_none, color: kWhite),
                onPressed: () {},
              ),
              Positioned(
                right: 12,
                top: 12,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: kPrimaryRed,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ProfileCardWidget(),
            const SizedBox(height: 16),
            const PointsCardWidget(),
            const SizedBox(height: 24),
            const Text(
              'Beneficios Destacados',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: kWhite,
              ),
            ),
            const SizedBox(height: 16),
            _buildBenefitCard(
              icon: Icons.sports, // Marcador temporal
              name: 'Puma Store',
              description: 'Camisetas 2024',
              discount: '20% OFF',
            ),
            _buildBenefitCard(
              icon: Icons.fastfood, // Marcador temporal
              name: 'Mostaza',
              description: 'Combos Mega',
              discount: '15% OFF',
            ),
            _buildBenefitCard(
              icon: Icons.directions_car, // Marcador temporal
              name: 'Cabify',
              description: 'Viajes al Estadio',
              discount: '\$300 OFF',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBenefitCard({
    required IconData icon,
    required String name,
    required String description,
    required String discount,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      decoration: BoxDecoration(
        color: kCardColor,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: const BoxDecoration(
              color: kBackgroundColor,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: kWhite),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: kWhite,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: const TextStyle(color: kGray, fontSize: 13),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: kPrimaryRed,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              discount,
              style: const TextStyle(
                color: kWhite,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileCardWidget extends StatelessWidget {
  const ProfileCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            kCardColor,
            Color(0xFF2A1A1A),
            Color(0xFF3A1010), // Tinte rojo sutil
          ],
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      color: kBackgroundColor,
                      shape: BoxShape.circle,
                      border: Border.all(color: kPrimaryRed, width: 2),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(35),
                      child: Image.network(
                        'https://imgs.search.brave.com/Es55_5wAvAOQmyk6QZHLa9svOfl6EChttJPsYJcHN4Q/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9tYXJr/ZXRwbGFjZS5jYW52/YS5jb20vZ1Zvd1kv/TUFHY3VoZ1Zvd1kv/MS90bC9jYW52YS1w/ZXJmaWwtZGUtdW5h/LW11amVyLWpvdmVu/LXNvbnJpZW5kby1h/bC1haXJlLWxpYnJl/LU1BR2N1aGdWb3dZ/LmpwZw',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: kPrimaryRed,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.shield, size: 10, color: kWhite),
                          SizedBox(width: 2),
                          Text(
                            'Socio',
                            style: TextStyle(
                              fontSize: 8,
                              color: kWhite,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Ayelen Pérez',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: kWhite,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Socio #223 456',
                      style: TextStyle(color: kGray, fontSize: 14),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: kGoldColor.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: kGoldColor, width: 1),
                      ),
                      child: const Text(
                        'SOCIO DE ORO',
                        style: TextStyle(
                          color: kGoldColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Nivel Inicial',
                    style: TextStyle(color: kGray, fontSize: 12),
                  ),
                  Text(
                    'Próximo: Platino',
                    style: TextStyle(
                      color: kPrimaryRed,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Stack(
                  children: [
                    Container(
                      height: 6,
                      color: Colors.grey[800],
                    ), // Fondo barra
                    Container(
                      height: 6,
                      width: 220,
                      color: kPrimaryRed,
                    ), // Progreso
                  ],
                ),
              ),
              const SizedBox(height: 8),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('1 pts', style: TextStyle(color: kGray, fontSize: 12)),
                  Text(
                    '2500 pts',
                    style: TextStyle(color: kGray, fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class PointsCardWidget extends StatelessWidget {
  const PointsCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kCardColor,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Stack(
        children: [
          Positioned(
            right: -20,
            bottom: -20,
            child: Opacity(
              opacity: 0.03, // Trofeo gigante de fondo, bien sutil
              child: Icon(Icons.emoji_events, size: 160, color: kWhite),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Icon(Icons.emoji_events, color: kPrimaryRed, size: 18),
                    SizedBox(width: 8),
                    Text(
                      'Copas Acumuladas',
                      style: TextStyle(color: kGray, fontSize: 14),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                RichText(
                  text: const TextSpan(
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                      color: kWhite,
                    ),
                    children: [
                      TextSpan(text: '1,450 '),
                      TextSpan(
                        text: 'Copas',
                        style: TextStyle(
                          color: kPrimaryRed,
                          fontWeight: FontWeight.normal,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Vencen: 10 Ene 2025',
                  style: TextStyle(color: kGray, fontSize: 12),
                ), // Hardcodeado como pediste
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity, // Ocupa todo el ancho disponible
                  child: ElevatedButton(
                    onPressed: () {},
                    style:
                        ElevatedButton.styleFrom(
                          backgroundColor: kCardColor,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          elevation: 0,
                        ).copyWith(
                          // Borde sutil tipo tarjeta
                          side: WidgetStateProperty.all(
                            const BorderSide(color: kBackgroundColor, width: 2),
                          ),
                        ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Canjear Puntos',
                          style: TextStyle(
                            color: kWhite,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 8),
                        Icon(Icons.chevron_right, color: kWhite, size: 18),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
