import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// Constantes de color
const Color kBackgroundColor = Color(0xFF121212);
const Color kCardColor = Color(0xFF1F1F1F);
const Color kPrimaryRed = Color(0xFFD32F2F);
const Color kSecondaryRed = Color(0xFF8B0000);
const Color kWhite = Colors.white;
const Color kGray = Colors.grey;
const Color kSanLorenzoBlue = Color(0xFF003366); // Para el logo rival

class MatchTicketingScreen extends StatelessWidget {
  const MatchTicketingScreen({super.key});

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
          'Próximo Partido',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: kWhite,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),

              // 1. Header del Partido (Fecha, Hora, Equipos)
              const _MatchHeaderCard(),
              const SizedBox(height: 20),

              // 2. Extra UX: Tarjeta de acceso rápido al Abono del usuario
              const _QuickReserveSeasonPass(),
              const SizedBox(height: 24),

              // 3. Mapa del Estadio (Mockup)
              const Text(
                'Selecciona tu sector',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: kWhite,
                ),
              ),
              const SizedBox(height: 12),
              const _StadiumMapMockup(),
              const SizedBox(height: 24),

              // 4. Lista de Tribunas y Sectores (Acordeón)
              _TribunesList(),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}

class _MatchHeaderCard extends StatelessWidget {
  const _MatchHeaderCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: kCardColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Local
              Column(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: const BoxDecoration(
                      color: kPrimaryRed,
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: Text(
                        'CAI',
                        style: TextStyle(
                          color: kWhite,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ), // TODO: Logo Independiente
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Independiente',
                    style: TextStyle(
                      color: kWhite,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),

              // Info Centro
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: kWhite.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text(
                      '13/09 - 19:15',
                      style: TextStyle(
                        color: kWhite,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'VS',
                    style: TextStyle(
                      color: kGray,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),

              // Visitante
              Column(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [kSanLorenzoBlue, kPrimaryRed],
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: Text(
                        'CASLA',
                        style: TextStyle(
                          color: kWhite,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ), // TODO: Logo San Lorenzo
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'San Lorenzo',
                    style: TextStyle(
                      color: kWhite,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
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

class _QuickReserveSeasonPass extends StatelessWidget {
  const _QuickReserveSeasonPass();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [kPrimaryRed, kSecondaryRed],
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: kPrimaryRed.withValues(alpha: 0.2),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          const Icon(Icons.stadium, color: kWhite, size: 32),
          const SizedBox(width: 16),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'TU ABONO',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  'Platea Bochini Alta',
                  style: TextStyle(
                    color: kWhite,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Reserva tu lugar sin costo.',
                  style: TextStyle(color: Colors.white70, fontSize: 12),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: kWhite,
              foregroundColor: kPrimaryRed,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              elevation: 0,
            ),
            child: const Text(
              'Canjear',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

class _StadiumMapMockup extends StatelessWidget {
  const _StadiumMapMockup();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFF191919),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white10),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // TODO: Acá iría un SVG o PNG del mapa de la cancha vista desde arriba
          Icon(
            Icons.crop_din,
            size: 120,
            color: kWhite.withValues(alpha: 0.05),
          ),
          const Positioned(
            child: Center(
              child: Text(
                'Mapa interactivo del estadio\n(Toque para hacer zoom)',
                textAlign: TextAlign.center,
                style: TextStyle(color: kGray, fontSize: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TribunesList extends StatelessWidget {
  // Datos estructurados según lo que pediste
  final List<Map<String, dynamic>> tribunes = [
    {
      'name': 'Tribuna Bochini',
      'sectors': ['Platea Bochini Alta', 'Platea Bochini Baja', 'Garganta 3'],
      'availability': 'Alta',
    },
    {
      'name': 'Tribuna Pavoni (Sur)',
      'sectors': ['Platea Pavoni Alta', 'Popular Pavoni Baja', 'Garganta 4'],
      'availability': 'Media',
    },
    {
      'name': 'Tribuna Santoro',
      'sectors': ['Platea Santoro Alta', 'Popular Santoro', 'Garganta 2'],
      'availability': 'Baja',
    },
    {
      'name': 'Tribuna Erico',
      'sectors': ['Platea Erico Alta', 'Platea Erico Baja', 'Garganta 1'],
      'availability': 'Alta',
    },
    {
      'name': 'Palcos y Prensa',
      'sectors': ['Palcos', 'Sector Prensa'],
      'availability': 'Agotado',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: tribunes.length,
      itemBuilder: (context, index) {
        final tribune = tribunes[index];
        final isSoldOut = tribune['availability'] == 'Agotado';

        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          decoration: BoxDecoration(
            color: kCardColor,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.white10),
          ),
          child: Theme(
            data: Theme.of(context).copyWith(
              dividerColor: Colors.transparent, // Elimina las líneas feas de Flutter por defecto
            ),
            child: ExpansionTile(
              iconColor: kWhite,
              collapsedIconColor: kGray,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      tribune['name'],
                      style: TextStyle(
                        color: isSoldOut ? kGray : kWhite,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  _buildAvailabilityBadge(tribune['availability']),
                ],
              ),
              children: (tribune['sectors'] as List<String>).map((sector) {
                return ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 0,
                  ),
                  title: Text(
                    sector,
                    style: TextStyle(
                      color: isSoldOut ? kGray : Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                  trailing: Icon(
                    Icons.chevron_right,
                    color: isSoldOut ? Colors.transparent : kPrimaryRed,
                    size: 20,
                  ),
                  onTap: isSoldOut
                      ? null
                      : () {
                          // Acción para seleccionar ese sector específico
                        },
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }

  Widget _buildAvailabilityBadge(String status) {
    Color badgeColor;
    switch (status) {
      case 'Alta':
        badgeColor = Colors.green;
        break;
      case 'Media':
        badgeColor = Colors.orange;
        break;
      case 'Baja':
        badgeColor = Colors.red;
        break;
      default:
        badgeColor = Colors.grey;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: badgeColor.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: badgeColor.withValues(alpha: 0.5)),
      ),
      child: Text(
        status,
        style: TextStyle(
          color: badgeColor,
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
