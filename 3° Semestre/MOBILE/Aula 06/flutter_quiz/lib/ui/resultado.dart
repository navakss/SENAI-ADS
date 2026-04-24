import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int acertos;
  final int total;

  const Resultado({super.key, required this.acertos, required this.total});

  String get _mensagem {
    final porcentagem = acertos / total;
    if (porcentagem == 1.0) return '🏆 Perfeito! Mandou muito bem!';
    if (porcentagem >= 0.7) return '🎉 Muito bom! Continue assim!';
    if (porcentagem >= 0.5) return '👍 Bom desempenho! Você pode mais!';
    return '📚 Estude mais e tente novamente!';
  }

  Color get _corPlacar {
    final porcentagem = acertos / total;
    if (porcentagem == 1.0) return const Color(0xFFFFD700);
    if (porcentagem >= 0.7) return const Color(0xFF00C897);
    if (porcentagem >= 0.5) return const Color(0xFF00D4FF);
    return const Color(0xFFFF4757);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A2E),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Resultado',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 2,
                ),
              ),
              const SizedBox(height: 40),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 48,
                  vertical: 32,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFF16213E),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: _corPlacar.withOpacity(0.5),
                    width: 2,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: _corPlacar.withOpacity(0.2),
                      blurRadius: 20,
                      spreadRadius: 4,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Text(
                      '$acertos/$total',
                      style: TextStyle(
                        fontSize: 64,
                        fontWeight: FontWeight.w900,
                        color: _corPlacar,
                        height: 1,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'acerto${acertos != 1 ? 's' : ''}',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Color(0xFFAAAAAA),
                        letterSpacing: 1,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 32),

              Text(
                _mensagem,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  height: 1.5,
                ),
              ),

              const SizedBox(height: 48),

              // Botão de tentar novamente
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.of(context).popUntil((route) => route.isFirst);
                },
                icon: const Icon(Icons.refresh_rounded),
                label: const Text(
                  'Tentar Novamente',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF00D4FF),
                  foregroundColor: const Color(0xFF1A1A2E),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 36,
                    vertical: 16,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 8,
                  shadowColor: const Color(0xFF00D4FF).withOpacity(0.4),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
