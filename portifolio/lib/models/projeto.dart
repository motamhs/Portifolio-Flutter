import 'package:flutter/material.dart';

class Projeto {
  const Projeto({
    required this.rota,
    required this.numero,
    required this.titulo,
    required this.resumo,
    required this.descricao,
    required this.tecnologias,
    required this.aprendizados,
    required this.imagem,
    required this.icone,
    required this.cor,
    required this.curtidasIniciais,
  });

  final String rota;
  final String numero;
  final String titulo;
  final String resumo;
  final String descricao;
  final List<String> tecnologias;
  final List<String> aprendizados;
  final String imagem;
  final IconData icone;
  final Color cor;
  final int curtidasIniciais;
}

const projetos = <Projeto>[
  Projeto(
    rota: '/projeto1',
    numero: '01',
    titulo: 'E.Learn',
    resumo:
        'Uma plataforma de aprendizagem que centraliza materiais, atividades e comunicação.',
    descricao:
        'O E.Learn é uma plataforma educacional criada para centralizar o processo de aprendizagem em um único ambiente. A solução possui áreas específicas para alunos e instrutores, permitindo visualizar disciplinas, entregar atividades, consultar notas, receber notificações, utilizar um gerador de resumos e acessar materiais. Para os instrutores, também oferece calendário, fórum de dúvidas, publicação de avisos e gerenciamento de materiais, atividades e acessos.',
    tecnologias: [
      'Angular',
      'TypeScript',
      'Tailwind CSS',
      'Java',
      'Spring Boot',
      'MySQL',
      'Ollama',
      'Figma',
      'GitHub',
      'Trello',
      'Docusaurus',
      'Bruno',
    ],
    aprendizados: [
      'Desenvolver uma aplicação web completa',
      'Integrar front-end, API e banco de dados',
      'Trabalhar com diferentes perfis de usuário',
      'Aplicar inteligência artificial em funcionalidades do sistema',
      'Organizar e documentar um projeto em equipe',
    ],
    imagem: 'assets/images/e-learn.png',
    icone: Icons.school_rounded,
    cor: Color(0xFF88357F),
    curtidasIniciais: 0,
  ),
  Projeto(
    rota: '/projeto2',
    numero: '02',
    titulo: 'Aut.AI',
    resumo:
        'Uma solução inteligente para centralizar dados e otimizar processos de auditoria.',
    descricao:
        'O Aut.AI, Audit Intelligence Utility Tool, foi desenvolvido para facilitar o processo de auditoria, que dependia da consolidação e priorização manual de informações vindas de diferentes bases de dados. A plataforma centraliza os dados, prioriza linhas de análise e oferece recursos como matriz de risco, dashboard, gerenciamento de usuários com RBAC e um assistente inteligente. No projeto, atuei principalmente no desenvolvimento Front-End e UI/UX.',
    tecnologias: [
      'React',
      'Vite',
      'Python',
      'FastAPI',
      'PostgreSQL',
      'Qwen Chat',
      'Unsloth AI',
      'Figma',
      'WCAG',
      'Insomnia',
      'Docusaurus',
    ],
    aprendizados: [
      'Desenvolver interfaces utilizando React',
      'Aplicar conceitos de UI/UX e acessibilidade',
      'Integrar o front-end com APIs',
      'Trabalhar com funcionalidades baseadas em inteligência artificial',
      'Desenvolver uma solução em equipe durante um Hackathon',
    ],
    imagem: 'assets/images/autAI.png',
    icone: Icons.psychology_alt_rounded,
    cor: Color(0xFF0573B4),
    curtidasIniciais: 0,
  ),
  Projeto(
    rota: '/projeto3',
    numero: '03',
    titulo: 'PBI Rodoviário FTL',
    resumo:
        'Dashboard para análise e acompanhamento da eficiência dos transportes logísticos.',
    descricao:
        'O PBI Rodoviário FTL foi desenvolvido para equipes de logística e planejamento, buscando melhorar o monitoramento do Lead Time, a visualização dos serviços por transportadora e rota e a identificação de desvios. O projeto envolve o tratamento de uma base de dados desorganizada e redundante e a construção de um dashboard em Power BI para tornar as informações mais claras e facilitar a análise da operação logística.',
    tecnologias: [
      'Power BI',
      'Análise de dados',
      'Tratamento de dados',
      'Dashboards',
    ],
    aprendizados: [
      'Tratar e organizar bases de dados',
      'Criar dashboards voltados para necessidades reais do negócio',
      'Desenvolver visualizações para análise logística',
      'Transformar dados em informações para tomada de decisão',
    ],
    imagem: 'assets/images/PBI rodoviario.png',
    icone: Icons.analytics_rounded,
    cor: Color(0xFF007BC0),
    curtidasIniciais: 0,
  ),
];
