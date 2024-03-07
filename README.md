# Visão Geral🖥️:
A Pesquisa de CEP é uma aplicação desenvolvida em Delphi que permite aos usuários consultar informações de endereço com base em um CEP fornecido. A aplicação utiliza três serviços de consulta de CEP (ViaCEP, Apicep e AwesomeAPI) para garantir que os usuários obtenham informações precisas, mesmo quando um dos serviços estiver offline. O Arquivo já compilado se encontra na Pasta Win32/DEBUG

# Funcionalidades🎇:
⭐Consulta de CEP: Os usuários podem inserir um CEP na caixa de texto e clicar no botão "Search Cep" para obter informações de endereço relacionadas a esse CEP.
Componentes Utilizados:<br>
⭐TEdit: Caixa de texto onde os usuários inserem o CEP.<br>
⭐TButton: Botão usado para iniciar a consulta de CEP.<br>
⭐TMemo: Área de texto onde as informações de endereço são exibidas.<br>
⭐TRestClient, TRestRequest, TRestResponse: Componentes REST que são utilizados para fazer solicitações HTTP aos serviços de consulta de CEP.<br>
⭐TImage: Componente usado para exibir uma imagem (opcional).<br>
# Lógica de Fallback:
O aplicativo tenta acessar o serviço ViaCEP primeiro. Se não for possível, tenta acessar o serviço Apicep. Se ambos os serviços estiverem offline, recorre ao serviço AwesomeAPI.
As respostas dos serviços são verificadas e a primeira resposta bem-sucedida é exibida ao usuário.
# Como Usar:<br>
➡️Insira o CEP desejado na caixa de texto.<br>
➡️Clique no botão "Search Cep".<br>
➡️As informações de endereço serão exibidas na área de texto.<br>
➡️Requisitos do Sistema:<br>
# Sistema operacional: Windows<br>
# Framework: Delphi (versão X ou superior)<br>
# Notas:
Certifique-se de estar conectado à internet para usar o aplicativo.
Em caso de falha ao consultar um serviço, uma mensagem de aviso será exibida ao usuário.

# Documentação para Desenvolvedores

# Estrutura do Projeto:
ViaCepController.pas: Contém a lógica principal da aplicação, incluindo a interface do usuário e a lógica de consulta de CEP.
Project1.dproj: Arquivo do projeto Delphi.
Outros arquivos auxiliares gerados pelo Delphi durante o desenvolvimento (.dfm, .dpr, etc.).
Dependências Externas:
Biblioteca REST do Delphi: Utilizada para fazer solicitações HTTP aos serviços de consulta de CEP.
Como Implementar Alterações:
Abra o projeto no Delphi IDE.
Faça as alterações desejadas no arquivo ViaCepController.pas.
Compile o projeto para garantir que não haja erros de compilação.
Execute o projeto para testar as alterações.
Faça o commit e envie as alterações para o repositório de controle de versão.
Lógica de Fallback:
A lógica de fallback está implementada na função ConsultarCepClick em ViaCepController.pas.
Cada serviço é verificado quanto à disponibilidade (código de status HTTP 200).
A primeira resposta bem-sucedida é exibida ao usuário.
# Testes:
Teste a aplicação em diferentes cenários, incluindo cenários em que os serviços de consulta de CEP estão offline.
Verifique se as mensagens de erro são exibidas corretamente quando nenhum serviço está disponível.
# Boas Práticas:
Mantenha o código limpo e organizado.
Documente seu código para facilitar a compreensão e manutenção futura.
