## 👨‍💻 Equipe

- André Vinicius Agio
- Octavio Augusto Konzen

---

## 🛠️ Tutorial Técnico - Componentes de Layout

Este documento detalha os principais componentes de layout utilizados no nosso **PetApp** 🐾, com foco na tela de **Perfil do Pet**.

### 1. Scaffold 🏗️

**Descrição:** O Scaffold é a base da sua interface. Ele fornece uma estrutura visual padrão para o aplicativo, incluindo a barra superior (AppBar), o corpo principal e outros elementos opcionais, como a gaveta lateral (Drawer) e a barra inferior (BottomNavigationBar).

**Aplicações:** É o contêiner principal para a maioria das telas do nosso aplicativo, garantindo uma estrutura consistente.

**Como usar:**

```dart
Scaffold(
  appBar: AppBar(title: const Text('Perfil do Pet')),
  body: SingleChildScrollView(
    child: Column(children: const [...]),
  ),
)
```

### 2. AppBar 🔝

**Descrição:** A AppBar é a barra exibida no topo da tela. Ela geralmente contém o título da página, ações rápidas (como ícones de botão) e pode controlar a navegação.

**Aplicações:** Usada para dar um toque de identidade visual ao PetApp e oferecer acesso rápido a funcionalidades como o perfil do usuário e a alternância de tema.

**Como usar:**

```dart
AppBar(
  title: const Text('PetApp'),
  actions: [
    IconButton(
      icon: const Icon(Icons.account_circle),
      onPressed: () {},
    ),
  ],
)
```

### 3. Column ↕️

**Descrição:** O widget Column organiza seus filhos verticalmente, um abaixo do outro.

**Aplicações:** Essencial para empilhar diversos elementos na tela de perfil do pet, como textos, campos de formulário, cards e botões.

**Como usar:**

```dart
Column(
  crossAxisAlignment: CrossAxisAlignment.start, // Alinha os filhos ao início da coluna
  children: const [...],
)
```

### 4. Row ↔️

**Descrição:** O widget Row organiza seus filhos horizontalmente, um ao lado do outro.

**Aplicações:** Utilizada na exibição do status de adoção do pet, permitindo que o ícone e o texto "Disponível" ou "Indisponível" fiquem lado a lado.

**Como usar:**

```dart
Row(
  children: const [
    Icon(Icons.check_circle),
    Text('Disponível'),
  ],
)
```

### 5. Text 📝

**Descrição:** O widget Text exibe uma string de texto na tela, com a possibilidade de aplicar diversos estilos.

**Aplicações:** Presente em todo o aplicativo para exibir títulos, descrições, labels de campos e mensagens de status.

**Como usar:**

```dart
Text(
  'Cadastro de Perfil do Pet',
  style: Theme.of(context).textTheme.headlineLarge,
)
```

### 6. TextFormField ✏️

**Descrição:** Um campo de entrada de texto que permite ao usuário digitar informações, com suporte para validação de dados.

**Aplicações:** Fundamental para coletar dados do pet, como nome, raça, idade e observações.

**Como usar:**

```dart
TextFormField(
  controller: nomeController,
  decoration: const InputDecoration(
    labelText: 'Nome do Pet',
  ),
  validator: (value) {
    if (value == null || value.isEmpty) {
      return 'Informe o nome do pet';
    }
    return null;
  },
)
```

### 7. SingleChildScrollView 📜

**Descrição:** Um widget que torna seu conteúdo rolável quando ele excede o espaço disponível na tela.

**Aplicações:** Usado na tela de perfil do pet para garantir que todos os campos sejam acessíveis, mesmo em dispositivos com telas menores ou quando o teclado virtual está ativo.

**Como usar:**

```dart
SingleChildScrollView(
  child: Column(children: const [...]),
)
```

### 8. Card 🃏

**Descrição:** Um painel de material design com elevação e cantos arredondados, usado para apresentar informações de forma agrupada.

**Aplicações:** Utilizado para organizar visualmente seções relacionadas no perfil do pet, como "Gênero do Pet", "Preferências de Convivência" e "Status de Adoção", tornando a interface mais limpa e intuitiva.

**Como usar:**

```dart
Card(
  child: Padding(
    padding: const EdgeInsets.all(12.0),
    child: Column(children: const [...]),
  ),
)
```

### 9. Icon / IconButton 🖼️👆

**Descrição:**
- **Icon:** Exibe um ícone visual.
- **IconButton:** Um ícone que reage a toques, útil para ações rápidas.

**Aplicações:** Os ícones são usados em vários lugares, como na AppBar (ícone de perfil), para indicar o gênero do pet (masculino/feminino) e no status de adoção (ícones de checagem/cancelamento).

**Como usar:**

```dart
Icon(Icons.pets) // Exibe um ícone de pet
IconButton(
  icon: const Icon(Icons.account_circle), // Ícone de perfil
  onPressed: () {}, // Ação ao ser pressionado
)
```

### 10. RadioListTile 🔘

**Descrição:** Um tipo de botão de rádio que permite selecionar uma **única opção** de um conjunto de opções.

**Aplicações:** Ideal para a seleção do gênero do pet (Macho ou Fêmea), garantindo que apenas uma opção seja escolhida.

**Como usar:**

```dart
RadioListTile<PetGenero>(
  title: const Text('Macho'),
  value: PetGenero.macho,
  groupValue: _generoSelecionado,
  onChanged: (PetGenero? value) {
    setState(() {
      _generoSelecionado = value;
    });
  },
)
```

### 11. CheckboxListTile ✅

**Descrição:** Um widget que permite ao usuário selecionar **múltiplas opções** independentes usando caixas de seleção.

**Aplicações:** Usado para indicar preferências de convivência do pet, como "Gosta de crianças" e "Convive bem com outros animais".

**Como usar:**

```dart
CheckboxListTile(
  title: const Text('Gosta de crianças'),
  value: _gostaCriancas,
  onChanged: (bool? valor) {
    setState(() {
      _gostaCriancas = valor ?? false;
    });
  },
)
```

### 12. SwitchListTile 🔛

**Descrição:** Um controle deslizante (liga/desliga) para alternar entre dois estados.

**Aplicações:** Perfeito para indicar o status de disponibilidade do pet para adoção.

**Como usar:**

```dart
SwitchListTile(
  title: const Text('Disponível para adoção'),
  value: _disponivelParaAdocao,
  onChanged: (bool valor) {
    setState(() {
      _disponivelParaAdocao = valor;
    });
  },
)
```

### 13. ElevatedButton 🚀

**Descrição:** Um botão com uma sombra que se eleva ao ser pressionado, ideal para ações primárias.

**Aplicações:** Utilizado para a ação principal de "Salvar" os dados do perfil do pet.

**Como usar:**

```dart
ElevatedButton.icon(
  onPressed: () {}, // Função executada ao pressionar o botão
  icon: const Icon(Icons.save), // Ícone do botão
  label: const Text('Salvar'), // Texto do botão
)
```

### 14. OutlinedButton ➡️

**Descrição:** Um botão com um contorno, geralmente usado para ações secundárias ou alternativas.

**Aplicações:** Empregado para a funcionalidade de "Limpar" os campos do formulário do perfil do pet.

**Como usar:**

```dart
OutlinedButton.icon(
  onPressed: () {}, // Função executada ao pressionar o botão
  icon: const Icon(Icons.refresh), // Ícone do botão
  label: const Text('Limpar'), // Texto do botão
)
```

### 15. Padding / EdgeInsets 📏

**Descrição:**
- **Padding:** Um widget que adiciona espaço interno ao redor de seu filho.
- **EdgeInsets:** Uma classe para especificar a quantidade de espaço a ser adicionada em cada lado (top, bottom, left, right).

**Aplicações:** Utilizado extensivamente para criar espaçamento e melhorar a organização visual entre os componentes, garantindo uma interface mais agradável e legível.

**Como usar:**

```dart
Padding(
  padding: const EdgeInsets.all(16), // Adiciona 16 unidades de padding em todos os lados
  child: const Text('Texto'),
)
```

### 16. SizedBox 📦

**Descrição:** Um widget simples que cria uma caixa com um tamanho fixo, útil para adicionar espaços específicos entre outros widgets.

**Aplicações:** Usado para criar espaçamentos verticais e horizontais precisos entre os diversos componentes da interface.

**Como usar:**

```dart
const SizedBox(height: 16) // Adiciona um espaço vertical de 16 unidades
```

### 17. ThemeData & TextTheme 🎨✍️

**Descrição:**
- **ThemeData:** Define o tema visual de todo o aplicativo, incluindo cores, fontes, formas e outros estilos.
- **TextTheme:** Uma parte do ThemeData que gerencia os estilos de texto (tamanhos, pesos, cores para diferentes tipos de texto).

**Aplicações:** Essenciais para aplicar um design consistente em todo o PetApp, com temas claro e escuro, cores primárias distintas e estilos de texto padronizados.

**Como usar:**

```dart
theme: ThemeData(
  useMaterial3: true, // Habilita o Material Design 3
  colorSchemeSeed: Colors.teal, // Define uma cor primária base
)
```

---

🎯 Esses componentes foram cuidadosamente selecionados e implementados para criar uma interface do usuário **moderna, acessível e totalmente compatível com o Material Design 3**. O protótipo foi testado e está pronto para execução no ambiente Flutter, prometendo uma experiência de usuário fluida e agradável! 🚀
