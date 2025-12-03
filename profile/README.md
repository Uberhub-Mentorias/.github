# 📱Projeto de Curricularização da Extensão


**Disciplina:** Projeto Projeto Back end Microsserviços e NoSQL / Projeto Aplicação para Dispositivos Móveis 

**Professores:** 
| [![Montanheiro](https://github.com/Montanheiro.png?size=150)](https://github.com/Montanheiro) | [![Angoti](https://github.com/angoti.png?size=150)](https://github.com/angoti)  |
|---------------------------------------------|---------------------------------------------------|
| **Prof. Lucas Montanheiro** | **Prof. Edson Angoti**  |

**Período:** 4º 

**Curso:** Sistemas para Internet 

**Instituição:** IFTM - Campus Uberlândia Centro 

---

## 1. Visão Geral e Objetivos
O projeto UberHub Mentorias visa criar uma plataforma móvel para conectar profissionais experientes (Mentores) a pessoas que buscam orientação e desenvolvimento em áreas específicas (Mentorados), dentro do ecossistema do UberHub. O aplicativo gerencia cadastros, vouchers, matchmaking inteligente, agendamentos e avaliações mútuas, fortalecendo o ecossistema de inovação e aprendizado colaborativo do IFTM e da comunidade UberHub.

## 2. Perfil Profissional Desenvolvido
O projeto desenvolve competências previstas no PPC de TSI: criação de sistemas web e móveis; integração com serviços e bancos de dados; aplicação de boas práticas de usabilidade e segurança; uso de CI/CD; fundamentos de IA aplicada a sistemas educacionais e de inovação.

## 3. Alinhamento Pedagógico
Metodologia baseada em projetos reais, extensão e integração com o ecossistema local (UberHub). Promove PBL/ABP, interdisciplinaridade e curricularização da extensão, coerente com as diretrizes do curso e com a missão institucional do IFTM.

## 4. Disciplinas e Tecnologias Relacionadas
Back-end (Java/Spring Boot ou Node), Front-end Mobile (React Native/Expo), Banco de Dados (Firestore/NoSQL), UX/IHC, Empreendedorismo e Extensão. Tecnologias principais no MVP: Firebase (Auth, Firestore, Functions, Storage, FCM), React Native (Expo).

## 5. Impacto Educacional e Competências
Fortalece o protagonismo discente e a integração com o ecossistema UberHub. Desenvolve competências técnicas (full stack, mobile, NoSQL, serverless, CI/CD), de projeto (requisitos, UX, segurança) e socioemocionais (mentoria, colaboração).

## 6. Perfis de Usuário e Permissões

### 6.1 Mentorado
Cadastro/Login; ativação por voucher; descrição do desafio; recebimento de mentor sugerido; agendamento via link externo; avaliação pós-sessão; histórico; solicitação de troca (sob aprovação).

### 6.2 Mentor
Cadastro de perfil (minibio, trilhas, link de agenda, foto); aprovação por Admin; registro de mentorias; feedback e presença; histórico.

### 6.3 Administrador
Aprovação de mentores; geração e gestão de vouchers; moderação de trocas; suspensão por no-show; dashboard com métricas.

## 7. Jornadas do Usuário
### 7.1. Jornada do Mentorado
**Download e Cadastro**: o usuário baixa o app e cria uma conta. A tela principal mostra informações sobre o programa, mas as funções de mentoria estão bloqueadas.
Inserção do Voucher: O usuário insere um código de voucher válido.

**Desbloqueio e Detalhamento**: o app libera a função para o usuário escrever em um campo de texto detalhado sobre sua necessidade de mentoria.

**Matchmaking**: o usuário submete a descrição. O sistema processa a informação e apresenta o perfil do mentor mais compatível.

**Visualização do Mentor**: o app exibe a minibio, as áreas de especialidade e a foto do mentor. Duas opções são apresentadas:

**Agendar Mentoria**: abre o link externo do mentor.

**Solicitar outro mentor**: sbre um formulário onde o usuário justifica o motivo do pedido. Este pedido vai para a aprovação do Admin.

**Agendamento**: o usuário realiza o agendamento na ferramenta externa.

**Notificações**: o usuário recebe notificações push de lembrete sobre a mentoria (ativadas pelo mentor ao cadastrar o agendamento no app).

**Avaliação**: após a data/hora da mentoria e o preenchimento do formulário pelo mentor, o app libera a tela de avaliação para o mentorado (caso tenha comparecido).

### 7.2. Jornada do Mentor
**Cadastro**: o profissional interessado se cadastra como mentor, preenchendo todos os campos necessários. O status do seu perfil fica como "Pendente".

**Aprovação**: o Admin aprova o cadastro. O mentor recebe uma notificação e seu perfil se torna ativo e elegível para o matchmaking.

**Recebimento de Agendamento**: o mentor é notificado pela sua ferramenta externa (ex: Calendly) sobre um novo agendamento.

**Cadastro da Mentoria no App**: o mentor acessa o app, vai para a área "Minhas Mentorias" e clica em "Registrar Nova Mentoria". Ele informa quem é o mentorado e a data/hora agendada. Este passo é crucial para o sistema poder enviar lembretes e controlar o fluxo.

**Realização da Mentoria**: a mentoria ocorre na data marcada.

**Feedback Pós-Mentoria**: após a data/hora da sessão, o app libera para o mentor um formulário simples para ele responder:O mentorado compareceu? (Sim/Não)
(Opcional) Outros campos para coleta de dados.
Conclusão: Ao submeter o formulário, o ciclo da mentoria é finalizado no sistema.

### 7.3. Jornada do Administrador (Painel Web)
**Login**: acesso seguro ao painel de administração.

**Dashboard**: visualização de métricas principais (novos cadastros, mentorias pendentes, mentorias realizadas no mês, etc.).

**Aprovação de Mentores**: uma lista de mentores com status "Pendente" é exibida. O Admin pode visualizar o perfil completo e clicar em "Aprovar" ou "Reprovar".

**Geração de Vouchers**: uma seção para criar vouchers em lote ou individualmente.

  - **Tipo de Voucher**: aberto (qualquer área) ou Restrito (ex: "Marketing Digital", "Gestão de Produtos").
  - **Quantidade**: número de vouchers a serem gerados.
  - O sistema gera uma lista de códigos únicos.

**Monitoramento**: visualiza listas de usuários e mentores, com filtros por status, nº de mentorias, etc. Pode suspender um usuário clicando em um botão ("Suspender por No-show").

## 8. Matchmaking com Inteligência Artificial
Entrada em linguagem natural do mentorado; extração de entidades/tags; cálculo de score por correspondência com trilhas dos mentores; apresentação do mentor top-1. No MVP, simulado via Cloud Functions; Fase 2: integração com modelo externo (ex.: Gemini).

## 9. Requisitos
***nota: requisitos elaborados antes da definição dos endpoints do backend, portanto, podem sofrer alterações***

### 9.1 Requisitos Funcionais – Mentorado
  - RF-MDO-01: autenticar usuário/criar conta com nome, e-mail e senha.
  - RF-MDO-02: recuperar senha por e-mail.
  - RF-MDO-03: aplicar voucher.
  - RF-MDO-04: visualizar status de ativação (ativo, pendente, expirado).
  - RF-MDO-05: preencher “descrição do desafio” (texto livre).
  - RF-MDO-06: enviar para matchmaking e receber sugestão de mentor (minibio, trilhas, foto, link de agenda).
  - RF-MDO-07: abrir link externo do mentor para marcar horário.
  - RF-MDO-08: após o mentor registrar a sessão no app, exibir contagem regressiva e lembretes.
  - RF-MDO-09: abrir formulário “Solicitar outro mentor” com justificativa.
  - RF-MDO-10: preencher avaliação (nota 1–5, comentário) quando o mentor marcar sessão como “concluída” e presença = sim.
  - RF-MDO-11: listar mentorias (passadas e futuras), com status e notas.
  - RF-MDO-12: receber push de confirmação e lembretes.

### 9.2 Requisitos Funcionais – Mentor
  - RF-MTR-01: cadastrar perfil (minibio, trilhas, link agenda, foto).
  - RF-MTR-02: submeter perfil para aprovação.
  - RF-MTR-03: registrar mentoria (mentor + mentorado + data/hora).
  - RF-MTR-04: marcar presença e preencher feedback.
  - RF-MTR-05: visualizar histórico de mentorias.
  - RF-MTR-06: editar perfil.
  - RF-MTR-07: receber notificações sobre agendamentos e avaliações.

### 9.3 Requisitos Funcionais – Administrador
  - RF-ADM-01: aprovar/reprovar mentores.
  - RF-ADM-02: gerar vouchers (abertos ou restritos).
  - RF-ADM-03: consultar e revogar vouchers.
  - RF-ADM-04: aprovar solicitações de troca de mentor.
  - RF-ADM-05: suspender mentorado por no-show recorrente.
  - RF-ADM-06: visualizar dashboard de métricas (mentorias, presenças, NPS).
  - RF-ADM-07: consultar logs e ações administrativas.

### 9.4 Requisitos Não Funcionais (comuns)
  - RNF-01: Para garantir a consistência de interface dos apps vamos adotar uma única biblioteca de componentes, Restyle library ( https://shopify.github.io/restyle/guides)
  - RNF-02: Atendimento à LGPD (Lei Geral de Proteção de Dados, Lei nº 13.709/2018)
  - RNF-03: Acessibilidade (fonte ajustável, alto contraste).
  - RNF-04: Publicação do código-fonte no GitHub sob licença de código aberto.
  - RNF-05: Uso de ferramentas gratuitas.

## 10. Modelo de Dados (mock backend)
* mentores/{id}: nome, email, fotoUrl, minibio, trilhas[], calendlyUrl, status('pendente'|'ativo'|'inativo'), rating, createdAt, updatedAt
* mentorados/{id}: nome, email, voucherAtivo(bool), descDesafio, historico[], createdAt
* vouchers/{code}: tipo('aberto'|'restrito'), trilhasRestritas[], validade, usado(bool), usadoPor(uid|null), dataUso
* mentorias/{id}: mentorId, mentoradoId, dataHora(ts), status('agendada'|'concluida'|'no-show'|'cancelada'), presença(bool|null)
* feedbacks/{id}: mentoriaId, de('mentor'|'mentorado'), nota(1–5), comentario, createdAt

### 11. Requisitos de Avaliação 

1. **Interface do Aplicativo** 

   - Clareza, navegação e usabilidade.
   - Design intuitivo e amigável.

2. **Funcionalidade (40%)** 

   - Implementação correta dos RF.
   - Fluidez e desempenho do aplicativo.

3. **Documentação (30%)** 

   - Descrição técnica do projeto (estrutura, tecnologias usadas, principais desafios).

5. **Apresentação Final** 

   - Exposição do aplicativo na última semana de aula para parceiros do edital e comunidade do IFTM.

---

# 📋 Ações de Gerenciamento dos Projetos 

#### 1. Configuração Inicial 

- **Criar uma Organização no GitHub:** Centralizar os repositórios e times dos alunos.
- **Configurar Regras da Organização:**
  - Repositórios privados por padrão.
  - Página inicial com README explicativo.

#### 2. Configuração de Times 👥

- **Criar Times para Cada Equipe:**
  - Nomear times de forma clara (ADMIN, MENTOR e MENTORANDO).
  - Adicionar membros às equipes correspondentes.
- **Definir Permissões:**
  - Garantir acesso somente aos repositórios da equipe.
  - Permissões de leitura e escrita para membros.

#### 3. Repositórios 

- **Criar um Repositório para o front-end e outro repositório para o back-end:**
  - Nomear com clareza (ex.: `app-mentor e backend-mentor`).
  - Vincular times aos repositórios.
  - Issues e Pull Requests para padronizar tarefas e revisões.

#### 4. Gerenciamento de Projetos 🗓️

- **Criar GitHub Projects:**
  - Projeto para cada time.
  - Utilizar quadros Kanban com colunas como **Backlog**, **To Do**, **In Progress**, **Done**.
- **Definir Milestones:**
  - Estabelecimento de prazos comuns (Entrega parcial 1 - 30/10, Entrega parcial 2 - 10/11, Entrega parcial 3 - 24/11, Apresrentação final - 08/12).

#### 5. Monitoramento e Feedback 

- **Revisões Semanais:**
  - Acompanhar Pull Requests e atividades nos repositórios.
- **Acompanhamento de Progresso:**
  - Usar a aba **Insights > Pulse** para monitorar commits, issues e PRs.
- **Reuniões Semanais:**
  - Check-ins com as equipes para discutir desafios e próximos passos.

#### 7. Relatório final 📈
  - Pedir um arquivo `Relatorio-Final.md` no repositório com a descrição do projeto, desafios enfrentados e tecnologias usadas.

----


