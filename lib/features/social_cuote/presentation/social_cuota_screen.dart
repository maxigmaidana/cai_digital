import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// Constantes de color
const Color kBackgroundColor = Color(0xFF121212);
const Color kCardColor = Color(0xFF1F1F1F);
const Color kPrimaryRed = Color(0xFFD32F2F);
const Color kSuccessGreen = Color(0xFF4CAF50); // Verde para los pagos exitosos
const Color kWhite = Colors.white;
const Color kGray = Colors.grey;

class SocialCuotaScreen extends StatelessWidget {
  const SocialCuotaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: kWhite),
          onPressed: () {
            GoRouter.of(context).pop();
          },
        ),
        title: const Text(
          'Estado de Cuenta',
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
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Tarjeta de Pago Pendiente
              const _PendingPaymentCard(),
              const SizedBox(height: 24),

              // 2. Extra UX: Método de Pago y Débito Automático
              const Text(
                'Método de Pago',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: kWhite,
                ),
              ),
              const SizedBox(height: 12),
              const _PaymentMethodSection(),
              const SizedBox(height: 32),

              // 3. Historial de Pagos
              const Text(
                'Historial de Pagos',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: kWhite,
                ),
              ),
              const SizedBox(height: 12),
              _PaymentHistoryList(),

              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}

class _PendingPaymentCard extends StatelessWidget {
  const _PendingPaymentCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: kCardColor,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: kPrimaryRed.withValues(alpha: 0.5),
          width: 1.5,
        ), // Borde rojo para destacar
        boxShadow: [
          BoxShadow(
            color: kPrimaryRed.withValues(alpha: 0.1),
            blurRadius: 20,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.calendar_month, color: kPrimaryRed, size: 20),
              SizedBox(width: 8),
              Text(
                'CUOTA SEPTIEMBRE 2026',
                style: TextStyle(
                  color: kGray,
                  fontSize: 12,
                  letterSpacing: 1.2,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Text(
            r'$37.000',
            style: TextStyle(
              color: kWhite,
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: kPrimaryRed.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Text(
              'Vence el 10 de Septiembre',
              style: TextStyle(
                color: kPrimaryRed,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                // Acción de pagar
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: kPrimaryRed,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 4,
              ),
              child: const Text(
                'Pagar Ahora',
                style: TextStyle(
                  color: kWhite,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PaymentMethodSection extends StatefulWidget {
  const _PaymentMethodSection();

  @override
  State<_PaymentMethodSection> createState() => _PaymentMethodSectionState();
}

class _PaymentMethodSectionState extends State<_PaymentMethodSection> {
  bool _autoPayEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Tarjeta Mockeada
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: kCardColor,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: kBackgroundColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.credit_card, color: kWhite, size: 24),
              ),
              const SizedBox(width: 16),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Visa ICBC',
                      style: TextStyle(
                        color: kWhite,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      'Termina en 4123',
                      style: TextStyle(color: kGray, fontSize: 12),
                    ),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Cambiar',
                  style: TextStyle(color: kPrimaryRed),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        // Toggle de Débito Automático
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          decoration: BoxDecoration(
            color: kCardColor.withValues(alpha: 0.5),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.white10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Débito Automático',
                      style: TextStyle(
                        color: kWhite,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'Olvidate de los vencimientos',
                      style: TextStyle(color: kGray, fontSize: 11),
                    ),
                  ],
                ),
              ),
              Switch(
                value: _autoPayEnabled,
                onChanged: (value) {
                  setState(() {
                    _autoPayEnabled = value;
                  });
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _PaymentHistoryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Datos mockeados del historial
    final history = [
      {'month': 'Agosto 2026', 'amount': r'$37.000', 'date': '05/08/2026'},
      {'month': 'Julio 2026', 'amount': r'$37.000', 'date': '02/07/2026'},
      {'month': 'Junio 2026', 'amount': r'$35.000', 'date': '08/06/2026'},
      {'month': 'Mayo 2026', 'amount': r'$35.000', 'date': '10/05/2026'},
    ];

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: history.length,
      separatorBuilder: (context, index) =>
          const Divider(color: Colors.white10, height: 1),
      itemBuilder: (context, index) {
        final item = history[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: kSuccessGreen.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.check, color: kSuccessGreen, size: 16),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item['month']!,
                      style: const TextStyle(
                        color: kWhite,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'Pagado el ${item['date']}',
                      style: const TextStyle(color: kGray, fontSize: 11),
                    ),
                  ],
                ),
              ),
              Text(
                item['amount']!,
                style: const TextStyle(
                  color: kWhite,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
