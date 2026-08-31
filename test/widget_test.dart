import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:portifolio/main.dart';

String imagemExibida(WidgetTester tester) {
  return (tester
              .widget<Image>(
                find.descendant(
                  of: find.byKey(const ValueKey('capa-projeto-detalhe')),
                  matching: find.byType(Image),
                ),
              )
              .image
          as AssetImage)
      .assetName;
}

void main() {
  testWidgets('mostra todas as seções na página principal', (tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Eu sou Matheus Mota.'), findsOneWidget);
    expect(find.text('Tecnologias que eu sei'), findsOneWidget);
    expect(find.text('Curiosidades sobre mim'), findsOneWidget);
    expect(find.text('Meus projetos'), findsOneWidget);
    expect(find.text('E.Learn'), findsOneWidget);
    expect(find.text('Aut.AI'), findsOneWidget);
    expect(find.text('PBI Rodoviário FTL'), findsOneWidget);
    expect(find.text('DISPONÍVEL'), findsNothing);
    expect(find.text('Vôlei'), findsOneWidget);
    expect(find.text('Jogos FPS'), findsOneWidget);
  });

  testWidgets('abre a página com todas as tecnologias', (tester) async {
    await tester.pumpWidget(const MyApp());

    final botao = find.byKey(const ValueKey('abrir-tecnologias'));
    await tester.ensureVisible(botao);
    await tester.pumpAndSettle();
    await tester.tap(botao);
    await tester.pumpAndSettle();

    expect(find.text('Front-end'), findsOneWidget);
    expect(find.text('Back-end'), findsOneWidget);
    expect(find.text('Banco de dados'), findsOneWidget);
    expect(find.text('Outras ferramentas'), findsOneWidget);
    expect(find.text('Spring Boot'), findsOneWidget);
    expect(find.text('PostgreSQL'), findsOneWidget);
  });

  testWidgets('abre um projeto e permite curtir', (tester) async {
    await tester.pumpWidget(const MyApp());

    final card = find.byKey(const ValueKey('projeto-0'));
    await tester.ensureVisible(card);
    await tester.pumpAndSettle();
    await tester.tap(card);
    await tester.pumpAndSettle();

    expect(find.text('Sobre o projeto'), findsOneWidget);
    expect(imagemExibida(tester), 'assets/images/e-learn.png');
    expect(find.text('Curtir projeto  •  0'), findsOneWidget);
    expect(
      find.text('Grandes ideias começam com um pequeno primeiro passo.'),
      findsOneWidget,
    );

    final botaoFrase = find.byKey(const ValueKey('botao-frase'));
    await tester.ensureVisible(botaoFrase);
    await tester.pumpAndSettle();
    await tester.tap(botaoFrase);
    await tester.pumpAndSettle();
    expect(
      find.text('Cada linha de código é uma nova oportunidade de aprender.'),
      findsOneWidget,
    );

    final botaoCurtir = find.byKey(const ValueKey('botao-curtir'));
    await tester.ensureVisible(botaoCurtir);
    await tester.pumpAndSettle();
    await tester.tap(botaoCurtir);
    await tester.pumpAndSettle();

    expect(find.text('Você curtiu!  •  1'), findsOneWidget);
  });

  testWidgets('cada projeto abre com a sua respectiva capa', (tester) async {
    const capas = [
      'assets/images/e-learn.png',
      'assets/images/autAI.png',
      'assets/images/PBI rodoviario.png',
    ];

    await tester.pumpWidget(const MyApp());

    for (var index = 0; index < capas.length; index++) {
      final card = find.byKey(ValueKey('projeto-$index'));
      await tester.ensureVisible(card);
      await tester.pumpAndSettle();
      await tester.tap(card);
      await tester.pumpAndSettle();

      expect(imagemExibida(tester), capas[index]);

      await tester.tap(find.byTooltip('Voltar'));
      await tester.pumpAndSettle();
    }
  });
}
