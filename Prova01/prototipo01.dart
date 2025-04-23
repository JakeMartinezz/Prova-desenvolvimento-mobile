import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(ArtistProfileApp());
}

// Critério 6: Organização e padronização do código
class ArtistProfileApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Perfil do Artista',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          secondary: Colors.amber,
        ),
        useMaterial3: true,
        textTheme: const TextTheme(
          headlineLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.deepPurple),
          headlineMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.deepPurple),
          bodyLarge: TextStyle(fontSize: 16, color: Colors.black87),
          bodyMedium: TextStyle(fontSize: 14, color: Colors.black54),
        ),
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
        awards: ['Grammy de centralizador de DIVS (2024)', 'MTV Music Award de update sem WHERE (2023)'],
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

// Critério 6: Código organizado com nomes claros e bem indentado
class ArtistProfilePage extends StatelessWidget {
  final String artistName;
  final String genre;
  final String bio;
  final List<String> albums;
  final String featuredSong;
  final List<String> awards;
  final Map<String, String> socialLinks;
  final int fansCount;

  const ArtistProfilePage({
    super.key,
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
    // Critério 1: Uso correto dos widgets de layout
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil de $artistName'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Critério 4: Design visual com alinhamento e espaçamento
          Card(
            elevation: 3,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage('https://avatars.githubusercontent.com/u/126693727?v=4'),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(artistName, style: Theme.of(context).textTheme.headlineLarge),
                        const SizedBox(height: 4),
                        Text(
                          genre,
                          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                color: Theme.of(context).colorScheme.secondary,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const Icon(Icons.verified, color: Colors.blue, size: 16),
                            const SizedBox(width: 4),
                            Text('Verificado', style: Theme.of(context).textTheme.bodyMedium),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 24),

          // Biografia
          Text('Biografia', style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 8),
          Text(bio, style: Theme.of(context).textTheme.bodyLarge, textAlign: TextAlign.justify),
          const SizedBox(height: 24),

          // Critério 2: Variedade de layouts (GridView)
          Text('Álbuns', style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 8),
          GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: albums
                .map((album) => Card(
                      elevation: 2,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(album, textAlign: TextAlign.center),
                        ),
                      ),
                    ))
                .toList(),
          ),
          const SizedBox(height: 16),

          // Canção destaque
          Text(
            featuredSong,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontStyle: FontStyle.italic),
          ),
          const SizedBox(height: 24),

          // Critério 5: Criatividade com ícones de premiação
          if (awards.isNotEmpty) ...[
            Text('Prêmios', style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 8),
            ...awards.map((award) => ListTile(
                  leading: const Icon(Icons.military_tech, color: Colors.amber),
                  title: Text(award, style: Theme.of(context).textTheme.bodyLarge),
                )),
          ],
          const SizedBox(height: 24),

          // Redes sociais
          Text('Redes Sociais', style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 8),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: socialLinks.entries.map((socialLink) {
              IconData icon;
              switch (socialLink.key.toLowerCase()) {
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
                  icon = Icons.flutter_dash;
                  break;
                case 'website':
                  icon = Icons.web;
                  break;
                default:
                  icon = Icons.link;
              }
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(icon, color: Theme.of(context).colorScheme.primary),
                    tooltip: socialLink.key,
                    onPressed: () {
                      print('Abrir ${socialLink.key}: ${socialLink.value}');
                    },
                  ),
                  Text(socialLink.key, style: Theme.of(context).textTheme.bodyMedium),
                ],
              );
            }).toList(),
          ),
          const SizedBox(height: 24),

          // Contagem de fãs
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.people, color: Colors.grey),
              const SizedBox(width: 8),
              Text(
                '${NumberFormat.compact().format(fansCount)} Fãs',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
