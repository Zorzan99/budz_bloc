# budz_bloc

Budz app foi feito com bloc para gerência de estado, Dio para consumo de API, sqflite para persistência de dados, dotEnv para armazenar URL, json rest server para simular o backend(na pasta backend).

Para testar o app, precisa ter o json rest server confiurado na maquina (https://pub.dev/packages/json_rest_server), depois de configurado, vc entra na pasta (backend) do projeto e roda o comando json_rest_server run, dependendo tera que mudar o caminho no arquivo .env na raiz de projeto e colocar o IP da sua maquina que aparece quando vc da o comando do json rest server

Foi testado em 2 emuladores e estava responsivo nos 2.

BottomNavigatonBar funciona, porém deixei a opcao de quando clicar no card Meu perfil, fazer navegaçao sem BottomNavigatonBar para ser mais fiel ao layout.

No quesito customização do layout, fiz separação de widget. Configurei tema no app, fonts e assets e widgets globais para o app todo, e widgets unicos quando se usa somente em uma screen!.


