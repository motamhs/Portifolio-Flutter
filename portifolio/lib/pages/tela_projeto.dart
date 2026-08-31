import 'package:flutter/material.dart';
import 'package:portifolio/models/projeto.dart';

class TelaProjeto extends StatefulWidget {
  const TelaProjeto({required this.projeto, super.key});

  final Projeto projeto;

  @override
  State<TelaProjeto> createState() => _TelaProjetoState();
}

class _TelaProjetoState extends State<TelaProjeto> {
  static const _texto = Color(0xFF202332);
  static const _fundo = Color(0xFFFAF9F7);
  static const _frases = [
    'Grandes ideias começam com um pequeno primeiro passo.',
    'Cada linha de código é uma nova oportunidade de aprender.',
    'Feito é melhor que perfeito. Continue criando!',
  ];

  bool _curtiu = false;
  late int _curtidas = widget.projeto.curtidasIniciais;
  int _indiceFrase = 0;

  void _curtirProjeto() {
    setState(() {
      _curtiu = !_curtiu;
      _curtidas += _curtiu ? 1 : -1;
    });
  }

  void _trocarFrase() {
    setState(() {
      _indiceFrase = (_indiceFrase + 1) % _frases.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    final projeto = widget.projeto;

    return Scaffold(
      backgroundColor: _fundo,
      appBar: AppBar(
        backgroundColor: _fundo,
        surfaceTintColor: Colors.transparent,
        leadingWidth: 72,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: IconButton.filledTonal(
            tooltip: 'Voltar',
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_rounded),
          ),
        ),
        title: Text(
          'PROJETO ${projeto.numero}',
          style: const TextStyle(
            color: _texto,
            fontSize: 12,
            fontWeight: FontWeight.w900,
            letterSpacing: 1.2,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 900),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 28, 24, 60),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _CapaProjeto(projeto: projeto),
                  const SizedBox(height: 38),
                  Text(
                    projeto.titulo,
                    style: const TextStyle(
                      color: _texto,
                      fontSize: 40,
                      height: 1.08,
                      fontWeight: FontWeight.w900,
                      letterSpacing: -1.2,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    projeto.resumo,
                    style: const TextStyle(
                      color: Color(0xFF686A76),
                      fontSize: 18,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Wrap(
                    spacing: 9,
                    runSpacing: 9,
                    children: [
                      for (final tecnologia in projeto.tecnologias)
                        _Etiqueta(texto: tecnologia, cor: projeto.cor),
                    ],
                  ),
                  const SizedBox(height: 44),
                  _CartaoFrase(
                    frase: _frases[_indiceFrase],
                    indice: _indiceFrase,
                    onTrocar: _trocarFrase,
                  ),
                  const SizedBox(height: 20),
                  _BlocoConteudo(
                    titulo: 'Sobre o projeto',
                    child: Text(
                      projeto.descricao,
                      style: const TextStyle(
                        color: Color(0xFF686A76),
                        fontSize: 16,
                        height: 1.65,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  _BlocoConteudo(
                    titulo: 'O que eu aprendi',
                    child: Column(
                      children: [
                        for (final aprendizado in projeto.aprendizados)
                          _ItemAprendizado(
                            texto: aprendizado,
                            cor: projeto.cor,
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 28),
                  _BotaoCurtir(
                    curtiu: _curtiu,
                    curtidas: _curtidas,
                    cor: projeto.cor,
                    onPressed: _curtirProjeto,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _CartaoFrase extends StatelessWidget {
  const _CartaoFrase({
    required this.frase,
    required this.indice,
    required this.onTrocar,
  });

  final String frase;
  final int indice;
  final VoidCallback onTrocar;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: _TelaProjetoState._texto,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(
                Icons.format_quote_rounded,
                color: Color(0xFFFFC857),
                size: 27,
              ),
              SizedBox(width: 8),
              Text(
                'FRASE DO MOMENTO',
                style: TextStyle(
                  color: Color(0xFFB9BBC8),
                  fontSize: 10,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1.2,
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 250),
            child: Text(
              frase,
              key: ValueKey(indice),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 21,
                height: 1.35,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(height: 17),
          TextButton.icon(
            key: const ValueKey('botao-frase'),
            onPressed: onTrocar,
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.white.withValues(alpha: 0.09),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 11),
            ),
            icon: const Icon(Icons.refresh_rounded, size: 18),
            label: const Text(
              'Trocar frase',
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ),
    );
  }
}

class _CapaProjeto extends StatelessWidget {
  const _CapaProjeto({required this.projeto});

  final Projeto projeto;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: const ValueKey('capa-projeto-detalhe'),
      clipBehavior: Clip.antiAlias,
      width: double.infinity,
      height: 290,
      decoration: BoxDecoration(
        color: projeto.cor.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(32),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              projeto.imagem,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) =>
                  Icon(projeto.icone, size: 105, color: projeto.cor),
            ),
          ),
          Positioned(
            left: 22,
            top: 22,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Text(
                'PROJETO ${projeto.numero}',
                style: TextStyle(
                  color: projeto.cor,
                  fontSize: 10,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Etiqueta extends StatelessWidget {
  const _Etiqueta({required this.texto, required this.cor});

  final String texto;
  final Color cor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
      decoration: BoxDecoration(
        color: cor.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        texto,
        style: TextStyle(color: cor, fontSize: 12, fontWeight: FontWeight.w800),
      ),
    );
  }
}

class _BlocoConteudo extends StatelessWidget {
  const _BlocoConteudo({required this.titulo, required this.child});

  final String titulo;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFFEAE7E1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            titulo,
            style: const TextStyle(
              color: _TelaProjetoState._texto,
              fontSize: 21,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 15),
          child,
        ],
      ),
    );
  }
}

class _ItemAprendizado extends StatelessWidget {
  const _ItemAprendizado({required this.texto, required this.cor});

  final String texto;
  final Color cor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              color: cor.withValues(alpha: 0.12),
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.check_rounded, color: cor, size: 17),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              texto,
              style: const TextStyle(
                color: Color(0xFF5F616D),
                fontSize: 14,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BotaoCurtir extends StatelessWidget {
  const _BotaoCurtir({
    required this.curtiu,
    required this.curtidas,
    required this.cor,
    required this.onPressed,
  });

  final bool curtiu;
  final int curtidas;
  final Color cor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: FilledButton.icon(
        key: const ValueKey('botao-curtir'),
        onPressed: onPressed,
        style: FilledButton.styleFrom(
          backgroundColor: curtiu ? const Color(0xFFE94F64) : cor,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 18),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
        icon: Icon(
          curtiu ? Icons.favorite_rounded : Icons.favorite_border_rounded,
        ),
        label: Text(
          curtiu
              ? 'Você curtiu!  •  $curtidas'
              : 'Curtir projeto  •  $curtidas',
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
        ),
      ),
    );
  }
}
