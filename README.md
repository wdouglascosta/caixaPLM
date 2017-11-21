Trabalho feito pelos alunos:
Gustavo Gravena Batilani - RA 88501
William Douglas Costa - RA 89239


O nosso código é baseado no código disponibilizado pelo professor em sala de aula. É feito para ser executado em uma plataforma de 32 bits.

No começo do código estão contidas as mensagens que o programa irá apresentar ao usuário quando ele for executada, conforme o usuário for utilizando o sistema. Além disso, estão definidas todas as variáveis e formatos ainda no inicio do código.

Após isso, está definida a execução do programa com as funções a serem iniciadas pelo usuário.

De ínicio, o sistema irá mostrar um menu onde o usuário irá escolher entre "Gerente" e "Usuário". Após fazer o login, é mostrado na tela um menu referente ao tipo que ele escolheu no ínicio:

1) Em caso de "Gerente", ele pode "Cadastrar Clientes", "Abastecer o Caixa Eletrônico" (repor), "Lançar Credito para Clientes" e "Exibir Relatórios". Estas são as opções para ele escolher. O fluxo do programa é feito através de chamadas "call/ret" ou de saltos no código (jmp, je, jz...).

Para cadastrar um cliente, o usuário deverá fornecer os dados pedidos pelo sistema em ordem, um de cada vez, como nome, conta, agência, cpf, saldo e senha. Todos os campos são definidos com tamanho fixo e são armazedos em uma lista na função "
cadastracli". Para o cadastro é utilizado também o registrador "%edi". A "mostrarelatorio" é a função iniciada se o usuário escolher a opção de relatório no menu e mostra os clientes cadastrados no caixa eletrônico. O módulo 
"repor" é para repor as notas ao caixa eletrônico e o programa pede a quantidade de notas de cada valor, um por vez, sempre somando o valor e armazenando no registrador "%eax". No fim é exibido o total de notas por valor e o valor final disponível no caixa eletrônico, armazenado na variável "totalcaixa". A função para lançar crédito para o cliente.

2) Se o usuário escolher a opção "Cliente" ele pode "Ver o Saldo", "Fazer o Saque" e "Transferência". 

O módulo "sacar" habilita o usuário a sacar um valor do caixa eletrônico. O usuário informa o valor do saque e o programa verifica se está diponível o valor e se é válido. O módulo chama outros, como o "pagar100", "pagar50"... que determina a quantidade de cada nota que deve ser retirada para o usuário fazer o saque. Feito isso, o valor é subtraído e o caixa atualizado, bem como a quantidade de notas. Se a quantidade não estiver disponível, uma mensagem é informada ao cliente sobre a situação. As funções para o cliente ver o saldo e fazer transferência não foram implementadas.

A função "mostrarelatorio" apresenta um erro na hora de retornar para o menu gerente, devido ao "call/ret". Após o término de cada execução de cada módulo, é retornado ao meno chamador e por fim, ao menu principal (denomidado "menuescolha") onde é possível encerrar a execução do programa.
