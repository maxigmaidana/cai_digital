import 'package:cai_digital/features/groups/presentation/groups_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PromosScreen extends StatefulWidget {
  const PromosScreen({super.key});

  @override
  State<PromosScreen> createState() => _PromosScreenState();
}

class _PromosScreenState extends State<PromosScreen> {
  String selectedFilter = 'Todos';

  final List<String> filters = [
    'Todos',
    'Telefonía',
    'Gastronomía',
    'Indumentaria',
    'Entretenimiento',
  ];

  final List<Map<String, dynamic>> promos = [
    {
      'brand': 'Personal',
      'category': 'Telefonía',
      'discount': '50%',
      'title': '50% OFF en tu línea Personal',
      'description': 'Beneficio exclusivo para socios en planes seleccionados.',
      'details':
          '50% de descuento en tu línea Personal. Tope de reintegro \$10.000',
      'validity': 'Hasta el 31/12/2026',
      'icon': Icons.phone,
      'isHighlight': true,
    },
    {
      'brand': 'Mostaza',
      'category': 'Gastronomía',
      'discount': '30%',
      'title': '30% OFF en tu compra',
      'description': 'Presentando tu carnet digital.',
      'details': '30% de descuento en tu compra presentando carnet digital.',
      'validity': 'Hasta el 30/11/2026',
      'icon': Icons.restaurant,
      'isHighlight': false,
    },
    {
      'brand': 'Puma',
      'category': 'Indumentaria',
      'discount': '25%',
      'title': '25% OFF en productos seleccionados',
      'description': 'En la tienda física y online.',
      'details': '25% de descuento en productos seleccionados.',
      'validity': 'Hasta el 31/10/2026',
      'icon': Icons.shopping_bag,
      'isHighlight': false,
    },
    {
      'brand': 'Cinemark',
      'category': 'Entretenimiento',
      'discount': '2x1',
      'title': '2x1 en entradas de cine',
      'description': 'Presenta tu carnet digital en caja.',
      'details': '2 entradas por el precio de 1 en cines adheridos.',
      'validity': 'Hasta el 30/09/2026',
      'icon': Icons.local_movies,
      'isHighlight': false,
    },
    {
      'brand': 'Havanna',
      'category': 'Gastronomía',
      'discount': '20%',
      'title': '20% OFF en compras',
      'description': 'Chocolates y productos premium.',
      'details': '20% de descuento en toda la tienda.',
      'validity': 'Hasta el 31/12/2026',
      'icon': Icons.cake,
      'isHighlight': false,
    },
    {
      'brand': 'SportClub',
      'category': 'Entretenimiento',
      'discount': '40%',
      'title': '40% OFF en membresía',
      'description': 'En gimnasios adheridos a la red.',
      'details': '40% de descuento en membresía anual.',
      'validity': 'Hasta el 31/08/2026',
      'icon': Icons.fitness_center,
      'isHighlight': false,
    },
  ];

  List<Map<String, dynamic>> get filteredPromos {
    if (selectedFilter == 'Todos') {
      return promos;
    }
    return promos.where((p) => p['category'] == selectedFilter).toList();
  }

  void _showPromoDetail(Map<String, dynamic> promo) {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF1E1E1E),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(promo['icon'] as IconData, color: Colors.red, size: 30),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      promo['brand'] as String,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      promo['category'] as String,
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              promo['discount'] as String,
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              promo['title'] as String,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              promo['details'] as String,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Icon(Icons.calendar_today, size: 16, color: Colors.grey),
                const SizedBox(width: 8),
                Text(
                  promo['validity'] as String,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.red.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Row(
                children: [
                  Icon(Icons.info_outline, size: 16, color: Colors.red),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Beneficio válido para Socios Activos. Sujeto a disponibilidad y condiciones del comercio adherido.',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Beneficio seleccionado'),
                      backgroundColor: Colors.red,
                      duration: Duration(seconds: 2),
                    ),
                  );
                },
                child: const Text(
                  'Usar beneficio',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

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
          'Promociones',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: kWhite,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.help_outline, color: kGray),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Filtros horizontales
            SizedBox(
              height: 48,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: filters.length,
                itemBuilder: (context, index) {
                  final filter = filters[index];
                  final isSelected = selectedFilter == filter;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedFilter = filter;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 12),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? Colors.red
                            : const Color(0xFF1E1E1E),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: isSelected ? Colors.red : Colors.grey.shade800,
                          width: 1,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          filter,
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.grey,
                            fontWeight: isSelected
                                ? FontWeight.bold
                                : FontWeight.normal,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            // Contenido
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Título
                      const Text(
                        'Beneficios para vos',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Disfrutá descuentos exclusivos por ser Socio Activo.',
                        style: TextStyle(fontSize: 13, color: Colors.grey),
                      ),
                      const SizedBox(height: 20),
                      // Promo Destacada
                      GestureDetector(
                        onTap: () => _showPromoDetail(promos[0]),
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [Color(0xFF8B0000), Color(0xFF4A0000)],
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                '50% OFF',
                                style: TextStyle(
                                  fontSize: 36,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                'en tu línea Personal',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white70,
                                ),
                              ),
                              const SizedBox(height: 16),
                              const Text(
                                'Beneficio exclusivo para Socios Activos',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.white60,
                                ),
                              ),
                              const SizedBox(height: 16),
                              Row(
                                children: [
                                  const Spacer(),
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: Colors.white12,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: const Icon(
                                      Icons.arrow_forward,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      // Promociones listadas
                      Column(
                        children: [
                          for (var i = 1; i < filteredPromos.length; i++)
                            GestureDetector(
                              onTap: () => _showPromoDetail(filteredPromos[i]),
                              child: Container(
                                margin: const EdgeInsets.only(bottom: 16),
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF1E1E1E),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.all(12),
                                          decoration: BoxDecoration(
                                            color: Colors.red.withOpacity(0.1),
                                            borderRadius: BorderRadius.circular(
                                              12,
                                            ),
                                          ),
                                          child: Icon(
                                            filteredPromos[i]['icon']
                                                as IconData,
                                            color: Colors.red,
                                            size: 24,
                                          ),
                                        ),
                                        const SizedBox(width: 12),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                filteredPromos[i]['brand']
                                                    as String,
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              Text(
                                                filteredPromos[i]['category']
                                                    as String,
                                                style: const TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Text(
                                          filteredPromos[i]['discount']
                                              as String,
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.red,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 12),
                                    Text(
                                      filteredPromos[i]['title'] as String,
                                      style: const TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(height: 6),
                                    Text(
                                      filteredPromos[i]['description']
                                          as String,
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.calendar_today,
                                          size: 12,
                                          color: Colors.grey,
                                        ),
                                        const SizedBox(width: 6),
                                        Text(
                                          filteredPromos[i]['validity']
                                              as String,
                                          style: const TextStyle(
                                            fontSize: 11,
                                            color: Colors.grey,
                                          ),
                                        ),
                                        const Spacer(),
                                        const Icon(
                                          Icons.chevron_right,
                                          color: Colors.grey,
                                          size: 20,
                                        ),
                                      ],
                                    ),
                                  ],
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
          ],
        ),
      ),
    );
  }
}
