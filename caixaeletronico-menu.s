.section .data

# mensagens do programa

abertura:	.asciz	"\nSuper Caixa Eletronico! - Gustavo Batilani e William Douglas\n"
msgtipo: 	.asciz  "\nEscolha seu perfil \n <1> Gerente\n <2> Cliente\n <3> Sair: \n Opcao: "
menuger:	.asciz	"\nMenu de Opcoes - Gerente: \n <1> Cadastrar Cliente \n <2> Repor Caixa \n <3> Lançar Crédito \n <4> Relatorio \n <5> Voltar\nOpcao: "
menucli:	.asciz	"\nMenu de Opcoes - Cliente: \n <1> Verificar Saldo\n <2> Sacar \n <3> Transferir \n <4> Voltar\nOpcao: "
msgrepor:	.asciz	"\nEntre com os valores a repor:"
msgsacar:	.asciz	"\nEntre com o valor a sacar:"
msgcadcli: 	.asciz "\nVamos cadastrar clientes! Digite os dados a seguir \n"

pedenome: .asciz "\nDigite o nome do cliente: " 
pedecpf: .asciz "\nDigite o CPF do cliente: " 
pedeagencia: .asciz "\nDigite o numero da agencia da nova conta: " 
pedeconta: .asciz "\nDigite o numero da conta: " 
pedesaldo: .asciz "\nDigite o saldo inicial do cliente: " 
pedesenha: .asciz "\nDigite a senha do cliente: " 

mostranome: .asciz "\nNome: %s" 
mostracpf: .asciz "\nCPF: %d" 
mostraagencia: .asciz "\nAgência: %d" 
mostraconta: .asciz "\nConta: %d" 
mostrasaldo: .asciz "\nSaldo: %d" 
mostrasenha: .asciz "\nSenha: %s"

NULL: .int 0 # representa posição nula da memoria
naloc: .int 80
ptlista1: .int 0

mostrapt: .asciz "\nptlista = %d\n"
formastr: .asciz "%s"
formach: .asciz "%c"
formanum: .asciz "%d"


pede100:	.asciz 	"\nQuantas notas de 100 deseja? "
pede50:		.asciz 	"\nQuantas notas de 50 deseja? "
pede20:		.asciz 	"\nQuantas notas de 20 deseja? "
pede10:		.asciz 	"\nQuantas notas de 10 deseja? "
pede5:		.asciz 	"\nQuantas notas de 5 deseja? "
pede2:		.asciz 	"\nQuantas notas de 2 deseja? "

msgindisp:	.asciz	"\nDESCULPE O TRANSTORNO: Dinheiro Indisponivel no Caixa! Etapa = %d\n"
msgdisp:	.asciz	"\nSAQUE REALIZADO: N100 = %d * N50 = %d * N20 = %d * N10 = %d * N5 = %d * N2 = %d * Total = %d\n"

mostranotas:	.asciz	"\nNOTAS DO CAIXA: N100 = %d * N50 = %d * N20 = %d * N10 = %d * N5 = %d * N2 = %d * Total = %d\n"
opcao:		.int 	0
formato:	.asciz	"%d"

# quantidades disponiveis no caixa eletronico
quant100:	.int	0
quant50:	.int	0
quant20:	.int	0
quant10:	.int	0
quant5:		.int	0
quant2:		.int	0

# quantidades a serem repassadas ao cliente
notas100:	.int	0
notas50:	.int	0
notas20:	.int	0
notas10:	.int	0
notas5:		.int	0
notas2:		.int	0

# valores constantes
cem:		.int	100
cinquenta:	.int	50
vinte:		.int	20
dez:		.int	10
cinco:		.int	5
dois:		.int	2

	
quant:		.int	0
valorsaque:	.int	0
valorsaqueaux:	.int	0
totalcaixa:	.int	0
totalcaixaux:	.int	0

etapa:		.int	0	

.section .text
.globl	_start
_start:
#INÍCIO DO PROGRAMA -----------------------------------------
	pushl 	$abertura
	call 	printf
	je menuescolha

	pushl %edi

menuescolha:

	pushl $msgtipo
	call printf
	pushl $opcao
	pushl $formato
	call scanf

	movl	opcao, %eax
	cmpl	$1,%eax
	je	menugerente
	cmpl	$2, %eax
	je	menucliente
	cmpl	$3, %eax
	je	fim

menugerente:

	pushl	$menuger
	call	printf
	pushl	$opcao
	pushl	$formato
	call	scanf

	movl	opcao, %eax
	cmpl	$1,%eax
	je	cadastracliente

	cmpl	$2,%eax
	je	repor

	cmpl	$3, %eax
	je	_start
	#IMPLEMENTAR AQUI A FUNÇÃO DESEJADA ------------------------------------------

	cmpl	$4, %eax
	je	_start
	#IMPLEMENTAR AQUI A FUNÇÃO DESEJADA ------------------------------------------

	cmpl	$5, %eax
	je	menuescolha

menucliente:

	pushl	$menucli
	call	printf
	pushl	$opcao
	pushl	$formato
	call	scanf

	movl	opcao, %eax
	cmpl	$1,%eax
	je	_start
	#IMPLEMENTAR AQUI A FUNÇÃO DESEJADA ------------------------------------------

	cmpl	$2, %eax
	je	sacar

	cmpl	$3, %eax
	je	_start
	#IMPLEMENTAR AQUI A FUNÇÃO DESEJADA ------------------------------------------

	cmpl	$4, %eax
	je	menuescolha


	jmp	_start

cadastracliente:

	pushl 	$msgcadcli
	call 	printf

	pushl $pedenome
	call printf
	addl $8, %esp
	pushl $formastr
	call scanf
	addl $4, %esp
	popl %edi 	# recupera %edi
	addl $40, %edi 	# avanca para o proximo campo
	pushl %edi 	# armazena na pilha

	pushl $pedecpf
	call printf
	addl $4, %esp
	pushl $formanum
	call scanf
	addl $4, %esp
	popl %edi 	# recupera %edi
	addl $11, %edi 	# avanca para o proximo campo
	pushl %edi 	# armazena na pilha

	pushl $pedeagencia
	call printf
	addl $4, %esp
	pushl $formanum
	call scanf
	addl $4, %esp
	popl %edi 	# recupera %edi
	addl $4, %edi 	# avanca para o proximo campo
	pushl %edi 	# armazena na pilha

	pushl $pedeconta
	call printf
	addl $4, %esp
	pushl $formanum
	call scanf
	addl $4, %esp
	popl %edi 	# recupera %edi
	addl $6, %edi 	# avanca para o proximo campo
	pushl %edi 	# armazena na pilha

	pushl $pedesaldo
	call printf
	addl $4, %esp
	pushl $formanum
	call scanf
	addl $4, %esp
	popl %edi 	# recupera %edi
	addl $6, %edi 	# avanca para o proximo campo
	pushl %edi 	# armazena na pilha

	pushl $pedesenha
	call printf
	addl $4, %esp
	pushl $formanum
	call scanf
	addl $4, %esp
	popl %edi 	# recupera %edi
	addl $10, %edi 	# avanca para o proximo campo
	movl $NULL, (%edi)

	subl $73,%edi # deixa %edi tal como estava no inicio

	jmp	_start
repor:

	# Pede notas de 100
	pushl	$pede100
	call	printf
	pushl	$quant
	pushl	$formato
	call	scanf
	
	movl	quant100, %eax
	addl	quant, %eax
	movl	%eax, quant100

	movl	quant, %eax
	movl	$0, %edx
	mull	cem
	addl	totalcaixa, %eax
	movl	%eax, totalcaixa

	# Pede notas de 50
	pushl	$pede50
	call	printf
	pushl	$quant
	pushl	$formato
	call	scanf
	
	movl	quant50, %eax
	addl	quant, %eax
	movl	%eax, quant50

	movl	quant, %eax
	movl	$0, %edx
	mull	cinquenta
	addl	totalcaixa, %eax
	movl	%eax, totalcaixa

	# Pede notas de 20
	pushl	$pede20
	call	printf
	pushl	$quant
	pushl	$formato
	call	scanf
	
	movl	quant20, %eax
	addl	quant, %eax
	movl	%eax, quant20

	movl	quant, %eax
	movl	$0, %edx
	mull	vinte
	addl	totalcaixa, %eax
	movl	%eax, totalcaixa

	# Pede notas de 10
	pushl	$pede10
	call	printf
	pushl	$quant
	pushl	$formato
	call	scanf
	
	movl	quant10, %eax
	addl	quant, %eax
	movl	%eax, quant10

	movl	quant, %eax
	movl	$0, %edx
	mull	dez
	addl	totalcaixa, %eax
	movl	%eax, totalcaixa

	# Pede notas de 5
	pushl	$pede5
	call	printf
	pushl	$quant
	pushl	$formato
	call	scanf
	
	movl	quant5, %eax
	addl	quant, %eax
	movl	%eax, quant5

	movl	quant, %eax
	movl	$0, %edx
	mull	cinco
	addl	totalcaixa, %eax
	movl	%eax, totalcaixa

	# Pede notas de 2
	pushl	$pede2
	call	printf
	pushl	$quant
	pushl	$formato
	call	scanf
	
	movl	quant2, %eax
	addl	quant, %eax
	movl	%eax, quant2

	movl	quant, %eax
	movl	$0, %edx
	mull	dois
	addl	totalcaixa, %eax
	movl	%eax, totalcaixa
	
	movl	totalcaixa, %eax
	pushl	%eax
	movl	quant2, %eax
	pushl	%eax
	movl	quant5, %eax
	pushl	%eax
	movl	quant10, %eax
	pushl	%eax
	movl	quant20, %eax
	pushl	%eax
	movl	quant50, %eax
	pushl	%eax
	movl	quant100, %eax
	pushl	%eax
	pushl	$mostranotas
	call	printf

	addl	$100, %esp

	jmp	_start

sacar:
	
	pushl	$msgsacar
	call	printf

	pushl	$valorsaque
	pushl	$formato
	call	scanf

	movl	valorsaque, %eax
	movl	%eax, valorsaqueaux

	movl	totalcaixa, %ebx
	movl	%ebx, totalcaixaux

	# tenta pagar com notas de 100

	movl	$100, etapa

	cmpl	%ebx, %eax
	jg	indisponivel
	
	movl 	$0, %edx
	divl	cem

	cmpl	quant100, %eax
	jle	pagar100
	movl	quant100, %eax

pagar100:	

	movl	%eax, notas100
	movl	$0, %edx
	mull	cem	
	
	movl	valorsaqueaux, %ebx
	subl	%eax, %ebx
	movl	%ebx, valorsaqueaux

	movl	totalcaixaux, %ebx
	subl	%eax, %ebx
	movl	%ebx, totalcaixaux

	# tenta pagar com notas de 50

	movl	$50, etapa

	movl	valorsaqueaux, %eax
	movl	totalcaixaux, %ebx
	cmpl	%ebx, %eax
	jg	indisponivel
	
	divl	cinquenta

	cmpl	quant50, %eax
	jle	pagar50
	movl	quant50, %eax

pagar50:	

	movl	%eax, notas50
	movl	$0, %edx
	mull	cinquenta	
	
	movl	valorsaqueaux, %ebx
	subl	%eax, %ebx
	movl	%ebx, valorsaqueaux

	movl	totalcaixaux, %ebx
	subl	%eax, %ebx
	movl	%ebx, totalcaixaux

	# tenta pagar com notas de 20

	movl	$20, etapa

	movl	valorsaqueaux, %eax
	movl	totalcaixaux, %ebx
	cmpl	%ebx, %eax
	jg	indisponivel
	
	divl	vinte

	cmpl	quant20, %eax
	jle	pagar20
	movl	quant20, %eax

pagar20:	

	movl	%eax, notas20
	movl	$0, %edx
	mull	vinte	
	
	movl	valorsaqueaux, %ebx
	subl	%eax, %ebx
	movl	%ebx, valorsaqueaux

	movl	totalcaixaux, %ebx
	subl	%eax, %ebx
	movl	%ebx, totalcaixaux

	# tenta pagar com notas de 10

	movl	$10, etapa

	movl	valorsaqueaux, %eax
	movl	totalcaixaux, %ebx
	cmpl	%ebx, %eax
	jg	indisponivel
	
	divl	dez

	cmpl	quant10, %eax
	jle	pagar10
	movl	quant10, %eax

pagar10:	

	movl	%eax, notas10
	movl	$0, %edx
	mull	dez	
	
	movl	valorsaqueaux, %ebx
	subl	%eax, %ebx
	movl	%ebx, valorsaqueaux

	movl	totalcaixaux, %ebx
	subl	%eax, %ebx
	movl	%ebx, totalcaixaux

	# tenta pagar com notas de 5

	movl	$5, etapa

	movl	valorsaqueaux, %eax
	movl	totalcaixaux, %ebx
	cmpl	%ebx, %eax
	jg	indisponivel
	
	divl	cinco

	cmpl	quant5, %eax
	jle	pagar5
	movl	quant5, %eax

pagar5:	

	movl	%eax, notas5
	movl	$0, %edx
	mull	cinco	
	
	movl	valorsaqueaux, %ebx
	subl	%eax, %ebx
	movl	%ebx, valorsaqueaux

	movl	totalcaixaux, %ebx
	subl	%eax, %ebx
	movl	%ebx, totalcaixaux

	# tenta pagar com notas de 2

	movl	$2, etapa

	movl	valorsaqueaux, %eax
	movl	totalcaixaux, %ebx
	cmpl	%ebx, %eax
	jg	indisponivel
	
	divl	dois

	cmpl	quant2, %eax
	jle	pagar2
	movl	quant2, %eax

pagar2:	

	movl	%eax, notas2
	movl	$0, %edx
	mull	dois	
	
	movl	valorsaqueaux, %ebx
	subl	%eax, %ebx
	movl	%ebx, valorsaqueaux

	movl	totalcaixaux, %ebx
	subl	%eax, %ebx
	movl	%ebx, totalcaixaux

	movl	valorsaqueaux, %eax
	cmpl	$0, %eax
	jne	indisponivel

	movl	totalcaixa, %eax
	subl	valorsaque, %eax
	movl	%eax, totalcaixa

	movl	quant100, %eax
	subl	notas100, %eax
	movl	%eax, quant100

	movl	quant50, %eax
	subl	notas50, %eax
	movl	%eax, quant50

	movl	quant20, %eax
	subl	notas20, %eax
	movl	%eax, quant20

	movl	quant10, %eax
	subl	notas10, %eax
	movl	%eax, quant10

	movl	quant5, %eax
	subl	notas5, %eax
	movl	%eax, quant5

	movl	quant2, %eax
	subl	notas2, %eax
	movl	%eax, quant2

	# mostra situacao do saque

	movl	valorsaque, %eax
	pushl	%eax
	movl	notas2, %eax
	pushl	%eax
	movl	notas5, %eax
	pushl	%eax
	movl	notas10, %eax
	pushl	%eax
	movl	notas20, %eax
	pushl	%eax
	movl	notas50, %eax
	pushl	%eax
	movl	notas100, %eax
	pushl	%eax
	pushl	$msgdisp
	call	printf
	
	# mostra situacao do caixa

	movl	totalcaixa, %eax
	pushl	%eax
	movl	quant2, %eax
	pushl	%eax
	movl	quant5, %eax
	pushl	%eax
	movl	quant10, %eax
	pushl	%eax
	movl	quant20, %eax
	pushl	%eax
	movl	quant50, %eax
	pushl	%eax
	movl	quant100, %eax
	pushl	%eax
	pushl	$mostranotas
	call	printf

	jmp	_start

indisponivel:
	
	movl	etapa, %eax
	pushl	%eax
	pushl	$msgindisp
	call	printf
	jmp	_start
fim:	
	pushl $0
	call exit
