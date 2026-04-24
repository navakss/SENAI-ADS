import 'package:flutter/material.dart';
import 'package:flutter_quiz/ui/resultado.dart';
import 'package:flutter_quiz/ui/resultado.dart';
import '../../root/pallet.dart';

class Pergunta {
  final String enunciado;
  final String categoria;
  final List<String> opcoes;
  final int respostaCorreta;

  const Pergunta({
    required this.enunciado,
    required this.categoria,
    required this.opcoes,
    required this.respostaCorreta,
  });
}

const List<Pergunta> perguntas = [
  // ── Flutter ──────────────────────────────────────────────────────────────
  Pergunta(
    enunciado:
        'Qual widget no Flutter é usado para criar uma lista rolável de itens?',
    categoria: 'Flutter',
    opcoes: ['Column', 'ListView', 'Stack', 'GridView'],
    respostaCorreta: 1,
  ),
  Pergunta(
    enunciado: 'O que é o "State" em Flutter?',
    categoria: 'Flutter',
    opcoes: [
      'O estilo visual do app',
      'Dados que podem mudar e causar reconstrução do widget',
      'O arquivo de configuração do projeto',
      'O método principal de navegação',
    ],
    respostaCorreta: 1,
  ),
  Pergunta(
    enunciado: 'Qual é o comando para criar um novo projeto Flutter?',
    categoria: 'Flutter',
    opcoes: [
      'flutter start myapp',
      'flutter init myapp',
      'flutter create myapp',
      'flutter new myapp',
    ],
    respostaCorreta: 2,
  ),
  Pergunta(
    enunciado:
        'Qual widget é usado para centralizar um filho na tela em Flutter?',
    categoria: 'Flutter',
    opcoes: ['Align', 'Padding', 'Center', 'Container'],
    respostaCorreta: 2,
  ),
  Pergunta(
    enunciado:
        'Em Flutter, qual método é chamado para atualizar o estado de um StatefulWidget?',
    categoria: 'Flutter',
    opcoes: ['rebuild()', 'setState()', 'updateState()', 'refresh()'],
    respostaCorreta: 1,
  ),

  // ── HTML ─────────────────────────────────────────────────────────────────
  Pergunta(
    enunciado: 'Qual tag HTML é usada para criar um link de hipertexto?',
    categoria: 'HTML',
    opcoes: ['<link>', '<href>', '<a>', '<nav>'],
    respostaCorreta: 2,
  ),
  Pergunta(
    enunciado:
        'Qual atributo HTML é usado para definir um estilo inline em um elemento?',
    categoria: 'HTML',
    opcoes: ['class', 'style', 'css', 'theme'],
    respostaCorreta: 1,
  ),
  Pergunta(
    enunciado:
        'Qual tag define o título da página exibido na aba do navegador?',
    categoria: 'HTML',
    opcoes: ['<header>', '<h1>', '<title>', '<meta>'],
    respostaCorreta: 2,
  ),

  // ── CSS ──────────────────────────────────────────────────────────────────
  Pergunta(
    enunciado:
        'Qual propriedade CSS é usada para mudar a cor de fundo de um elemento?',
    categoria: 'CSS',
    opcoes: ['color', 'background-color', 'fill', 'bg-color'],
    respostaCorreta: 1,
  ),
  Pergunta(
    enunciado: 'O que significa a sigla "CSS"?',
    categoria: 'CSS',
    opcoes: [
      'Creative Style Syntax',
      'Computer Style Sheet',
      'Cascading Style Sheets',
      'Colorful Style System',
    ],
    respostaCorreta: 2,
  ),
  Pergunta(
    enunciado:
        'Qual propriedade CSS define o espaçamento interno de um elemento?',
    categoria: 'CSS',
    opcoes: ['margin', 'spacing', 'padding', 'gap'],
    respostaCorreta: 2,
  ),
  Pergunta(
    enunciado:
        'Qual valor de "display" CSS transforma os filhos em colunas/linhas flexíveis?',
    categoria: 'CSS',
    opcoes: ['block', 'inline', 'flex', 'grid'],
    respostaCorreta: 2,
  ),

  // ── JavaScript ───────────────────────────────────────────────────────────
  Pergunta(
    enunciado:
        'Qual ambiente de execução permite rodar JavaScript no servidor?',
    categoria: 'JavaScript',
    opcoes: ['Django', 'Node.js', 'Laravel', 'Spring'],
    respostaCorreta: 1,
  ),
  Pergunta(
    enunciado: 'O que faz a função "console.log()" em JavaScript?',
    categoria: 'JavaScript',
    opcoes: [
      'Salva dados no banco',
      'Exibe uma mensagem no terminal/console',
      'Cria um novo arquivo de log',
      'Encerra o programa',
    ],
    respostaCorreta: 1,
  ),
  Pergunta(
    enunciado:
        'Qual método HTTP é normalmente usado para criar um novo recurso numa API REST?',
    categoria: 'JavaScript',
    opcoes: ['GET', 'DELETE', 'POST', 'PATCH'],
    respostaCorreta: 2,
  ),
  Pergunta(
    enunciado: 'O que é "async/await" em JavaScript?',
    categoria: 'JavaScript',
    opcoes: [
      'Um tipo especial de variável',
      'Sintaxe para lidar com operações assíncronas de forma legível',
      'Um framework de testes',
      'Uma forma de importar módulos',
    ],
    respostaCorreta: 1,
  ),
  Pergunta(
    enunciado:
        'Qual pacote Node.js é amplamente usado para criar servidores HTTP de forma simples?',
    categoria: 'JavaScript',
    opcoes: ['axios', 'lodash', 'express', 'mongoose'],
    respostaCorreta: 2,
  ),

  // ── SQL ──────────────────────────────────────────────────────────────────
  Pergunta(
    enunciado: 'Qual comando SQL é usado para buscar dados em uma tabela?',
    categoria: 'SQL',
    opcoes: ['FETCH', 'GET', 'SELECT', 'FIND'],
    respostaCorreta: 2,
  ),
  Pergunta(
    enunciado: 'O que faz o comando "JOIN" no SQL?',
    categoria: 'SQL',
    opcoes: [
      'Divide uma tabela em duas',
      'Combina linhas de duas ou mais tabelas com base em uma coluna relacionada',
      'Apaga registros duplicados',
      'Ordena os resultados',
    ],
    respostaCorreta: 1,
  ),
  Pergunta(
    enunciado: 'Qual função SQL retorna o número de registros em um resultado?',
    categoria: 'SQL',
    opcoes: ['SUM()', 'TOTAL()', 'COUNT()', 'NUM()'],
    respostaCorreta: 2,
  ),
];

// Cor de destaque por categoria
Color _corCategoria(String categoria) {
  switch (categoria) {
    case 'Flutter':
      return const Color(0xFF54C5F8);
    case 'HTML':
      return const Color(0xFFFF6B35);
    case 'CSS':
      return const Color(0xFF7B61FF);
    case 'JavaScript':
      return const Color(0xFFFFD700);
    case 'SQL':
      return const Color(0xFF00C897);
    default:
      return Pallet.primary;
  }
}

class Questao1 extends StatefulWidget {
  final int acertos;

  const Questao1({super.key, required this.acertos});

  @override
  State<Questao1> createState() => _Questao1State();
}

class _Questao1State extends State<Questao1>
    with SingleTickerProviderStateMixin {
  int _indicePergunta = 0;
  int _acertos = 0;
  int? _opcaoSelecionada;
  bool _respondida = false;
  late AnimationController _animController;
  late Animation<double> _fadeAnim;

  @override
  void initState() {
    super.initState();
    _acertos = widget.acertos;
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _fadeAnim = CurvedAnimation(parent: _animController, curve: Curves.easeIn);
    _animController.forward();
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  void _responder(int indice) {
    if (_respondida) return;
    setState(() {
      _opcaoSelecionada = indice;
      _respondida = true;
      if (indice == perguntas[_indicePergunta].respostaCorreta) _acertos++;
    });
  }

  void _proximaPergunta() {
    if (_indicePergunta + 1 >= perguntas.length) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => Resultado(acertos: _acertos, total: perguntas.length),
        ),
      );
    } else {
      _animController.reset();
      setState(() {
        _indicePergunta++;
        _opcaoSelecionada = null;
        _respondida = false;
      });
      _animController.forward();
    }
  }

  Color _corOpcao(int indice) {
    if (!_respondida) return Pallet.surface;
    if (indice == perguntas[_indicePergunta].respostaCorreta) {
      return Pallet.success;
    }
    if (indice == _opcaoSelecionada) return Pallet.error;
    return Pallet.surface;
  }

  @override
  Widget build(BuildContext context) {
    final pergunta = perguntas[_indicePergunta];
    final corCat = _corCategoria(pergunta.categoria);
    final isUltima = _indicePergunta + 1 >= perguntas.length;

    return Scaffold(
      backgroundColor: Pallet.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          '${_indicePergunta + 1} / ${perguntas.length}',
          style: const TextStyle(color: Pallet.textSecondary, fontSize: 14),
        ),
        leading: IconButton(
          icon: const Icon(Icons.close, color: Pallet.textSecondary),
          onPressed: () => Navigator.of(context).popUntil((r) => r.isFirst),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Row(
              children: [
                const Icon(Icons.star_rounded, color: Pallet.warning, size: 18),
                const SizedBox(width: 4),
                Text(
                  '$_acertos',
                  style: const TextStyle(
                    color: Pallet.textPrimary,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: FadeTransition(
        opacity: _fadeAnim,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Barra de progresso colorida por categoria
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: LinearProgressIndicator(
                  value: (_indicePergunta + 1) / perguntas.length,
                  backgroundColor: Pallet.surface,
                  valueColor: AlwaysStoppedAnimation<Color>(corCat),
                  minHeight: 6,
                ),
              ),
              const SizedBox(height: 16),

              // Badge de categoria
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: corCat.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: corCat.withOpacity(0.4)),
                  ),
                  child: Text(
                    pergunta.categoria,
                    style: TextStyle(
                      color: corCat,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.8,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Enunciado
              Container(
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  color: Pallet.surface,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: corCat.withOpacity(0.3)),
                ),
                child: Text(
                  pergunta.enunciado,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Pallet.textPrimary,
                    height: 1.5,
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Opções
              ...List.generate(pergunta.opcoes.length, (i) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: GestureDetector(
                    onTap: () => _responder(i),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 14,
                      ),
                      decoration: BoxDecoration(
                        color: _corOpcao(i),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: !_respondida
                              ? corCat.withOpacity(0.25)
                              : Colors.transparent,
                        ),
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 14,
                            backgroundColor: corCat.withOpacity(0.15),
                            child: Text(
                              String.fromCharCode(65 + i),
                              style: TextStyle(
                                color: corCat,
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              ),
                            ),
                          ),
                          const SizedBox(width: 14),
                          Expanded(
                            child: Text(
                              pergunta.opcoes[i],
                              style: const TextStyle(
                                color: Pallet.textPrimary,
                                fontSize: 15,
                              ),
                            ),
                          ),
                          if (_respondida && i == pergunta.respostaCorreta)
                            const Icon(
                              Icons.check_circle_rounded,
                              color: Colors.white,
                              size: 20,
                            ),
                          if (_respondida &&
                              i == _opcaoSelecionada &&
                              i != pergunta.respostaCorreta)
                            const Icon(
                              Icons.cancel_rounded,
                              color: Colors.white,
                              size: 20,
                            ),
                        ],
                      ),
                    ),
                  ),
                );
              }),

              const Spacer(),

              if (_respondida)
                ElevatedButton(
                  onPressed: _proximaPergunta,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: corCat,
                    foregroundColor: Pallet.background,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    isUltima ? 'Ver Resultado' : 'Próxima Pergunta',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
