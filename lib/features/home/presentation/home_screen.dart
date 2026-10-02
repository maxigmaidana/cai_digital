import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 1. Header (Dynamic Island / Notch mockup area)
                const SizedBox(height: 50), // Spacing for top edge
                const _CustomAppBar(),
                const SizedBox(height: 24),

                // 2. Membership Card
                const _MembershipCard(),
                const SizedBox(height: 24),

                // 3. Payment Status Card
                const _PaymentStatusCard(),
                const SizedBox(height: 24),

                // 4. Accesos Rápidos Title
                const Padding(
                  padding: EdgeInsets.only(bottom: 16.0),
                  child: Text(
                    'Accesos Rápidos',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),

                // 5. Accesos Rápidos Grid
                const _QuickAccessGrid(),
                const SizedBox(height: 24),

                // 6. Última Noticia Title
                const Padding(
                  padding: EdgeInsets.only(bottom: 16.0),
                  child: Text(
                    'Última Noticia',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),

                // 7. Última Noticia Card
                const _LatestNewsCard(),
                const SizedBox(height: 40), // Bottom padding
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ---------------------------------------------------------
// Helper Widgets
// ---------------------------------------------------------

class _CustomAppBar extends StatelessWidget {
  const _CustomAppBar();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 20,
          backgroundColor: Colors.grey,
          backgroundImage: AssetImage('assets/image.png'),
        ),
        const SizedBox(width: 12),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Bienvenido',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            Text(
              'Joan Fernandez',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const Spacer(),
        Stack(
          children: [
            IconButton(
              icon: const Icon(Icons.notifications_none, color: Colors.grey),
              onPressed: () {},
            ),
            Positioned(
              right: 8,
              top: 8,
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                constraints: const BoxConstraints(minWidth: 8, minHeight: 8),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _MembershipCard extends StatelessWidget {
  const _MembershipCard();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context)
            .push('/home/carnet-info'); // Navigate to the QR screen
      },
      child: Column(
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF8B0000), // Dark red
                  Color(0xFF4A0000), // Deeper red
                ],
              ),
            ),
            child: Stack(
              children: [
                // Top Right text
                const Positioned(
                  top: 16,
                  right: 16,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'SOCIO ACTIVO',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Colors.white70,
                        ),
                      ),
                      Text(
                        '#223 456',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                // Top Left small icon
                Positioned(
                  top: 16,
                  left: 16,
                  child: Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: Colors.white24,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.credit_card_off,
                        size: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                // Main text and photo icon
                const Positioned(
                  left: 16,
                  bottom: 16,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'TITULAR',
                        style: TextStyle(fontSize: 10, color: Colors.white70),
                      ),
                      Text(
                        'Joan Fernandez',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Dende: 12/2026',
                        style: TextStyle(fontSize: 12, color: Colors.white70),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  right: 16,
                  bottom: 16,
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white24,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.portrait,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 6,
                height: 6,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 4),
              Container(
                width: 6,
                height: 6,
                decoration: const BoxDecoration(
                  color: Colors.white24,
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _PaymentStatusCard extends StatelessWidget {
  const _PaymentStatusCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E), // Dark card color
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: const BoxDecoration(
              color: Color(0x3300FF00), // Transparent green background
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.check, color: Color(0xFF00FF00), size: 20),
          ),
          const SizedBox(width: 12),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'CUOTA SOCIAL',
                style: TextStyle(fontSize: 10, color: Colors.grey),
              ),
              Text(
                'Enero 2024',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFF00FF00),
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Text(
              '40 DÍA',
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 12),
          const Text(
            'Revisar >',
            style: TextStyle(color: Colors.red, fontSize: 12),
          ),
        ],
      ),
    );
  }
}

class _QuickAccessGrid extends StatelessWidget {
  const _QuickAccessGrid();

  @override
  Widget build(BuildContext context) {
    final itemsfirstLine = [
      {'icon': Icons.group, 'label': 'Peñas', 'route': '/home/groups'},
      {
        'icon': Icons.view_compact,
        'label': 'Entradas',
        'route': '/home/proximo-partido',
      },
      {
        'icon': Icons.feed,
        'label': 'Cuota\nSocial',
        'route': '/home/social-cuote',
      },
    ];

    final itemsSecondLine = [
      {
        'icon': Icons.card_giftcard,
        'label': 'Tienda',
        'route': '/home/tienda-roja',
      },
      {'icon': Icons.local_offer, 'label': 'Promos', 'route': '/home/promos'},
      {
        'icon': Icons.person,
        'label': 'Rey de\nCopas',
        'route': '/home/user-info',
      },
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              for (var item in itemsfirstLine)
                _buildQuickAccessItem(
                  context,
                  item['icon'] as IconData,
                  item['label'] as String,
                  item['route'] as String,
                ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              for (var item in itemsSecondLine)
                _buildQuickAccessItem(
                  context,
                  item['icon'] as IconData,
                  item['label'] as String,
                  item['route'] as String,
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildQuickAccessItem(
    BuildContext context,
    IconData icon,
    String label,
    String route,
  ) {
    return GestureDetector(
      onTap: () => context.go(route),
      child: SizedBox(
        width: (64 + 12),
        child: Column(
          children: [
            Container(
              width: 64,
              height: 64,
              decoration: const BoxDecoration(
                color: Color(0xFF1E1E1E), // Dark card color
                shape: BoxShape.circle,
              ),
              child: Center(child: Icon(icon, size: 30, color: Colors.red)),
            ),
            const SizedBox(height: 8),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 10, color: Colors.grey),
              maxLines: 2,
            ),
          ],
        ),
      ),
    );
  }
}

class _LatestNewsCard extends StatelessWidget {
  const _LatestNewsCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Stadium image mockup
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                child: Image.network(
                  'https://cdn.diariocastellanos.com.ar/wp-content/uploads/2026/04/04232602/image-36.jpg', // Placeholder with text
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                left: 16,
                bottom: 16,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Text(
                    'FÚTBOL PROFESIONAL',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          // News content
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Victoria en el clásico de Avellaneda',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'El Rayo se impuso con autoridad ante su eterna flojo en una nocve inroidable en el..',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
