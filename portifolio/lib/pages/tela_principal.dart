import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portifolio/models/projeto.dart';

class TelaPrincipal extends StatelessWidget {
  const TelaPrincipal({super.key});

  static const roxo = Color(0xFF6C5CE7);
  static const texto = Color(0xFF202332);
  static const fundo = Color(0xFFFAF9F7);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: fundo,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1080),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 28),
                child: Column(
                  children: [
                    SizedBox(height: 28),
                    _Apresentacao(),
                    SizedBox(height: 96),
                    _TituloSecao(
                      pequeno: 'MINHA CAIXA DE FERRAMENTAS',
                      titulo: 'Tecnologias que eu sei',
                      descricao:
                          'Algumas ferramentas que estou usando nos meus estudos.',
                    ),
                    SizedBox(height: 28),
                    _Tecnologias(),
                    SizedBox(height: 96),
                    _TituloSecao(
                      pequeno: 'UM POUCO ALÉM DO CÓDIGO',
                      titulo: 'Curiosidades sobre mim',
                      descricao:
                          'Pequenos detalhes para você me conhecer melhor.',
                    ),
                    SizedBox(height: 28),
                    _Curiosidades(),
                    SizedBox(height: 96),
                    _TituloSecao(
                      pequeno: 'O QUE EU JÁ FIZ',
                      titulo: 'Meus projetos',
                      descricao:
                          'Clique em um card para conhecer os detalhes e deixar sua curtida.',
                    ),
                    SizedBox(height: 30),
                    _Projetos(),
                    SizedBox(height: 96),
                    _Contato(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Apresentacao extends StatelessWidget {
  const _Apresentacao();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final telaGrande = constraints.maxWidth >= 760;

        if (!telaGrande) {
          return const Column(
            children: [
              _FotoPerfil(),
              SizedBox(height: 42),
              _TextoApresentacao(telaGrande: false),
            ],
          );
        }

        return const Row(
          children: [
            Expanded(flex: 6, child: _TextoApresentacao(telaGrande: true)),
            SizedBox(width: 70),
            Expanded(flex: 4, child: _FotoPerfil()),
          ],
        );
      },
    );
  }
}

class _TextoApresentacao extends StatelessWidget {
  const _TextoApresentacao({required this.telaGrande});

  final bool telaGrande;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'OLÁ, QUE BOM TER VOCÊ AQUI 👋',
          style: TextStyle(
            color: TelaPrincipal.roxo,
            fontSize: 11,
            fontWeight: FontWeight.w900,
            letterSpacing: 1.4,
          ),
        ),
        const SizedBox(height: 18),
        Text(
          'Eu sou Matheus Mota.',
          style: TextStyle(
            color: TelaPrincipal.texto,
            fontSize: telaGrande ? 52 : 41,
            height: 1.05,
            fontWeight: FontWeight.w900,
            letterSpacing: -1.8,
          ),
        ),
        const SizedBox(height: 12),
        const Text(
          'Desenvolvedor de Software',
          style: TextStyle(
            color: TelaPrincipal.roxo,
            fontSize: 26,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          'Desenvolvo aplicações web, automações e dashboards, conectando tecnologia, dados e boas experiências para resolver problemas reais.',
          style: TextStyle(color: Color(0xFF666875), fontSize: 16, height: 1.6),
        ),
        const SizedBox(height: 24),
        const Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            _Informacao(icone: Icons.location_on_outlined, texto: 'Brasil'),
            _Informacao(
              icone: Icons.terminal_rounded,
              texto: 'Full Stack & Dados',
            ),
          ],
        ),
      ],
    );
  }
}

class _FotoPerfil extends StatelessWidget {
  const _FotoPerfil();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 270,
        height: 282,
        child: Stack(
          children: [
            Positioned(
              top: 5,
              right: 4,
              child: Transform.rotate(
                angle: 0.08,
                child: Container(
                  width: 245,
                  height: 245,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFFFFC857), Color(0xFFFF8E72)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(55),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 18,
              left: 2,
              child: Container(
                width: 245,
                height: 245,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: const Color(0xFFEAE7FF),
                  borderRadius: BorderRadius.circular(55),
                  border: Border.all(color: Colors.white, width: 7),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x241F1B3D),
                      blurRadius: 30,
                      offset: Offset(0, 16),
                    ),
                  ],
                ),
                child: Image.asset(
                  'assets/images/profile.png',
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.person_rounded,
                          size: 98,
                          color: Color(0xFFA9A1F3),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'SUA FOTO AQUI',
                          style: TextStyle(
                            color: TelaPrincipal.roxo,
                            fontWeight: FontWeight.w800,
                            fontSize: 11,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Informacao extends StatelessWidget {
  const _Informacao({required this.icone, required this.texto});

  final IconData icone;
  final String texto;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: const Color(0xFFE6E3DC)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icone, size: 17, color: TelaPrincipal.roxo),
          const SizedBox(width: 7),
          Text(
            texto,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}

class _TituloSecao extends StatelessWidget {
  const _TituloSecao({
    required this.pequeno,
    required this.titulo,
    required this.descricao,
  });

  final String pequeno;
  final String titulo;
  final String descricao;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          pequeno,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: TelaPrincipal.roxo,
            fontSize: 10,
            fontWeight: FontWeight.w900,
            letterSpacing: 1.5,
          ),
        ),
        const SizedBox(height: 9),
        Text(
          titulo,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: TelaPrincipal.texto,
            fontSize: 34,
            fontWeight: FontWeight.w900,
            letterSpacing: -0.8,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          descricao,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Color(0xFF737580), fontSize: 15),
        ),
      ],
    );
  }
}

class _Tecnologias extends StatelessWidget {
  const _Tecnologias();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LayoutBuilder(
          builder: (context, constraints) {
            final colunas = constraints.maxWidth >= 720 ? 4 : 2;
            final largura =
                (constraints.maxWidth - ((colunas - 1) * 12)) / colunas;

            return Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                SizedBox(
                  width: largura,
                  child: const _Tecnologia(
                    icone: Icons.account_tree_outlined,
                    nome: 'n8n',
                    cor: Color(0xFFFFE8E2),
                  ),
                ),
                SizedBox(
                  width: largura,
                  child: const _Tecnologia(
                    icone: Icons.bar_chart_rounded,
                    nome: 'Power BI',
                    cor: Color(0xFFFFF3C9),
                  ),
                ),
                SizedBox(
                  width: largura,
                  child: const _Tecnologia(
                    icone: Icons.web_rounded,
                    nome: 'React',
                    cor: Color(0xFFE3F3FF),
                  ),
                ),
                SizedBox(
                  width: largura,
                  child: const _Tecnologia(
                    icone: Icons.eco_outlined,
                    nome: 'Spring Boot',
                    cor: Color(0xFFE3F5E7),
                  ),
                ),
              ],
            );
          },
        ),
        const SizedBox(height: 22),
        OutlinedButton.icon(
          key: const ValueKey('abrir-tecnologias'),
          onPressed: () => Navigator.pushNamed(context, '/tecnologias'),
          style: OutlinedButton.styleFrom(
            foregroundColor: TelaPrincipal.texto,
            side: const BorderSide(color: Color(0xFFD8D5CE)),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          ),
          icon: const Icon(Icons.arrow_forward_rounded, size: 18),
          label: const Text(
            'Ver todas as tecnologias',
            style: TextStyle(fontWeight: FontWeight.w800),
          ),
        ),
      ],
    );
  }
}

class _Tecnologia extends StatelessWidget {
  const _Tecnologia({
    required this.icone,
    required this.nome,
    required this.cor,
  });

  final IconData icone;
  final String nome;
  final Color cor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: const Color(0xFFEAE7E1)),
      ),
      child: Column(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(color: cor, shape: BoxShape.circle),
            child: Icon(icone, color: TelaPrincipal.roxo, size: 25),
          ),
          const SizedBox(height: 11),
          Text(
            nome,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: TelaPrincipal.texto,
              fontSize: 13,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }
}

class _Curiosidades extends StatelessWidget {
  const _Curiosidades();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final colunas = constraints.maxWidth >= 700 ? 2 : 1;
        final largura = (constraints.maxWidth - ((colunas - 1) * 14)) / colunas;

        return Wrap(
          spacing: 14,
          runSpacing: 14,
          children: [
            SizedBox(
              width: largura,
              child: const _Curiosidade(
                emoji: '🏐',
                titulo: 'Vôlei',
                texto: 'Gosto de jogar vôlei no meu tempo livre.',
              ),
            ),
            SizedBox(
              width: largura,
              child: const _Curiosidade(
                emoji: '🎮',
                titulo: 'Jogos FPS',
                texto: 'Também gosto de jogar, principalmente jogos de FPS.',
              ),
            ),
          ],
        );
      },
    );
  }
}

class _Curiosidade extends StatelessWidget {
  const _Curiosidade({
    required this.emoji,
    required this.titulo,
    required this.texto,
  });

  final String emoji;
  final String titulo;
  final String texto;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: const Color(0xFFEAE7E1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(emoji, style: const TextStyle(fontSize: 28)),
          const SizedBox(height: 14),
          Text(
            titulo,
            style: const TextStyle(
              color: TelaPrincipal.texto,
              fontSize: 17,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 7),
          Text(
            texto,
            style: const TextStyle(
              color: Color(0xFF737580),
              fontSize: 13,
              height: 1.45,
            ),
          ),
        ],
      ),
    );
  }
}

class _Projetos extends StatelessWidget {
  const _Projetos();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final colunas = constraints.maxWidth >= 850
            ? 3
            : constraints.maxWidth >= 570
            ? 2
            : 1;
        final largura = (constraints.maxWidth - ((colunas - 1) * 18)) / colunas;

        return Wrap(
          spacing: 18,
          runSpacing: 18,
          children: [
            for (var index = 0; index < projetos.length; index++)
              SizedBox(
                width: largura,
                child: _CartaoProjeto(projeto: projetos[index], index: index),
              ),
          ],
        );
      },
    );
  }
}

class _CartaoProjeto extends StatelessWidget {
  const _CartaoProjeto({required this.projeto, required this.index});

  final Projeto projeto;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(26),
      child: InkWell(
        key: ValueKey('projeto-$index'),
        borderRadius: BorderRadius.circular(26),
        onTap: () => Navigator.pushNamed(context, projeto.rota),
        child: Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(26),
            border: Border.all(color: const Color(0xFFEAE7E1)),
            boxShadow: const [
              BoxShadow(
                color: Color(0x0A1D1B2E),
                blurRadius: 20,
                offset: Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                key: ValueKey('capa-projeto-$index'),
                clipBehavior: Clip.antiAlias,
                height: 150,
                decoration: BoxDecoration(
                  color: projeto.cor.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(19),
                ),
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Image.asset(
                        projeto.imagem,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) =>
                            Icon(projeto.icone, color: projeto.cor, size: 60),
                      ),
                    ),
                    Positioned(
                      top: 13,
                      right: 15,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 9,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.9),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          projeto.numero,
                          style: TextStyle(
                            color: projeto.cor,
                            fontSize: 12,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Text(
                projeto.titulo,
                style: const TextStyle(
                  color: TelaPrincipal.texto,
                  fontSize: 19,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 9),
              Text(
                projeto.resumo,
                style: const TextStyle(
                  color: Color(0xFF737580),
                  fontSize: 13,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 18),
              Row(
                children: [
                  Text(
                    'VER PROJETO',
                    style: TextStyle(
                      color: projeto.cor,
                      fontSize: 11,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 0.7,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Icon(
                    Icons.arrow_forward_rounded,
                    color: projeto.cor,
                    size: 17,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Contato extends StatelessWidget {
  const _Contato();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: TelaPrincipal.texto,
        borderRadius: BorderRadius.circular(32),
      ),
      child: const Column(
        children: [
          Text(
            'Vamos conversar?',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.w900,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Você pode me encontrar nestes canais:',
            textAlign: TextAlign.center,
            style: TextStyle(color: Color(0xFFB9BBC8), fontSize: 15),
          ),
          SizedBox(height: 27),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 12,
            runSpacing: 12,
            children: [
              _RedeSocial(
                icone: FontAwesomeIcons.github,
                rede: 'GitHub',
                usuario: 'github.com/motamhs',
              ),
              _RedeSocial(
                icone: FontAwesomeIcons.instagram,
                rede: 'Instagram',
                usuario: '@mota.mhtt',
              ),
              _RedeSocial(
                icone: FontAwesomeIcons.solidEnvelope,
                rede: 'Gmail',
                usuario: 'matheusmota8642@gmail.com',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _RedeSocial extends StatelessWidget {
  const _RedeSocial({
    required this.icone,
    required this.rede,
    required this.usuario,
  });

  final FaIconData icone;
  final String rede;
  final String usuario;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 245,
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(17),
        border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
      ),
      child: Row(
        children: [
          FaIcon(icone, color: Colors.white, size: 21),
          const SizedBox(width: 13),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  rede,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  usuario,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Color(0xFFB9BBC8),
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
