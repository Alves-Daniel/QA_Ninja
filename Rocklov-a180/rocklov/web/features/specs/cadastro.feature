#language: pt
Funcionalidade: Cadastro
    Sendo um músico que possui equipamentos musicais
    Quero fazer o meu cadastro no RockLov
    Para que eu possa disponibilizá-los para locação

    @cadastro
    Cenário: Fazer cadastro

        Dado que acesso a página de cadastro
        Quando submeto o seguinte formulário de cadastro:
            | nome         | email           | senha |
            | Daniel Alves | alves@gmail.com | 123   |
        Então sou redirecionado para o Dashboard

    @tentativa_cadastro
    Cenário: Submeter o meu cadastro sem o nome

        Dado que acesso a página de cadastro
        Quando submeto o seguinte formulário de cadastro:
            | nome         | email         | senha         |
            | <nome_input> | <email_input> | <senha_input> |
        Então vejo a mensagem de alerta: "<mensagem_output>"

        Exemplos:
            | nome_input   | email_input     | senha_input | mensagem_output                  |
            |              | alves@gmail     | 123         | Oops. Informe seu nome completo! |
            | Daniel Alves |                 | 123         | Oops. Informe um email válido!   |
            | Daniel Alves | alves*mail.com  | 123         | Oops. Informe um email válido!   |
            | Daniel Alves | alves1mail.com  | 123         | Oops. Informe um email válido!   |
            | Daniel Alves | alves@gmail.com |             | Oops. Informe sua senha secreta! |


