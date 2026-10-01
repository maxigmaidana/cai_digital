import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// Constantes de color para mantener la estética
const Color kBackgroundColor = Color(0xFF121212);
const Color kCardColor = Color(0xFF1F1F1F);
const Color kPrimaryRed = Color(0xFFD32F2F);
const Color kDarkRedBanner = Color(
  0xFF2A1111,
); // Fondo para el banner de descuento
const Color kWhite = Colors.white;
const Color kGray = Colors.grey;

class TiendaRojaScreen extends StatelessWidget {
  const TiendaRojaScreen({super.key});

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
          'Tienda Roja',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: kWhite,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: kWhite),
            onPressed: () {},
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart_outlined, color: kWhite),
                onPressed: () {},
              ),
              // Positioned(
              //   right: 8,
              //   top: 8,
              //   child: Container(
              //     padding: const EdgeInsets.all(4),
              //     decoration: const BoxDecoration(
              //       color: kPrimaryRed,
              //       shape: BoxShape.circle,
              //     ),
              //     child: const Text(
              //       '3', // Mock de cantidad en carrito
              //       style: TextStyle(
              //         color: kWhite,
              //         fontSize: 8,
              //         fontWeight: FontWeight.bold,
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),

              // 1. Banner de Descuento
              const _DiscountBanner(),
              const SizedBox(height: 20),

              // 2. Carrusel Destacado
              const _FeaturedCarousel(),
              const SizedBox(height: 24),

              // 3. Filtros de Categoría
              const _CategoryFilters(),
              const SizedBox(height: 20),

              // 4. Grilla de Productos
              _ProductGrid(),

              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}

class _DiscountBanner extends StatelessWidget {
  const _DiscountBanner();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: kDarkRedBanner,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: kPrimaryRed.withValues(alpha: 0.3), width: 1),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: kPrimaryRed.withValues(alpha: 0.2),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.local_offer, color: kPrimaryRed, size: 20),
          ),
          const SizedBox(width: 16),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '¡Descuento de Socio Activo!',
                  style: TextStyle(
                    color: kWhite,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Tenés un 20% OFF en toda la tienda.',
                  style: TextStyle(color: kGray, fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _FeaturedCarousel extends StatelessWidget {
  const _FeaturedCarousel();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 180,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFFE53935), // Rojo vibrante arriba
                Color(0xFF8E0000), // Rojo oscuro abajo
              ],
            ),
          ),
          child: Stack(
            children: [
              // TODO: Insertar imagen destacada (PNG sin fondo de la camiseta) aquí
              // Por ejemplo: Image.network('url', fit: BoxFit.cover),
              Center(
                child: Opacity(
                  opacity: 0.5,
                  child: Icon(
                    Icons.checkroom,
                    size: 100,
                    color: kWhite.withValues(alpha: 0.5),
                  ), // Placeholder
                ),
              ),

              const Positioned(
                bottom: 20,
                left: 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'TITULAR',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 10,
                        letterSpacing: 1,
                      ),
                    ),
                    Text(
                      'Tienda Roja',
                      style: TextStyle(
                        color: kWhite,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        // Paginación (Puntitos)
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 8,
              height: 8,
              decoration: const BoxDecoration(
                color: kPrimaryRed,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 6),
            Container(
              width: 6,
              height: 6,
              decoration: const BoxDecoration(
                color: kGray,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 6),
            Container(
              width: 6,
              height: 6,
              decoration: const BoxDecoration(
                color: kGray,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 6),
            Container(
              width: 6,
              height: 6,
              decoration: const BoxDecoration(
                color: kGray,
                shape: BoxShape.circle,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _CategoryFilters extends StatelessWidget {
  const _CategoryFilters();

  @override
  Widget build(BuildContext context) {
    final categories = ['Todo', 'Camisetas', 'Shorts', 'Accesorios'];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categories.map((category) {
          final isSelected = category == 'Todo'; // Mock de estado seleccionado
          return Container(
            margin: const EdgeInsets.only(right: 12),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: isSelected ? kPrimaryRed : kCardColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              category,
              style: TextStyle(
                color: isSelected ? kWhite : kGray,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                fontSize: 14,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class _ProductGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(), // Desactiva el scroll interno de la grilla
      crossAxisCount: 2,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      childAspectRatio: 0.55, // Ajustar según lo alto que quieras las tarjetas
      children: const [
        _ProductCard(
          category: 'TITULAR',
          name: 'Camiseta Alternativa CAI 26/27',
          price: r'$169.999',
          oldPrice: r'$189.999',
          isHighlighted: false,
          url: 'https://images.puma.com/image/upload/f_auto,q_auto,w_600,b_rgb:FAFAFA/global/696064/01/fnd/ARG/fmt/png', // URL de ejemplo
        ),
        _ProductCard(
          category: 'SHORTS',
          name: 'Short Alternativo CAI 26/27',
          price: r'$89.999',
          oldPrice: r'$99.999',
          isHighlighted: false,
          url: 'https://images.puma.com/image/upload/f_auto,q_auto,w_600,b_rgb:FAFAFA/global/696072/01/fnd/ARG/fmt/png', // URL de ejemplo
        ),
        _ProductCard(
          category: 'CAMPERA',
          name: 'Campera CAI FTBLARCHIVE',
          price: r'$119.999',
          oldPrice: r'$139.999',
          isHighlighted: false,
          url: 'https://images.puma.com/image/upload/f_auto,q_auto,w_600,b_rgb:FAFAFA/global/689679/01/fnd/ARG/fmt/png',
        ),
        _ProductCard(
          category: 'CAMISETA',
          name: 'Camiseta Tercer Conjunto CAI',
          price: r'$149.999',
          oldPrice: r'$169.999',
          isHighlighted: false,
          url: 'https://images.puma.com/image/upload/f_auto,q_auto,w_600,b_rgb:FAFAFA/global/691358/01/fnd/ARG/fmt/png', // URL de ejemplo
        ),
        _ProductCard(
          category: 'TITULAR',
          name: 'Camiseta Titular CAI 26/27 Mujer',
          price: r'$159.999',
          oldPrice: r'$189.999',
          isHighlighted: false,
          url: 'https://images.puma.com/image/upload/f_auto,q_auto,w_600,b_rgb:FAFAFA/global/714048/01/fnd/ARG/fmt/png',
        ),
        _ProductCard(
          category: 'REMERAS',
          name: 'Remera CAI FTBLARCHIVE',
          price: r'$59.999',
          oldPrice: r'$70.000',
          isHighlighted: false,
          url: 'https://images.puma.com/image/upload/f_auto,q_auto,w_600,b_rgb:FAFAFA/global/689678/02/fnd/ARG/fmt/png',
        ),
        _ProductCard(
          category: 'TITULAR',
          name: 'Camiseta Titular CAI 26/27 Manga Larga',
          price: r'$199.999',
          oldPrice: r'$229.999',
          isHighlighted: false,
          url: 'https://images.puma.com/image/upload/f_auto,q_auto,w_600,b_rgb:FAFAFA/global/714051/01/fnd/ARG/fmt/png',
        ),
      ],
    );
  }
}

class _ProductCard extends StatelessWidget {
  final String category;
  final String name;
  final String price;
  final String oldPrice;
  final bool isHighlighted;
  final String url;

  const _ProductCard({
    required this.category,
    required this.name,
    required this.price,
    required this.oldPrice,
    required this.isHighlighted,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kCardColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Contenedor de la Imagen
          Container(
            height: 140,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: kWhite, // Fondo blanco para las fotos de producto
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            ),
            child: Center(
              // TODO: Insertar imagen real del producto aquí
              child: Image.network(url),
            ),
          ),

          // Info del Producto
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  category,
                  style: const TextStyle(
                    color: kGray,
                    fontSize: 10,
                    letterSpacing: 1,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  name,
                  style: const TextStyle(
                    color: kWhite,
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    height: 1.2,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 12),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      price,
                      style: const TextStyle(
                        color: kPrimaryRed,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      oldPrice,
                      style: const TextStyle(
                        color: kGray,
                        fontSize: 10,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Botón Agregar
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isHighlighted
                          ? kWhite
                          : const Color(0xFF2C2C2C),
                      foregroundColor: isHighlighted ? kPrimaryRed : kWhite,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.shopping_bag,
                          size: 14,
                          color: isHighlighted ? kPrimaryRed : kGray,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          'Agregar',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: isHighlighted ? kPrimaryRed : kWhite,
                          ),
                        ),
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
