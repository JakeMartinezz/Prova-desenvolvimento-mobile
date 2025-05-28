import 'package:flutter/material.dart';

// Enum para representar os gêneros possíveis do pet
enum PetGenero { macho, femea }

void main() {
  runApp(const PetApp());
}

class PetApp extends StatelessWidget {
  const PetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PetApp',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.teal, // Define a cor primária do tema
        appBarTheme: const AppBarTheme(
          centerTitle: true, // Centraliza o título da AppBar
          backgroundColor: Colors.teal, // Cor de fundo da AppBar
          foregroundColor: Colors.white, // Cor do texto e ícones da AppBar
          elevation: 4, // Sombra da AppBar
        ),
      ),
      home: const PerfilPetScreen(), // Define a tela inicial do aplicativo
    );
  }
}

class PerfilPetScreen extends StatefulWidget {
  const PerfilPetScreen({super.key});

  @override
  State<PerfilPetScreen> createState() => _PerfilPetScreenState();
}

class _PerfilPetScreenState extends State<PerfilPetScreen> {
  // Chave global para o formulário, usada para validação
  final _formKey = GlobalKey<FormState>();

  // Controladores para os campos de texto
  late final TextEditingController nomeController;
  late final TextEditingController racaController;
  late final TextEditingController idadeController;
  late final TextEditingController observacoesController;

  // Variáveis de estado para os seletores de gênero, preferências e status de adoção
  PetGenero? _generoSelecionado;
  bool _gostaCriancas = false;
  bool _conviveOutrosAnimais = false;
  bool _disponivelParaAdocao = false;

  @override
  void initState() {
    super.initState();
    nomeController = TextEditingController();
    racaController = TextEditingController();
    idadeController = TextEditingController();
    observacoesController = TextEditingController();
  }

  @override
  void dispose() {
    // Descartar os controladores quando o widget for removido da árvore
    nomeController.dispose();
    racaController.dispose();
    idadeController.dispose();
    observacoesController.dispose();
    super.dispose();
  }

  // Função para limpar todos os campos do formulário
  void _limparCampos() {
    setState(() {
      nomeController.clear();
      racaController.clear();
      idadeController.clear();
      observacoesController.clear();
      _generoSelecionado = null;
      _gostaCriancas = false;
      _conviveOutrosAnimais = false;
      _disponivelParaAdocao = false;
      _formKey.currentState?.reset(); // Reseta o estado de validação do formulário
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil do Pet'),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle),
            tooltip: 'Perfil do Usuário',
            onPressed: () {
              // Exibe uma SnackBar ao clicar no ícone do usuário
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Ações do perfil do usuário serão inseridas aqui!')),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        // Adiciona padding em todas as direções, ajustando para o teclado
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          top: 16,
          bottom: MediaQuery.of(context).viewInsets.bottom + 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Título principal da tela
            Text(
              'Cadastro de Perfil do Pet',
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    color: Theme.of(context).colorScheme.primary, // Cor do título
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 8),
            // Texto de introdução centralizado
            Align(
              alignment: Alignment.center,
              child: Text(
                'Preencha os dados do seu pet!',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[700],
                  fontStyle: FontStyle.italic, // Estilo itálico
                ),
              ),
            ),
            const SizedBox(height: 24), // Espaçamento maior antes do formulário

            // Formulário para entrada de dados
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Campo de texto para o Nome do Pet
                  TextFormField(
                    controller: nomeController,
                    decoration: InputDecoration(
                      labelText: 'Nome do Pet',
                      prefixIcon: const Icon(Icons.pets),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)), // Bordas arredondadas
                      ),
                      filled: true, // Preenchimento do campo
                      fillColor: Colors.teal.shade50, // Cor de preenchimento
                    ),
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Informe o nome do pet';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16), // Espaçamento entre campos

                  // Campo de texto para a Raça do Pet
                  TextFormField(
                    controller: racaController,
                    decoration: InputDecoration(
                      labelText: 'Raça',
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      filled: true,
                      fillColor: Colors.teal.shade50,
                    ),
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Informe a raça do pet';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),

                  // Campo de texto para a Idade do Pet
                  TextFormField(
                    controller: idadeController,
                    decoration: InputDecoration(
                      labelText: 'Idade (em anos)',
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      filled: true,
                      fillColor: Colors.teal.shade50,
                    ),
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Informe a idade do pet';
                      }
                      final int? idade = int.tryParse(value);
                      if (idade == null || idade < 0) {
                        return 'A idade deve ser um número positivo';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),

                  // Campo de texto para Observações (opcional)
                  TextFormField(
                    controller: observacoesController,
                    decoration: InputDecoration(
                      labelText: 'Observações (opcional)',
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      alignLabelWithHint: true, // Alinha o label no topo para multiline
                      filled: true,
                      fillColor: Colors.teal.shade50,
                    ),
                    maxLines: 3,
                    textInputAction: TextInputAction.done,
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),

            // Seção de Gênero do Pet
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              margin: const EdgeInsets.only(bottom: 16),
              child: Padding(
                padding: const EdgeInsets.all(12.0), // Aumenta o padding interno do Card
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Gênero do Pet',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                    ),
                    RadioListTile<PetGenero>(
                      title: const Text('Macho'),
                      value: PetGenero.macho,
                      groupValue: _generoSelecionado,
                      onChanged: (PetGenero? value) {
                        setState(() {
                          _generoSelecionado = value;
                        });
                      },
                      activeColor: Theme.of(context).colorScheme.primary, // Cor do rádio selecionado
                    ),
                    RadioListTile<PetGenero>(
                      title: const Text('Fêmea'),
                      value: PetGenero.femea,
                      groupValue: _generoSelecionado,
                      onChanged: (PetGenero? value) {
                        setState(() {
                          _generoSelecionado = value;
                        });
                      },
                      activeColor: Theme.of(context).colorScheme.primary,
                    ),
                  ],
                ),
              ),
            ),

            // Seção de Preferências de Convivência
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              margin: const EdgeInsets.only(bottom: 16),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Preferências de Convivência',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                    ),
                    CheckboxListTile(
                      title: const Text('Gosta de crianças'),
                      value: _gostaCriancas,
                      onChanged: (bool? valor) {
                        setState(() {
                          _gostaCriancas = valor ?? false;
                        });
                      },
                      activeColor: Theme.of(context).colorScheme.primary, // Cor do checkbox selecionado
                    ),
                    CheckboxListTile(
                      title: const Text('Convive bem com outros animais'),
                      value: _conviveOutrosAnimais,
                      onChanged: (bool? valor) {
                        setState(() {
                          _conviveOutrosAnimais = valor ?? false;
                        });
                      },
                      activeColor: Theme.of(context).colorScheme.primary,
                    ),
                  ],
                ),
              ),
            ),

            // Seção de Status de Adoção
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              margin: const EdgeInsets.only(bottom: 24), // Espaçamento maior antes dos botões
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SwitchListTile(
                      title: const Text('Disponível para adoção'),
                      value: _disponivelParaAdocao,
                      onChanged: (bool valor) {
                        setState(() {
                          _disponivelParaAdocao = valor;
                        });
                      },
                      activeColor: Theme.of(context).colorScheme.primary, // Cor do switch ativado
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0, top: 8.0),
                      child: Row( // Usando Row para alinhar ícone e texto
                        children: [
                          Icon(
                            _disponivelParaAdocao ? Icons.check_circle : Icons.cancel,
                            color: _disponivelParaAdocao ? Colors.green : Colors.red,
                            size: 20,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Status: ${_disponivelParaAdocao ? 'Disponível' : 'Indisponível'}',
                            style: TextStyle(
                              fontSize: 14,
                              color: _disponivelParaAdocao ? Colors.green.shade700 : Colors.red.shade700,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Botões de Ação
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // Valida o formulário ao pressionar o botão Salvar
                      if (_formKey.currentState!.validate()) {
                        final nomePet = nomeController.text;
                        final racaPet = racaController.text;
                        final idadePet = int.tryParse(idadeController.text);
                        final observacoesPet = observacoesController.text;

                        // Exibe uma SnackBar de sucesso
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Dados de $nomePet salvos com sucesso!'),
                            backgroundColor: Colors.green,
                          ),
                        );

                        // Opcional: imprimir os dados para verificar
                        print('Nome: $nomePet');
                        print('Raça: $racaPet');
                        print('Idade: $idadePet');
                        print('Observações: $observacoesPet');
                        print('Gênero: ${_generoSelecionado?.name}');
                        print('Gosta de crianças: $_gostaCriancas');
                        print('Convive com outros animais: $_conviveOutrosAnimais');
                        print('Disponível para adoção: $_disponivelParaAdocao');
                      }
                    },
                    icon: const Icon(Icons.save),
                    label: const Text('Salvar'),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      backgroundColor: Theme.of(context).colorScheme.primary, // Cor de fundo do botão
                      foregroundColor: Colors.white, // Cor do texto e ícone do botão
                      elevation: 4, // Sombra do botão
                    ),
                  ),
                ),
                const SizedBox(width: 16), // Espaçamento entre os botões
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: _limparCampos, // Chama a função de limpar campos
                    icon: const Icon(Icons.refresh),
                    label: const Text('Limpar'),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      side: BorderSide(color: Theme.of(context).colorScheme.primary), // Cor da borda
                      foregroundColor: Theme.of(context).colorScheme.primary, // Cor do texto e ícone do botão
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
