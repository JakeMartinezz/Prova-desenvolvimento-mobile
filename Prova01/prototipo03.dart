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
        primarySwatch: Colors.deepPurple,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          secondary: Colors.amber,
        ),
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            fontSize: 32.0,
            fontWeight: FontWeight.bold,
            color: Colors.deepPurple,
          ),
          headlineMedium: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: Colors.deepPurple,
          ),
          bodyLarge: TextStyle(fontSize: 16.0, color: Colors.black87),
          bodyMedium: TextStyle(fontSize: 14.0, color: Colors.black54),
        ),
        useMaterial3: true,
      ),
      home: BMICalculatorPage(),
    );
  }
}

class BMICalculatorPage extends StatefulWidget {
  @override
  _BMICalculatorPageState createState() => _BMICalculatorPageState();
}

class _BMICalculatorPageState extends State<BMICalculatorPage> {
  final TextEditingController _pesoController = TextEditingController();
  final TextEditingController _alturaController = TextEditingController();
  double _imcResultado = 0.0;
  String _classificacao = '';

  void _calcularIMC() {
    double? peso = double.tryParse(_pesoController.text);
    String alturaString = _alturaController.text;
    double? altura;

    if (peso != null && alturaString.isNotEmpty) {
      if (alturaString.contains('.')) {
        altura = double.tryParse(alturaString);
      } else {
        int? alturaCm = int.tryParse(alturaString);
        if (alturaCm != null && alturaCm > 0) {
          altura = alturaCm / 100.0; // Converter centímetros para metros
        }
      }

      if (altura != null && altura > 0) {
        setState(() {
          _imcResultado = peso / (altura! * altura!);
          if (_imcResultado < 18.5) {
            _classificacao = 'Abaixo do peso';
          } else if (_imcResultado >= 18.5 && _imcResultado < 25) {
            _classificacao = 'Peso normal';
          } else if (_imcResultado >= 25 && _imcResultado < 30) {
            _classificacao = 'Sobrepeso';
          } else if (_imcResultado >= 30 && _imcResultado < 35) {
            _classificacao = 'Obesidade grau I';
          } else if (_imcResultado >= 35 && _imcResultado < 40) {
            _classificacao = 'Obesidade grau II';
          } else if (_imcResultado >= 40) {
            _classificacao = 'Obesidade grau III';
          } else {
            _classificacao = 'Erro ao classificar';
          }
        });
      } else {
        setState(() {
          _imcResultado = 0.0;
          _classificacao = 'Por favor, insira uma altura válida (ex: 1.70 ou 170).';
        });
      }
    } else {
      setState(() {
        _imcResultado = 0.0;
        _classificacao = 'Por favor, insira peso e altura.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora de IMC'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Calcule seu Índice de Massa Corporal',
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24.0),
            TextField(
              controller: _pesoController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Peso (kg)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _alturaController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(
                labelText: 'Altura (m ou cm)',
                border: OutlineInputBorder(),
                hintText: 'Ex: 1.70 ou 170',
              ),
            ),
            const SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: _calcularIMC,
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.secondary,
                foregroundColor: Theme.of(context).colorScheme.onSecondary,
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                textStyle: const TextStyle(fontSize: 18.0),
              ),
              child: const Text('Calcular'),
            ),
            const SizedBox(height: 24.0),
            Text(
              'Resultado:',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 8.0),
            Text(
              _imcResultado == 0.0
                  ? 'Nenhum cálculo realizado'
                  : 'Seu IMC é: ${_imcResultado.toStringAsFixed(2)}',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 8.0),
            Text(
              _classificacao.isNotEmpty ? 'Classificação: $_classificacao' : '',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: _classificacao.contains('normal')
                        ? Colors.green
                        : (_classificacao.contains('abaixo') ||
                                _classificacao.contains('sobrepeso') ||
                                _classificacao.contains('obesidade')
                            ? Colors.orange
                            : Colors.red),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
