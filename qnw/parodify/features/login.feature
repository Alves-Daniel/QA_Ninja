#language: pt

Funcionalidade: Login
    Sendo um usuário previamente cadastrado
    Quero acessar o sistema com email e senha
    Para que eu possa ter aceso as playlistas do Parodify

    @smoke
    Cenário: Login do Usuário

        Dado que acesso a página de Login
        Quando submeto minhas credenciais com: "alves.o.daniel@gmail.com" e "qaninja"
        Então devo ser redirecionado para a área logada

    Esquema do Cenário: Tentativa de login

        Dado que acesso a página de Login
        Quando submeto minhas credenciais com: "<email>" e "<senha>"
        Então devo ver a mensagem de erro: "Opps! Dados de acesso incorretos!"

        Exemplos:
            | email                      | senha    |
            | alves.o.daniel7@404.com.br | senha404 |
            |                            |          |
            | alves.o.daniel7@404.com.br |          |
            |                            | senha404 |

