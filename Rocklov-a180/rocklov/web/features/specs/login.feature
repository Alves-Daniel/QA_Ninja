#language: pt

Funcionalidade: Login
    Sendo um usuário cadastro
    Quero acessar o sistema da RockLov
    Para que eu possa anunciar meus equipamentos musicais

    @login
    Cenário: Login do usuário

        Dado que acesso a página principal
        Quando submeto minhas credenciais com "daniel@gmail.com" e "qwerty"
        Então sou redirecionado para o Dashboard

    @tentativa_login
    Esquema do Cenário: Tentar logar

        Dado que acesso a página principal
        Quando submeto minhas credenciais com "<email_input>" e "<senha_input>"
        Então vejo a mensagem de alerta: "<mensagem_output>"

        Exemplos:
            | email_input         | senha_input | mensagem_output                  |
            | oliveitra@gmail.com | 123         | Usuário e/ou senha inválidos.    |
            | daniel404@gmail.com | qwerty      | Usuário e/ou senha inválidos.    |
            |                     |             | Oops. Informe um email válido!   |
            | oliveira#gmail.com  | qwerty      | Oops. Informe um email válido!   |
            |                     | 123qwerty   | Oops. Informe um email válido!   |
            | oliveira@gmail.com  |             | Oops. Informe sua senha secreta! |
