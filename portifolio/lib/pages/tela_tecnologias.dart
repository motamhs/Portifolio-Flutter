import 'package:flutter/material.dart';

class TelaTecnologias extends StatelessWidget {
  const TelaTecnologias({super.key});

  static const _texto = Color(0xFF202332);
  static const _fundo = Color(0xFFFAF9F7);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _fundo,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 980),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 22, 24, 60),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextButton.icon(
                      onPressed: () => Navigator.pop(context),
                      style: TextButton.styleFrom(foregroundColor: _texto),
                      icon: const Icon(Icons.arrow_back_rounded),
                      label: const Text(
                        'Voltar ao portfólio',
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                    ),
                    const SizedBox(height: 48),
                    const Text(
                      'TECNOLOGIAS',
                      style: TextStyle(
                        color: Color(0xFF6C5CE7),
                        fontSize: 11,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 1.6,
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Ferramentas que fazem parte do meu trabalho.',
                      style: TextStyle(
                        color: _texto,
                        fontSize: 42,
                        height: 1.08,
                        fontWeight: FontWeight.w900,
                        letterSpacing: -1.4,
                      ),
                    ),
                    const SizedBox(height: 16),
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 650),
                      child: const Text(
                        'Organizei tudo por área para mostrar de forma clara as tecnologias que conheço e uso nos meus projetos.',
                        style: TextStyle(
                          color: Color(0xFF6D6F7B),
                          fontSize: 16,
                          height: 1.55,
                        ),
                      ),
                    ),
                    const SizedBox(height: 46),
                    const _Categorias(),
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

class _Categorias extends StatelessWidget {
  const _Categorias();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final colunas = constraints.maxWidth >= 720 ? 2 : 1;
        final largura = (constraints.maxWidth - ((colunas - 1) * 16)) / colunas;

        return Wrap(
          spacing: 16,
          runSpacing: 16,
          children: [
            SizedBox(
              width: largura,
              child: const _Categoria(
                numero: '01',
                titulo: 'Front-end',
                descricao: 'Interfaces e experiências para a web.',
                icone: Icons.web_rounded,
                cor: Color(0xFF5068D8),
                tecnologias: [
                  'React',
                  'JavaScript',
                  'TypeScript',
                  'Tailwind CSS',
                ],
              ),
            ),
            SizedBox(
              width: largura,
              child: const _Categoria(
                numero: '02',
                titulo: 'Back-end',
                descricao: 'APIs, regras de negócio e aplicações.',
                icone: Icons.dns_outlined,
                cor: Color(0xFF168F76),
                tecnologias: [
                  'Python',
                  'Java',
                  'FastAPI',
                  'Django',
                  'Spring Boot',
                ],
              ),
            ),
            SizedBox(
              width: largura,
              child: const _Categoria(
                numero: '03',
                titulo: 'Banco de dados',
                descricao: 'Organização, consulta e persistência de dados.',
                icone: Icons.storage_rounded,
                cor: Color(0xFFB56B16),
                tecnologias: ['MySQL', 'SQL Server', 'PostgreSQL'],
              ),
            ),
            SizedBox(
              width: largura,
              child: const _Categoria(
                numero: '04',
                titulo: 'Outras ferramentas',
                descricao: 'Automação, análise de dados e versionamento.',
                icone: Icons.account_tree_outlined,
                cor: Color(0xFFD45D48),
                tecnologias: ['n8n', 'Power BI', 'GitHub'],
              ),
            ),
          ],
        );
      },
    );
  }
}

class _Categoria extends StatelessWidget {
  const _Categoria({
    required this.numero,
    required this.titulo,
    required this.descricao,
    required this.icone,
    required this.cor,
    required this.tecnologias,
  });

  final String numero;
  final String titulo;
  final String descricao;
  final IconData icone;
  final Color cor;
  final List<String> tecnologias;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFE6E3DD)),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 46,
                height: 46,
                decoration: BoxDecoration(
                  color: cor.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icone, color: cor, size: 24),
              ),
              const Spacer(),
              Text(
                numero,
                style: TextStyle(
                  color: cor,
                  fontSize: 12,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            titulo,
            style: const TextStyle(
              color: TelaTecnologias._texto,
              fontSize: 21,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 7),
          Text(
            descricao,
            style: const TextStyle(
              color: Color(0xFF737580),
              fontSize: 13,
              height: 1.45,
            ),
          ),
          const SizedBox(height: 20),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              for (final tecnologia in tecnologias)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF4F2EE),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    tecnologia,
                    style: const TextStyle(
                      color: TelaTecnologias._texto,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
