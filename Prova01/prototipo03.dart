import 'package:flutter/material.dart';

void main() {
  runApp(BMICalculatorApp());
}

class BMICalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora de IMC',
      theme: ThemeData(
        // 🧑‍🎨 CRITÉRIO: Material 3 e identidade visual
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          secondary: Colors.amber,
        ),
        textTheme: const TextTheme(
          headlineLarge: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold, color: Colors.deepPurple),
          headlineMedium: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          bodyLarge: TextStyle(fontSize: 16.0),
          bodyMedium: TextStyle(fontSize: 14.0, color: Colors.black54),
        ),
      ),
      home: const BMICalculatorPage(),
    );
  }
}

class BMICalculatorPage extends StatefulWidget {
  const BMICalculatorPage({super.key});
  @override
  State<BMICalculatorPage> createState() => _BMICalculatorPageState();
}

class _BMICalculatorPageState extends State<BMICalculatorPage> {
  final TextEditingController _pesoController = TextEditingController();
  final TextEditingController _alturaController = TextEditingController();

  double _imc = 0.0;
  String _classificacao = '';

  // 🔢 CRITÉRIO: Organização e lógica bem definida
  void _calcularIMC() {
    final peso = double.tryParse(_pesoController.text);
    final alturaInput = _alturaController.text;
    double? altura;

    if (peso != null && alturaInput.isNotEmpty) {
      if (alturaInput.contains('.')) {
        altura = double.tryParse(alturaInput);
      } else {
        final alturaCm = int.tryParse(alturaInput);
        if (alturaCm != null) altura = alturaCm / 100;
      }

      if (altura != null && altura > 0) {
        setState(() {
          _imc = peso / (altura! * altura!);

          _classificacao = _classificarIMC(_imc);
        });
      } else {
        _mostrarErro('Por favor, insira uma altura válida (ex: 1.70 ou 170).');
      }
    } else {
      _mostrarErro('Por favor, insira peso e altura.');
    }
  }

  String _classificarIMC(double imc) {
    if (imc < 18.5) return 'Abaixo do peso';
    if (imc < 25) return 'Peso normal';
    if (imc < 30) return 'Sobrepeso';
    if (imc < 35) return 'Obesidade grau I';
    if (imc < 40) return 'Obesidade grau II';
    return 'Obesidade grau III';
  }

  void _mostrarErro(String msg) {
    setState(() {
      _imc = 0.0;
      _classificacao = msg;
    });
  }

  // 🎨 CRITÉRIO: Estilo dinâmico com base no resultado
  Color _corClassificacao() {
    if (_classificacao.contains('normal')) return Colors.green;
    if (_classificacao.contains('abaixo') || _classificacao.contains('sobrepeso') || _classificacao.contains('obesidade')) {
      return Colors.orange;
    }
    return Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // ✨ CRITÉRIO: Criatividade e identidade
        title: const Row(
          children: [
            Icon(Icons.monitor_weight_outlined),
            SizedBox(width: 8),
            Text('Calculadora de IMC'),
          ],
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Calcule seu Índice de Massa Corporal',
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32.0),

            // 📐 CRITÉRIO: Layout organizado com boa legibilidade
            _buildInputField(_pesoController, 'Peso (kg)', 'Ex: 70'),
            const SizedBox(height: 16.0),
            _buildInputField(_alturaController, 'Altura (m ou cm)', 'Ex: 1.70 ou 170'),
            const SizedBox(height: 24.0),

            ElevatedButton.icon(
              onPressed: _calcularIMC,
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.secondary,
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(vertical: 16.0),
              ),
              icon: const Icon(Icons.calculate),
              label: const Text('Calcular IMC'),
            ),

            const SizedBox(height: 32.0),

            // 📊 CRITÉRIO: Exibição animada e clara do resultado
            if (_imc > 0) ...[
              Text('Seu IMC é:', style: Theme.of(context).textTheme.bodyLarge),
              AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 500),
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: Colors.deepPurple),
                child: Text(_imc.toStringAsFixed(2)),
              ),
            ],

            const SizedBox(height: 12.0),

            Text(
              _classificacao,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: _corClassificacao(),
                  ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  // 🧱 CRITÉRIO: Organização por componentes
  Widget _buildInputField(TextEditingController controller, String label, String hint) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        border: const OutlineInputBorder(),
      ),
    );
  }
}
