import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// Constantes de color para mantener la estética
const Color kBackgroundColor = Color(0xFF121212);
const Color kCardColor = Color(0xFF1F1F1F);
const Color kPrimaryRed = Color(0xFFD32F2F);
const Color kSecondaryRed = Color(0xFF8B0000);
const Color kWhite = Colors.white;
const Color kGray = Colors.grey;

class GroupsScreen extends StatelessWidget {
  const GroupsScreen({super.key});

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
          'Peñas Oficiales',
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
              // 1. Barra de búsqueda
              const _SearchBar(),
              const SizedBox(height: 24),

              // 2. Extra UX: Peña más cercana a la ubicación del usuario
              const Text(
                'Más cerca tuyo',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: kWhite,
                ),
              ),
              const SizedBox(height: 12),
              const _NearestPenaCard(),
              const SizedBox(height: 24),

              // 3. Listado por Provincias
              const Text(
                'Listado por Provincias',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: kWhite,
                ),
              ),
              const SizedBox(height: 12),
              _ProvincesList(),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}

class _SearchBar extends StatelessWidget {
  const _SearchBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kCardColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white10),
      ),
      child: const TextField(
        style: TextStyle(color: kWhite),
        decoration: InputDecoration(
          hintText: 'Buscar por nombre o ciudad...',
          hintStyle: TextStyle(color: kGray, fontSize: 14),
          prefixIcon: Icon(Icons.search, color: kGray),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 16),
        ),
      ),
    );
  }
}

class _NearestPenaCard extends StatelessWidget {
  const _NearestPenaCard();

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
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: kPrimaryRed.withValues(alpha: 0.2),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.location_on, color: kWhite, size: 20),
              const SizedBox(width: 8),
              const Text(
                'QUILMES, BUENOS AIRES',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: kWhite.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  'A 2.5 km',
                  style: TextStyle(
                    color: kWhite,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Text(
            'Peña Roja "Ricardo Bochini"',
            style: TextStyle(
              color: kWhite,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              _buildQuickAction(Icons.phone, 'Llamar'),
              const SizedBox(width: 12),
              _buildQuickAction(Icons.map, 'Cómo llegar'),
              const SizedBox(width: 12),
              _buildQuickAction(
                Icons.camera_alt,
                'Instagram',
              ), // Mock icono de instagram
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildQuickAction(IconData icon, String label) {
    return Expanded(
      child: InkWell(
        onTap: () {},
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: kWhite.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              Icon(icon, color: kWhite, size: 16),
              const SizedBox(height: 4),
              Text(label, style: const TextStyle(color: kWhite, fontSize: 10)),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProvincesList extends StatelessWidget {
  // Mock de datos con la estructura para reemplazar luego
  final List<Map<String, dynamic>> regions = [
    {
      'name': 'Provincia de Buenos Aires',
      'penas': [
        {
          'name': 'Peña Roja "Mar del Plata"',
          'city': 'Mar del Plata',
          'phone': '+54 9 223 456-7890',
          'members': 540,
        },
        {
          'name': 'Peña Roja "Bahía Blanca"',
          'city': 'Bahía Blanca',
          'phone': '+54 9 291 555-1234',
          'members': 290,
        },
        {
          'name': 'Peña "La Plata bondi rojo"',
          'city': 'La Plata',
          'phone': '+54 9 221 444-9876',
          'members': 480,
        },
      ],
    },
    {
      'name': 'Córdoba',
      'penas': [
        {
          'name': 'Peña Cordobesa del Rojo',
          'city': 'Córdoba Capital',
          'phone': '+54 9 351 789-1234',
          'members': 310,
        },
      ],
    },
    {
      'name': 'Santa Fe',
      'penas': [
        {
          'name': 'Peña Rosarina Independiente',
          'city': 'Rosario',
          'phone': '+54 9 341 654-3210',
          'members': 390,
        },
      ],
    },
    {
      'name': 'Mendoza',
      'penas': [
        {
          'name': 'Peña Cuyana Roja',
          'city': 'Mendoza Capital',
          'phone': '+54 9 261 321-4321',
          'members': 220,
        },
      ],
    },
    {
      'name': 'Internacional',
      'penas': [
        {
          'name': 'Peña Independiente Miami',
          'city': 'Miami, Estados Unidos',
          'phone': '+1 305 555-7890',
          'members': 120,
        },
        {
          'name': 'Peña Independiente Barcelona',
          'city': 'Barcelona, España',
          'phone': '+34 611 223-344',
          'members': 95,
        },
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: regions.length,
      itemBuilder: (context, index) {
        final region = regions[index];
        final penas = region['penas'] as List<Map<String, dynamic>>;

        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          decoration: BoxDecoration(
            color: kCardColor,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.white10),
          ),
          child: Theme(
            data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
            child: ExpansionTile(
              iconColor: kPrimaryRed,
              collapsedIconColor: kGray,
              title: Text(
                region['name'],
                style: const TextStyle(
                  color: kWhite,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              children: penas.map((pena) {
                return _PenaItemCard(
                  name: pena['name'],
                  city: pena['city'],
                  phone: pena['phone'],
                  members: pena['members'],
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}

class _PenaItemCard extends StatelessWidget {
  final String name;
  final String city;
  final String phone;
  final int members;

  const _PenaItemCard({
    required this.name,
    required this.city,
    required this.phone,
    required this.members,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: kBackgroundColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        color: kWhite,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(Icons.location_city, color: kGray, size: 12),
                        const SizedBox(width: 4),
                        Text(
                          city,
                          style: const TextStyle(color: kGray, fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: kCardColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.people, color: kPrimaryRed, size: 12),
                    const SizedBox(width: 4),
                    Text(
                      '$members',
                      style: const TextStyle(
                        color: kWhite,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: Divider(color: Colors.white10, height: 1),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.phone, color: kGray, size: 14),
                  const SizedBox(width: 8),
                  Text(
                    phone,
                    style: const TextStyle(color: kWhite, fontSize: 12),
                  ),
                ],
              ),
              InkWell(
                onTap: () {},
                child: const Text(
                  'Contactar',
                  style: TextStyle(
                    color: kPrimaryRed,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
