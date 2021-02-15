#language: pt

Funcionalidade: Reproduzir Paródia
    Sendo um usuário cadastrado
    Quero reproduzir musicas no play do Parodify
    Para que eu possa ouvir as paródias das minhas bandas favaritas

    Contexto: Login
        * Login com "alves.o.daniel@gmail.com" e "qaninja"

    Cenário: Ouvir Paródia

        Dado que eu goste muito de "Rock"
        Quando toca a seguinte canção:
            | parodia | Sprints de Luta Sprints de Gloria |
            | banda   | Charlie Brown Bug                 |
        Então essa paródia deve ficar em mode de reprodução