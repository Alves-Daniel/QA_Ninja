#language: pt
Funcionalidade: Cadastro de Usuários
    Sendo um visitante do site Parodify
    Quero fazer o meu cadastro
    Para que eu possa ouvir minhas músicas favoritas

    @happy
    Cenario: Cadastro
        Dado que acesso a página de cadastro
        Quando submeto o meu cadastro com:
            | email          | alves.o.daniel7@gmail.com |
            | senha          | qaninja                   |
            | senha_confirma | qaninja                   |

        Então devo ser redirecionado para a área logada

    Esquema do Cenário: Tentativa de Cadastro

        Dado que acesso a página de cadastro
        Quando submeto o meu cadastro com:
            | email          | <email>          |
            | senha          | <senha>          |
            | senha_confirma | <senha_confirma> |
        Então devo ver a mensagem: "<mensagem_saida>"

        Exemplos:
            | email                     | senha   | confirma_senha | mensagem_saida                       |
            |                           | qaninja | qaninja        | Oops! Informe seu email.             |
            | alves.o.daniel7@gmail.com |         |                | Oops! Informe sua senha.             |
            | alves.o.daniel7@gmail.com | qanij1  | qaninj@        | Oops! Senhas não são iguais.         |
            |                           |         |                | Oops! Informe seu email e sua senha. |
@temp
Cenário: Validação do campo  email

    Quando acesso a página de cadastro
    Então deve exibir o seguinte css: "input[type=email]"