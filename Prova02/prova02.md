Equipe

    André Vinicius Agio

    Octavio Augusto Konzen

Tutorial Técnico - Componentes de Layout

Este documento descreve os principais componentes de layout utilizados no protótipo desenvolvido para o jogo The Jogo.
1. Scaffold

Descrição:
Estrutura base da interface, fornece um layout visual padrão com barra superior, corpo e outros elementos opcionais.

Aplicações:
Presente nas telas de menu e jogo como contêiner principal da interface.

Como usar:

Scaffold(
  appBar: AppBar(title: Text('The Jogo')),
  body: Center(child: Text('Conteúdo')),
)

2. AppBar

Descrição:
Barra superior com título e identidade visual.

Aplicações:
Utilizado em todas as telas para exibir o título "The Jogo".

Como usar:

AppBar(
  title: Text('The Jogo'),
)

3. Column

Descrição:
Organiza widgets na vertical.

Aplicações:
Usado para empilhar textos, botões e campos no menu inicial e no conteúdo da caixa de diálogo.

Como usar:

Column(
  children: [
    Text('Bem-vindo ao The Jogo!'),
    ElevatedButton(onPressed: () {}, child: Text('Novo Jogo')),
  ],
)

4. Center

Descrição:
Centraliza seu filho na tela.

Aplicações:
Utilizado para centralizar o conteúdo da tela principal e da tela de jogo.

Como usar:

Center(
  child: Text('Conteúdo centralizado'),
)

5. Text

Descrição:
Exibe uma string com estilo personalizável.

Aplicações:
Presente em todas as telas para exibir mensagens, títulos, dicas e regras.

Como usar:

Text(
  'Encontre o Tesouro!',
  style: TextStyle(fontSize: 20),
)

6. ElevatedButton

Descrição:
Botão elevado com destaque para ações principais.

Aplicações:
Usado para iniciar um novo jogo e acessar as regras.

Como usar:

ElevatedButton(
  onPressed: () {},
  child: Text('Novo Jogo'),
)

7. DropdownButtonFormField

Descrição:
Campo de seleção suspensa com formulário.

Aplicações:
Usado para selecionar o número de rodadas no menu inicial.

Como usar:

DropdownButtonFormField<int>(
  decoration: InputDecoration(labelText: 'Número de Rodadas'),
  items: [3, 5, 7, 10].map((e) => DropdownMenuItem(value: e, child: Text('$e'))).toList(),
  onChanged: (value) {},
)

8. Padding

Descrição:
Adiciona espaçamento interno aos widgets.

Aplicações:
Utilizado em quase todas as telas para dar espaçamento entre os componentes.

Como usar:

Padding(
  padding: EdgeInsets.all(16),
  child: Text('Texto com espaçamento'),
)

9. SizedBox

Descrição:
Adiciona um espaço fixo entre widgets.

Aplicações:
Usado entre elementos como botões, textos e campos para melhorar o espaçamento vertical.

Como usar:

SizedBox(height: 20)

10. AlertDialog

Descrição:
Exibe uma caixa de diálogo com título, conteúdo e ações.

Aplicações:
Usado para mostrar as regras do jogo.

Como usar:

AlertDialog(
  title: Text('Regras'),
  content: Text('Descrição das regras'),
  actions: [
    TextButton(onPressed: () {}, child: Text('Fechar')),
  ],
)

11. SingleChildScrollView

Descrição:
Adiciona rolagem ao conteúdo da tela.

Aplicações:
Usado dentro do AlertDialog para permitir a rolagem do texto das regras.

Como usar:

SingleChildScrollView(
  child: Column(children: [...]),
)

12. Icon

Descrição:
Exibe um ícone vetorial.

Aplicações:
Usado para mostrar ícones no texto, como 💣, 👾 e 🏆 (via emoji diretamente em Text).
13. GridView.count (implícito no jogo)

Descrição:
Organiza widgets em uma grade fixa.

Aplicações:
No seu código não foi usado diretamente, mas poderia ser uma alternativa mais otimizada ao usar vários botões numerados.
Atualmente você usa uma lista de botões personalizada com base em Column e Row com lógica interna.
🎯 Conclusão

Esses componentes foram utilizados para criar uma interface de jogo simples, moderna e amigável ao usuário, alinhada ao Material Design 3.
O protótipo foi testado e está pronto para execução em qualquer ambiente Flutter.
