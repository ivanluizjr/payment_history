# :shield: App Histórico de Pagamentos

Este projeto foi um desafio para construir um app do zero, onde o objetivo era desenvolver um modulo de histórico de pagamentos, contendo uma lista de pagamentos, um cartão do cliente e um gráfico com gastos de porcentagens mês a mês, onde teriamos que alternar entre gráfico e cartão do cliente mantendo a lista de histórico de pagamentos.
  
## :computer: Tecnologias, APIs, Packages utilizados:
  
  * Flutter / Dart
  * VSCode IDE
  * Bloc/Cubit
  * Flutter Modular
  * Package Dio
  * Package Google Fonts
  * Package Either
  * Package Intl
  * Package Shimmer
  

## :file_folder: Organização de pastas e arquivos do projeto:

![image](https://github.com/ivanluizjr/payment_history/assets/41458938/d55601d0-4b5b-411a-a1c3-04dd4380c178)

![image](https://github.com/ivanluizjr/payment_history/assets/41458938/9a345aa8-76cf-4272-ba5f-3bc8789495b0)

  
## :keyboard: Estágios de desenvolvimento do projeto:

  - Seguindo os conceitos de uma arquitetura limpa, fiz a organização das pastas do nosso projeto e configurações de pacotes e widgets 
  que utilizariamos durante o desenvoltimento, como também toda a configuração inicial necessária para um app.

  - Logo após comecei pela camada interna, ou seja, a camada de usecases, implementando após a camada de repositories e por ultimo a 
  camada de datasource que é nossa camada de comunicação externa com banco de dados e Apis modelando a regra de negócio do projeto.
  
  - Procurei desenvolver algo agradável e de boa experiência ao usuário, pois temos somente uma tela com modificação de widgets, então 
  aquilo que minha criatividade me direcionou eu desenvolvi a mais.
  
  - Uma observação é no gráfico, no retorno da Api que consumimos, só temos gastos para o mês de Junho, quando faço o calculo é 
  apresentada uma única barra com porcentagem real pelo calculo de gasto, e as outras ficam zeradas. Então fiz dentro da função um random 
  para preencher automaticamente os outros meses para ficar preenchido e melhor a visualização. Caso a Api de retorno venha ter outros 
  meses com gastos é só retirar da função "calculateMonthlySpending" as linhas de codigos com calculos mockados e ele pegará valores 
  reais para o gráfico.

  - O cartão do cliente tem uma animação, onde clicado ele gira para onde seria a parte de trás do cartão, trazendo o nome do cliente que 
  vem da Api. Na parte frontal do cartão, temos o número do cartão que vem da Api com uma mascára, simulando esconder o número como 
  segurança, e o valor gasto é a soma de todos os gastos que retornam da Api, sendo o valor real somado, o valor disponível não temos 
  retorno então é somente um mock.
  
  - Link do APK do projeto para teste em aparelhos com sistema operacional Android: 
  https://drive.google.com/file/d/1g6PqXHf6anqTrS3MpkW82QgKwvnschGD/view?usp=sharing
  
##

 # :iphone: Layout do App
  
  
 ![Sinaxys_Pay](https://user-images.githubusercontent.com/41458938/192683743-37b08e92-03d3-46bc-9667-7d645f97b646.gif)

   
  #
  
  ![FLutter-1](https://user-images.githubusercontent.com/41458938/161364495-d0dbe155-75f3-4a03-a58f-307d9212b8aa.png)



