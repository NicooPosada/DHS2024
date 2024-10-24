grammar compiladores;

fragment LETRA : [A-Za-z] ;
fragment DIGITO : [0-9] ;

//INST : (LETRA | DIGITO | [- ,;{}{}+=>] )+ '\n'; 

PA : '(' ;
PC : ')' ;
LLA : '{' ;
LLC : '}' ;
PYC : ';' ;
SUMA : '+' ;
RESTA : '-' ;
MULT : '*' ;
DIV : '/' ;
MOD : '%' ;
MAY : '>' ;
MEN : '<' ;

ASIG: '=' ;
IGUAL : '==' ;

NUMERO : DIGITO+ ;

INT : 'int' ; 
WHILE : 'while' ;
FOR : 'for' ;
IF : 'if' ;

ID : (LETRA | '_')(LETRA | DIGITO | '_')* ;

WS: [ \n\t\r] -> skip;
OTRO : . ;

//s : ID     {print("ID ->" + $ID.text + "<--") }         s
//  | NUMERO {print("NUMERO ->" + $NUMERO.text + "<--") } s
//  | WHILE  {print("WHILE ->" + $WHILE.text + "<--") }   s
//  | OTRO   {print("Otro ->" + $OTRO.text + "<--") }     s
//  | EOF
//  ;

// Analisis sintactico
// si : s EOF ;

// s : PA s PC s
//   |
//   ;

programa : instrucciones EOF ;

instrucciones : instruccion instrucciones 
            |
            ;
//instruccion : INST {print ($INST.text{:-1})};
instruccion : declaracion 
            | iwhile
            // | ifor
            | iif
            | bloque
            | asignacion 
            ;

declaracion : INT ID PYC ;

asignacion : ID ASIG opal PYC ;

opal : exp ; // completar

exp  : term e ;
e    : SUMA  term e
     | RESTA term e
     |
     ;

term : factor t ;
t    : MULT factor t
     | DIV  factor t
     | MOD  factor t
     | 
     ;

factor : NUMERO
        | ID 
        | PA exp PC
        ;

iwhile : WHILE PA ID PC instruccion;

bloque : LLA instrucciones LLC ;

// ifor : FOR PA init PYC cond PYC iter PC instruccion ;
iif : IF PA cond PC LLA instruccion LLC ;

condicion : exp (IGUAL | MAY | MEN) exp ;
// init : ID ASIG NUMERO;
cond : ID MEN NUMERO;
// iter : ID ;


