import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Import para formatar números

void main() {
  runApp(ArtistProfileApp());
}

class ArtistProfileApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Perfil do Artista',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        // Definindo a paleta de cores Material Design 3
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          secondary: Colors.amber, // Define a cor secundária diretamente
        ),
        // Definindo a tipografia Material Design
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
        useMaterial3: true, // Utilizando as diretrizes do Material Design 3
      ),
      home: ArtistProfilePage(
        artistName: 'Jake Martinez / André Agio',
        genre: 'Pop Rock Alternativo',
        bio:
            'Um artista inovador conhecido por suas letras introspectivas e melodias cativantes. Sua música mistura elementos de pop, rock e influências alternativas, criando um som único que ressoa com o público global. Ao longo de sua carreira, lançou múltiplos álbuns aclamados pela crítica e realizou turnês em diversos países.',
        albums: [
          'Sinfonia dos print (2023)',
          'Ecos do BUGS (2020)',
          'Cores em Preto e comments (2018)',
          'Viagem as APIs (EP - 2015)',
        ],
        featuredSong: 'Canção Destaque: "Aurora Boreal"',
        awards: ['Grammy de centralizador de DIVS(2024)', 'MTV Music Award de update sem WHERE (2023)'],
        socialLinks: {
          'Instagram': 'https://www.instagram.com/artista_famoso_oficial/',
          'Spotify': 'https://open.spotify.com/artist/SEU_ID_SPOTIFY',
          'YouTube': 'https://www.youtube.com/user/ARTISTA_FAMOSO_OFICIAL',
          'Twitter': 'https://twitter.com/artista_famoso',
          'Website': 'https://www.nomedoartista.com',
        },
        fansCount: 1234567,
      ),
    );
  }
}

class ArtistProfilePage extends StatelessWidget {
  final String artistName;
  final String genre;
  final String bio;
  final List<String> albums;
  final String featuredSong;
  final List<String> awards;
  final Map<String, String> socialLinks;
  final int fansCount;

  ArtistProfilePage({
    required this.artistName,
    required this.genre,
    required this.bio,
    required this.albums,
    required this.featuredSong,
    required this.awards,
    required this.socialLinks,
    required this.fansCount,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil de $artistName'),
        // Estilo da AppBar alinhado com o Material Design
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Seção de Cabeçalho
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Widget para uma imagem de perfil (pode ser um CircleAvatar)
                const CircleAvatar(
                  radius: 50.0,
                  backgroundImage: NetworkImage('https://avatars.githubusercontent.com/u/126693727?v=4'), // Placeholder
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        artistName,
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      const SizedBox(height: 4.0),
                      Text(
                        genre,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: Theme.of(context).colorScheme.secondary,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(height: 8.0),
                      // Selo de verificado (elemento visual extra)
                      Row(
                        children: [
                          const Icon(Icons.verified, color: Colors.blue, size: 16.0),
                          const SizedBox(width: 4.0),
                          Text('Verificado', style: Theme.of(context).textTheme.bodyMedium),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24.0),

            // Biografia
            Text(
              'Biografia',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 8.0),
            Text(
              bio,
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.justify, // Alinhamento justificado para melhor leitura
            ),
            const SizedBox(height: 24.0),

            // Álbuns - Utilizando Wrap para melhor layout em diferentes tamanhos de tela
            Text(
              'Álbuns',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 8.0),
            Wrap(
              spacing: 8.0, // Espaçamento entre os álbuns
              runSpacing: 8.0, // Espaçamento entre as linhas de álbuns
              children: albums.map((album) => Chip(
                    label: Text(album),
                  ))
                  .toList(),
            ),
            const SizedBox(height: 16.0),

            // Canção Destaque
            Text(
              featuredSong,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontStyle: FontStyle.italic),
            ),
            const SizedBox(height: 16.0),

            // Prêmios - Outro exemplo de layout com Row e Expanded
            if (awards.isNotEmpty) ...[
              Text(
                'Prêmios',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 8.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: awards
                    .map((award) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: Row(
                            children: [
                              const Icon(Icons.star_border, color: Colors.amber, size: 20.0),
                              const SizedBox(width: 8.0),
                              Expanded(child: Text(award, style: Theme.of(context).textTheme.bodyLarge)),
                            ],
                          ),
                        ))
                    .toList(),
              ),
              const SizedBox(height: 24.0),
            ],

            // Redes Sociais - Utilizando Row e Spacer para alinhamento
            Text(
              'Redes Sociais',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: socialLinks.entries.map((entry) {
                IconData? icon;
                switch (entry.key.toLowerCase()) {
                  case 'instagram':
                    icon = Icons.camera_alt;
                    break;
                  case 'spotify':
                    icon = Icons.music_note;
                    break;
                  case 'youtube':
                    icon = Icons.play_arrow;
                    break;
                  case 'twitter':
                    icon = Icons.flutter_dash; // Ícone genérico para Twitter (pode usar um pacote de ícones mais específico)
                    break;
                  case 'website':
                    icon = Icons.web;
                    break;
                  default:
                    icon = Icons.link;
                }
                return IconButton(
                  icon: Icon(icon, color: Theme.of(context).colorScheme.primary),
                  onPressed: () {
                    // Abertura de links (funcionalidade limitada no DartPad)
                    print('Abrir ${entry.key}: ${entry.value}');
                  },
                  tooltip: 'Abrir ${entry.key}',
                );
              }).toList(),
            ),
            const SizedBox(height: 16.0),

            // Contagem de Fãs - Layout simples com Row
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.people, color: Colors.grey),
                const SizedBox(width: 8.0),
                Text('${NumberFormat.compact().format(fansCount)} Fãs', style: Theme.of(context).textTheme.bodyMedium),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
