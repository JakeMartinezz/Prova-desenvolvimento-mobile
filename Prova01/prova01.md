# Equipe

- André Vinicius Agio
- Octavio Augusto Konzen  

---

# Tutorial Técnico - Componentes de Layout

Este documento descreve os principais componentes de layout utilizados nos três protótipos desenvolvidos:

- Perfil de Artista  
- Restaurante Japonês  
- Calculadora de IMC  

---

## 1. Scaffold

**Descrição**:  
Estrutura base da interface, fornece um layout visual padrão com barra superior, corpo e outros elementos opcionais.

**Aplicações**:  
Presente em todos os protótipos como contêiner principal da interface.

**Como usar**:
```dart
Scaffold(
  appBar: AppBar(title: Text('Título')),
  body: Center(child: Text('Conteúdo')),
)
```

---

## 2. AppBar

**Descrição**:  
Barra superior com título, ícones de ação e controle de navegação.

**Aplicações**:  
Utilizado para dar identidade visual ao app e facilitar a navegação.

**Como usar**:
```dart
AppBar(
  title: Text('Título do App'),
)
```

---

## 3. Column

**Descrição**:  
Organiza widgets na vertical.

**Aplicações**:  
Utilizado em todos os protótipos para empilhar elementos como imagens, textos e botões.

**Como usar**:
```dart
Column(
  children: [
    Text('Exemplo'),
    Icon(Icons.star),
  ],
)
```

---

## 4. Row

**Descrição**:  
Organiza widgets horizontalmente.

**Aplicações**:  
Utilizado no Cardápio Japonês para alinhar o nome do prato e o valor, e no Perfil de Artista para exibir ícones sociais lado a lado.

**Como usar**:
```dart
Row(
  children: [
    Icon(Icons.star),
    Text('5.0'),
  ],
)
```

---

## 5. Text

**Descrição**:  
Exibe uma string com estilo personalizável.

**Aplicações**:  
Presente em todos os protótipos para exibir títulos, descrições e resultados.

**Como usar**:
```dart
Text(
  'Texto de exemplo',
  style: TextStyle(fontSize: 18),
)
```

---

## 6. Image.asset / Image.network

**Descrição**:  
Exibe imagens locais ou da internet.

**Aplicações**:  
Usado no Perfil de Artista (foto do artista) e no Cardápio Japonês (imagem dos pratos).

**Como usar**:
```dart
Image.asset('assets/imagem.png')
Image.network('https://link-da-imagem.com')
```

---

## 7. ElevatedButton

**Descrição**:  
Botão elevado com destaque para ações principais.

**Aplicações**:  
Usado para ações como calcular IMC ou interagir com a interface.

**Como usar**:
```dart
ElevatedButton(
  onPressed: () {},
  child: Text('Clique aqui'),
)
```

---

## 8. TextField

**Descrição**:  
Campo de entrada para o usuário digitar informações.

**Aplicações**:  
Usado na Calculadora de IMC para capturar peso e altura.

**Como usar**:
```dart
TextField(
  controller: controller,
  decoration: InputDecoration(labelText: 'Digite algo'),
)
```

---

## 9. SingleChildScrollView

**Descrição**:  
Adiciona rolagem ao conteúdo da tela.

**Aplicações**:  
Usado para permitir rolagem em dispositivos com tela pequena.

**Como usar**:
```dart
SingleChildScrollView(
  child: Column(children: [...]),
)
```

---

## 10. Card

**Descrição**:  
Contêiner com elevação e bordas arredondadas.

**Aplicações**:  
Utilizado no Cardápio Japonês para exibir blocos de pratos.

**Como usar**:
```dart
Card(
  child: Padding(
    padding: EdgeInsets.all(12.0),
    child: Text('Conteúdo'),
  ),
)
```

---

## 11. Icon

**Descrição**:  
Exibe um ícone vetorial da biblioteca de Material Icons.

**Aplicações**:  
Utilizado no Perfil de Artista para redes sociais e avaliações com estrelas.

**Como usar**:
```dart
Icon(Icons.star, color: Colors.amber)
```

---

## 12. Padding / EdgeInsets

**Descrição**:  
Adiciona espaçamento interno aos widgets.

**Aplicações**:  
Utilizado amplamente para dar espaçamento e organização visual aos componentes.

**Como usar**:
```dart
Padding(
  padding: EdgeInsets.all(16),
  child: Text('Texto'),
)
```

---

## 13. SizedBox

**Descrição**:  
Adiciona um espaço fixo entre widgets.

**Aplicações**:  
Usado para separação vertical e horizontal.

**Como usar**:
```dart
SizedBox(height: 20)
```

---

## 14. ThemeData & TextTheme

**Descrição**:  
Permite aplicar temas personalizados em toda a aplicação.

**Aplicações**:  
Utilizado para definir cores e fontes consistentes entre os protótipos.

**Como usar**:
```dart
theme: ThemeData(
  textTheme: TextTheme(
    headlineMedium: TextStyle(fontSize: 24),
  ),
)
```

---

🎯 Esses componentes foram usados para criar interfaces modernas, acessíveis e compatíveis com o Material Design 3.  
Todos os protótipos foram testados e estão prontos para execução via [DartPad](https://dartpad.dev/).

