import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const TheJogoApp());
}

class TheJogoApp extends StatelessWidget {
  const TheJogoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'The Jogo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFFF0F8FF), // Light blue background
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF4682A9), // Steel blue app bar
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF4682A9), // Steel blue button
            foregroundColor: Colors.white,
            textStyle: const TextStyle(fontSize: 16),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontSize: 16, color: Colors.black87),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none, // Remove border line
          ),
          filled: true,
          fillColor: Colors.white, // White fill color
          labelStyle: const TextStyle(color: Colors.black54),
        ),
        dropdownMenuTheme: DropdownMenuThemeData(
            inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none, // Remove border line
          ),
          filled: true,
          fillColor: Colors.white, // White fill color
          labelStyle: const TextStyle(color: Colors.black54),
        )),
      ),
      home: const GameMenu(),
    );
  }
}

class GameMenu extends StatefulWidget {
  const GameMenu({super.key});

  @override
  State<GameMenu> createState() => _GameMenuState();
}

class _GameMenuState extends State<GameMenu> {
  int? _numRounds;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('The Jogo'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Bem-vindo ao The Jogo!',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4682A9), // Steel blue
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              DropdownButtonFormField<int?>(
                decoration: const InputDecoration(
                  labelText: 'Número de Rodadas',
                ),
                value: _numRounds,
                items: const [3, 5, 7, 10, null]
                    .map<DropdownMenuItem<int?>>((int? value) {
                  return DropdownMenuItem<int?>(
                    value: value,
                    child: Text(value == null ? 'Infinito' : '$value'),
                  );
                }).toList(),
                onChanged: (int? newValue) {
                  setState(() {
                    _numRounds = newValue;
                  });
                },
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          SinglePlayerGameScreen(numRounds: _numRounds),
                    ),
                  );
                },
                child: const Text('Novo Jogo'),
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: () {
                  _showRulesDialog(context);
                },
                child: const Text('Regras do Jogo'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showRulesDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Regras do Jogo'),
          content: const SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Regras para 1 Jogador:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  '1. Ao iniciar um novo jogo, três números distintos entre 1 e 20 são sorteados: Tesouro (🏆), Bomba (💣) e Monstro (👾).',
                ),
                Text(
                  '2. Toque em um dos botões numerados para revelar o que está escondido.',
                ),
                Text(
                  '3. Encontre o Tesouro 🏆 para vencer a rodada. Encontrar a Bomba 💣 ou o Monstro 👾 encerra o jogo.',
                ),
                Text(
                  '4. Dicas (💡) indicam se o Tesouro 🏆 está acima ou abaixo do número escolhido.',
                ),
                Text(
                  '5. Escolha o número de rodadas desejado ou jogue no modo infinito.',
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Fechar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

class SinglePlayerGameScreen extends StatefulWidget {
  final int? numRounds;

  const SinglePlayerGameScreen({super.key, this.numRounds});

  @override
  State<SinglePlayerGameScreen> createState() => _SinglePlayerGameScreenState();
}

class _SinglePlayerGameScreenState extends State<SinglePlayerGameScreen>
    with TickerProviderStateMixin {
  final Color buttonColor = const Color(0xFFE0FFFF); // Light cyan
  late int tesouro, bomba, monstro;
  late List<String> estadosBotoes;
  String mensagem = 'Encontre o tesouro! 🏆';
  bool jogoConcluido = false;
  int rodadaAtual = 1;
  bool podeClique = true;
  final int numColunas = 4;
  final int numLinhas = 5;
  late int numBotoes;
  bool venceu = false;
  bool perdeu = false;

  late AnimationController explosionController;
  late Animation<double> explosionAnimation;
  late AnimationController monstroController;
  late Animation<double> monstroAnimation;
  late AnimationController tesouroController;
  late Animation<double> tesouroAnimation;

  final TextStyle textoPadrao = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.black87,
    inherit: true,
  );

  @override
  void initState() {
    super.initState();
    numBotoes = numColunas * numLinhas;
    _inicializarRodada();
    mensagem =
        'Encontre o tesouro! 🏆 ${widget.numRounds == null ? '' : '(Rodada $rodadaAtual / ${widget.numRounds})'}';

    explosionController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    explosionAnimation = Tween<double>(begin: 1.0, end: 2.5).animate(
      CurvedAnimation(parent: explosionController, curve: Curves.elasticOut),
    );

    monstroController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    monstroAnimation = Tween<double>(begin: 1.0, end: 1.5).animate(
      CurvedAnimation(parent: monstroController, curve: Curves.easeInOut),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          monstroController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          monstroController.forward();
        }
      });
    monstroController.forward();

    tesouroController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    tesouroAnimation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(parent: tesouroController, curve: Curves.easeInOut),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          tesouroController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          tesouroController.forward();
        }
      });
    tesouroController.forward();
  }

  @override
  void dispose() {
    explosionController.dispose();
    monstroController.dispose();
    tesouroController.dispose();
    super.dispose();
  }

  void _inicializarRodada() {
    final random = Random();
    final sorteados = <int>{};
    while (sorteados.length < 3) {
      sorteados.add(random.nextInt(numBotoes) + 1);
    }
    final lista = sorteados.toList();
    tesouro = lista[0];
    bomba = lista[1];
    monstro = lista[2];
    estadosBotoes = List.generate(numBotoes, (index) => '');
    jogoConcluido = false;
    podeClique = true;
    venceu = false;
    perdeu = false;
  }

  void _reiniciarJogo() {
    setState(() {
      rodadaAtual = 1;
      _inicializarRodada();
      mensagem =
          'Encontre o tesouro! 🏆 ${widget.numRounds == null ? '' : '(Rodada $rodadaAtual / ${widget.numRounds})'}';
      jogoConcluido = false;
    });
  }

  void _proximaRodada() {
    if (widget.numRounds == null || rodadaAtual < (widget.numRounds ?? 0)) {
      setState(() {
        rodadaAtual++;
        _inicializarRodada();
        mensagem =
            'Encontre o tesouro! 🏆 ${widget.numRounds == null ? '' : '(Rodada $rodadaAtual / ${widget.numRounds})'}';
      });
    } else {
      setState(() {
        jogoConcluido = true;
        venceu = true;
        mensagem = 'Jogo Concluído!';
        _mostrarDialogoResultado();
      });
    }
  }

  void onBotaoPressionado(int index) async {
    if (jogoConcluido || !podeClique) return;
    final numero = index + 1;

    if (estadosBotoes[index] != '') return;

    podeClique = false;
    setState(() {
      if (numero == tesouro) {
        estadosBotoes[index] = 'tesouro';
        mensagem = 'Parabéns! Você achou o tesouro! 🏆';
        venceu = true;
        jogoConcluido = true;
        tesouroController.forward(from: 0.0);
        Future.delayed(const Duration(seconds: 2), () {
          _proximaRodada();
          podeClique = true;
        });
      } else if (numero == bomba || numero == monstro) {
        estadosBotoes[index] = numero == bomba ? 'bomba' : 'monstro';
        mensagem =
            'Você encontrou ${numero == bomba ? 'a bomba! 💣' : 'o monstro! 👾'} Fim de Jogo!';
        jogoConcluido = true;
        perdeu = true;
        if (numero == bomba) {
          explosionController.forward(from: 0.0);
        } else {
          monstroController.forward(from: 0.0);
        }
        Future.delayed(const Duration(seconds: 2), () {
          _mostrarDialogoResultado();
        });
      } else {
        estadosBotoes[index] = 'dica';
        if (tesouro > numero) {
          mensagem = 'Dica: o tesouro está em um número MAIOR que $numero. 💡';
        } else {
          mensagem = 'Dica: o tesouro está em um número MENOR que $numero. 💡';
        }
        podeClique = true;
      }
    });
  }

  Widget buildButton(int index) {
    final estado = estadosBotoes[index];
    Widget child;
    Color corFundo = buttonColor;
    bool desabilitado = false;

    switch (estado) {
      case 'tesouro':
        child = ScaleTransition(
          scale: tesouroAnimation,
          child: const Text('🏆', style: TextStyle(fontSize: 24)),
        );
        desabilitado = true;
        corFundo = Colors.amber.shade300;
        break;
      case 'bomba':
        child = ScaleTransition(
          scale: explosionAnimation,
          child: const Text('💣', style: TextStyle(fontSize: 24)),
        );
        desabilitado = true;
        corFundo = Colors.red.shade300;
        break;
      case 'monstro':
        child = ScaleTransition(
          scale: monstroAnimation,
          child: const Text('👾', style: TextStyle(fontSize: 24)),
        );
        desabilitado = true;
        corFundo = Colors.purple.shade300;
        break;
      case 'dica':
        child = const Text('💡', style: TextStyle(fontSize: 24));
        desabilitado = true;
        corFundo = Colors.grey.shade400;
        break;
      default:
        child = Text(
          '${index + 1}',
          style: textoPadrao,
        );
    }

    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: ElevatedButton(
        onPressed:
            desabilitado || jogoConcluido ? null : () => onBotaoPressionado(index),
        style: ElevatedButton.styleFrom(
          backgroundColor: corFundo,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          minimumSize: Size.zero,
          padding: const EdgeInsets.all(8.0),
        ),
        child: Center(child: child),
      ),
    );
  }

  void _mostrarDialogoResultado() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Fim de Jogo'),
          content: Text(
            venceu
                ? 'Parabéns! Você venceu o jogo na rodada $rodadaAtual!'
                : 'Fim de Jogo! Você perdeu na rodada $rodadaAtual! Tente novamente!',
            textAlign: TextAlign.center,
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Voltar ao Menu'),
              onPressed: () {
                Navigator.of(context).pop(); // Fecha o AlertDialog
                Navigator.of(context).pop(); // Volta para o GameMenu
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jogo do Tesouro'),
        backgroundColor: const Color(0xFF4682A9), // Steel blue
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _reiniciarJogo,
          ),
        ],
      ),
      body: Container(
        color: const Color(0xFFF0F8FF), // Light blue
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  mensagem,
                  style: textoPadrao,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: numColunas,
                    children: List.generate(numBotoes, (index) => buildButton(index)),
                  ),
                ),
                ElevatedButton(
                  onPressed: _reiniciarJogo,
                  child: const Text('Reiniciar Jogo'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
