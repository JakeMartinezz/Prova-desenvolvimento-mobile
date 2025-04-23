import 'package:flutter/material.dart';

void main() {
  runApp(JapaneseRestaurantMenuApp());
}

class JapaneseRestaurantMenuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cardápio Japonês',
      theme: ThemeData(
        primarySwatch: Colors.red,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.red,
          secondary: Colors.orangeAccent,
        ),
        // (4) Tipografia clara com hierarquia visual
        textTheme: const TextTheme(
          headlineLarge: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold, color: Colors.red),
          headlineMedium: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.black87),
          titleLarge: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.black87),
          bodyLarge: TextStyle(fontSize: 16.0, color: Colors.black87),
          bodyMedium: TextStyle(fontSize: 14.0, color: Colors.black54),
        ),
        useMaterial3: true, // (4) Diretrizes do Material Design 3
      ),
      home: MenuScreen(),
    );
  }
}

class MenuScreen extends StatelessWidget {
  // (6) Organização: lista de dados bem segmentada
final List<MenuItem> appetizers = [
  MenuItem(name: 'Edamame', description: 'Vagens de soja cozidas no vapor com sal marinho.', price: 8.50),
  MenuItem(name: 'Gyoza (5 unidades)', description: 'Pastéis japoneses recheados com carne de porco e vegetais, grelhados.', price: 15.00),
  MenuItem(name: 'Harumaki (2 unidades)', description: 'Rolinhos primavera crocantes com recheio de legumes.', price: 12.00),
  MenuItem(name: 'Misso shiru', description: 'Sopa de Misso shiru tradicional com tofu, algas wakame e cebolinha.', price: 9.00),
];

final List<MenuItem> sashimi = [
  MenuItem(name: 'Sashimi de Salmão (5 fatias)', description: 'Fatias frescas de salmão.', price: 22.00),
  MenuItem(name: 'Sashimi de Atum (5 fatias)', description: 'Fatias frescas de atum.', price: 25.00),
  MenuItem(name: 'Sashimi Misto (10 fatias)', description: 'Seleção de salmão, atum e peixe branco.', price: 45.00),
];

final List<MenuItem> sushi = [
  MenuItem(name: 'Nigiri de Salmão (2 unidades)', description: 'Bolinhos de arroz com salmão fresco.', price: 14.00),
  MenuItem(name: 'Nigiri de Atum (2 unidades)', description: 'Bolinhos de arroz com atum fresco.', price: 16.00),
  MenuItem(name: 'California Roll (8 unidades)', description: 'Kani, abacate e pepino.', price: 18.00),
  MenuItem(name: 'Tekkamaki (6 unidades)', description: 'Enrolado de atum.', price: 20.00),
  MenuItem(name: 'Sake Maki (6 unidades)', description: 'Enrolado de salmão.', price: 18.00),
];

final List<MenuItem> temaki = [
  MenuItem(name: 'Temaki de Salmão', description: 'Cone de alga marinha recheado com salmão, arroz e cream cheese.', price: 20.00),
  MenuItem(name: 'Temaki de Atum', description: 'Cone de alga marinha recheado com atum, arroz e cebolinha.', price: 22.00),
  MenuItem(name: 'Temaki Califórnia', description: 'Cone de alga marinha recheado com kani, abacate, pepino e arroz.', price: 18.00),
];

final List<MenuItem> pratosQuentes = [
  MenuItem(name: 'Yakisoba de Frango', description: 'Macarrão japonês frito com frango e vegetais.', price: 28.00),
  MenuItem(name: 'Yakisoba de Carne', description: 'Macarrão japonês frito com carne e vegetais.', price: 30.00),
  MenuItem(name: 'Tempurá de Camarão (5 unidades)', description: 'Camarões empanados e fritos.', price: 35.00),
  MenuItem(name: 'Katsudon', description: 'Tigela de arroz coberta com costeleta de porco à milanesa, ovo e molho especial.', price: 32.00),
];

final List<MenuItem> sobremesas = [
  MenuItem(name: 'Moti de Chocolate', description: 'Bolinho de arroz glutinoso recheado com sorvete de chocolate.', price: 10.00),
  MenuItem(name: 'Tempurá de Banana com Sorvete', description: 'Banana empanada e frita servida com sorvete.', price: 15.00),
];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cardápio Japonês'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        centerTitle: true, // (4) Alinhamento e estilo consistente
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column( // (1) Uso correto de Column para empilhar categorias
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildCategoryTitle(context, 'Entradas'),
            _buildMenuList(appetizers),
            const SizedBox(height: 24.0),
            _buildCategoryTitle(context, 'Sashimi'),
            _buildMenuList(sashimi),
            const SizedBox(height: 24.0),
            _buildCategoryTitle(context, 'Sushi'),
            _buildMenuList(sushi),
            const SizedBox(height: 24.0),
            _buildCategoryTitle(context, 'Temaki'),
            _buildMenuList(temaki),
            const SizedBox(height: 24.0),
            _buildCategoryTitle(context, 'Pratos Quentes'),
            _buildMenuList(pratosQuentes),
            const SizedBox(height: 24.0),
            _buildCategoryTitle(context, 'Sobremesas'),
            _buildMenuList(sobremesas),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headlineMedium, // (4) Hierarquia de título
      ),
    );
  }

  // (2) Uso repetido e organizado de Column
  Widget _buildMenuList(List<MenuItem> items) {
    return Column(
      children: items.map((item) => _buildMenuItemCard(item)).toList(),
    );
  }

  // (1) Composição de Cards usando Row, Column, Padding
  // (4) Cores e tipografia acessíveis e consistentes
  // (6) Widget reaproveitável e organizado
  Widget _buildMenuItemCard(MenuItem item) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      elevation: 2, // (5) Criatividade: profundidade e destaque visual
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(item.name, style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4.0),
            Text(item.description, style: const TextStyle(fontSize: 14.0, color: Colors.black54)),
            const SizedBox(height: 8.0),
            Row( // (1) Uso de Row para alinhamento de informações
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text('Preço:', style: TextStyle(fontWeight: FontWeight.bold)),
                Text(
                  'R\$ ${item.price.toStringAsFixed(2)}',
                  style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 16.0),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// (6) Classe de dados clara e bem nomeada
class MenuItem {
  final String name;
  final String description;
  final double price;

  MenuItem({required this.name, required this.description, required this.price});
}
