%{	
//KEY WORDS
#define FALSE 1
#define	CLASS 2
#define	FINALLY 3
#define	IS 4
#define	RETURN 5
#define NONE 6
#define CONTINUE 7
#define	FOR 8
#define	LAMBDA 9
#define	TRY 10
#define TRUE 11
#define DEF 12
#define FROM 13
#define NONLOCAL 14
#define WHILE 15
#define AND 16
#define DEL 17
#define GLOBAL 18
#define NOT 19
#define WITH 20
#define AS 21
#define ELIF 22
#define IF 23
#define OR 24
#define YIELD 25
#define ASSERT 26
#define ELSE 27
#define IMPORT 28
#define PASS 29
#define BREAK 30
#define EXCEPT 31
#define IN 32
#define RAISE 33
// DATA
#define	INTEGER 34
#define DOUBLE 35
#define SCIENCENUMBER 36
#define HEXADECIMAL 37
#define COMPLEXNUMBER 38
#define STRING 39
#define BOOLEAN 40
// COMMENT
#define COMMENT 41
// variables , Methods Name and ...
#define IDENTEFIER 42   
// Relops
#define LE 43 // <=
#define NE 44 // != or <>
#define EQ 45 // ==
#define GE 46 // >=
#define LT 47 // <
#define GT 48 // >
// Operators
#define APPOINTMENT 49           //  	=
#define POWAPPOINTMENT 50        // 	**=
#define MULTIPLEAPPOINTMENT 51   // 	*=
#define ADDAPPOINTMENT 52        // 	+=
#define MINESAPPOINTMENT 53      // 	-=
#define DEVIDEAPPOINTMENT 54     // 	/=
#define INTDEVIDEAPPOINTMENT 55  // 	//=
#define REMAININGAPPOINTMENT 56  // 	%=
#define ADD 57 			 //	 +
#define MINES 58 		 // 	 -
#define POW 59		 	 // 	 **
#define MULTIPLE 60		 //	 *
#define INTDEVIDE 61             //	 //
#define REMAINDEVIDE 62 	 // 	 %
#define DEVIDE 63		 //	 /
// Binary Operators
#define NOTBIN 64 		 // 	 ~
#define ANDBIN 65		 //	 &
#define ORBIN 66 		 // 	 |
#define XORBIN 67		 // 	 ^
#define LSHIFTBIN 68		 //      <<
#define RSHIFTBIN 69		 // 	 >>
// seprators
#define OPARENTHESES 70  	// (
#define CPARENTHESES 71		// )
#define OBRACKET 72		// [
#define CBRACKET 73		// ]
#define OBRACES 74		// {
#define CBRACES 75		// }
//punctuation
#define POINT 76		// .
#define SEMICOLON 77		// ;
#define COMMA 78		// ,
#define TWOPOINTS 79		// :

%}
%%
False {return FALSE;}
class {return CLASS;}
finally {return FINALLY;}
is {return IS;}
return {return RETURN;}
None {return NONE;}
continue {return CONTINUE;}
for {return FOR;}
lambda {return LAMBDA;}
try {return TRY;}
True {return TRUE;}
def {return DEF;}
from {return FROM;}
nonlocal {return NONLOCAL;}
while {return WHILE;}
and {return AND;}
del {return DEL;} 
global {return GLOBAL;}
not {return NOT;}
with {return WITH;}
as { return AS;}
elif {return ELIF;}
if {return IF;}
or {return OR;}
yield {return YIELD;}
assert { return ASSERT;}
else { return ELSE;}
import {return IMPORT;}
pass {return PASS;}
break {return BREAK;}
except { return EXCEPT;}
in { return IN;}
raise {return RAISE;}
[+-]?[0-9]+ { return INTEGER;}
[+-]?[0-9]+\.[0-9]+ {  return DOUBLE;}
[+-]?[0-9]+(\.[0-9]+)?E[+-]?[0-9]+ { return SCIENCENUMBER;}
0x[0-9A-F]+ { return HEXADECIMAL;  }           // 0x2E2D
[-+]?[0-9]+\+[0-9]+[a-z] { return COMPLEXNUMBER;}  // 3+2i
\".+\" { return STRING;}
\'.+\' { return STRING;}
\"\"\"((.)*(\n)*)+\"\"\" { return STRING;}
\'\'\'((.)*(\n)*)+\'\'\' { return STRING;}
#.+ {return COMMENT;}
[a-zA-Z_][a-zA-Z0-9_]* {return IDENTEFIER;}
== { return EQ;}
\<\= { return LE;}
!\= {return NE;}
\<\> { return NE;}
\>\= { return GE;}
\< { return LT;}
\> { return GT;}
\= { return APPOINTMENT;}
\*\*= { return POWAPPOINTMENT;}
\*= {  return MULTIPLEAPPOINTMENT;}
\+= {return ADDAPPOINTMENT;}
\-= { return MINESAPPOINTMENT;}
\/\= { return DEVIDEAPPOINTMENT;}
\/\/\= { return INTDEVIDEAPPOINTMENT;}
\%\= {return REMAININGAPPOINTMENT;}
\+ {return ADD;}
\- { return MINES;}
\*\* { return POW;}
\* { return MULTIPLE;}
\/\/ { return INTDEVIDE;}
\% { return MULTIPLE;}
\/ { return DEVIDE;}
~ { return NOTBIN;}
& {return ANDBIN;}
\| { return ORBIN;}
\^ { return XORBIN;}
\<\< { return LSHIFTBIN;}
>> { return RSHIFTBIN;}
\( { return OPARENTHESES;}
\) { return CPARENTHESES;}
\[ { return OBRACKET;}
\] { return CBRACKET;}
\{ { return OBRACES;}
\} { return CBRACES;}
\. { return POINT;}
\; { return SEMICOLON;}
\, { return COMMA;}
\: { return TWOPOINTS;}
\n  { printf("\n"); }
%%

int main(int argc, char **argv)
{
 int tok;
 while(tok = yylex()) {
 	//printf("%d", tok);
	if(tok>=1 && tok<=33){
		printf("<KEYWORD,'%s'>",yytext);
	}
	else if(tok>=34 && tok<=40){
		printf("<LITTERAL,%s>",yytext);
	}
	else if(tok==41){
		printf("<COMMENT,'%s'>",yytext);
	}
	else if (tok==42){
		printf("<IDENTIFIER,%s>",yytext);
	}
	else if(tok>=43 && tok<=48){
		printf("<RELOP,%s>",yytext);
	}
	else if(tok>=49 && tok<=69){
		printf("<OPERATOR,'%s'>",yytext);
	}
	else if(tok>=70 && tok<=75){
		printf("<SEPRATOR,'%s'>",yytext);
	}
	else if(tok>=75 && tok<=79){
		printf("<PUNCTUATION,'%s'>",yytext);
	}
	//printf("<%s>",yytext);
 }
}

