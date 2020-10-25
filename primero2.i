import java.lang.*;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;


%%
%line 
%column
%unicode
%type Object

%{
	public static void main(String[] args) {
		
	 	Yylex lexer = new Yylex (new BufferedReader(new InputStreamReader(System.in)));

	 	try {
	 		lexer.yylex();
	 	}catch (IOException e){
	 		System.out.println("Ocurrio un error al intentar acceder a la consala");
	 	}
	}
%}

digito = [0-9]
letra = [a-zA-Z]
espacio = [ \t\n]
esps = {espacio}+


letrasHexa = [a-f]
hexa = 0x{digito}*{letrasHexa}*

expo=[Ee]([+-])?{digito}+
dec= {digito}*.{digito}+|{digito}+.{digito}*
decimalexpo={dec}{expo}

id = @([a-zA-Z]|[0-9]|-){5,32} //Consideré la longitud sin contar el caracter del arroba

directiva=#{espacio}*(define|ifndef|error|include|endif)

/*Paulina Aguilar Pérez   315331950*/

%%
{esps} { /* Ignorar los espacios en blanco*/}
{digito}+ {System.out.println("Encontre un numero " + yytext()); }
{letra}+  {System.out.println("Encontre una palabra " + yytext());}
{hexa}+  {System.out.println("Encontre un numero hexadecimal " + yytext());}
{decimalexpo}+  {System.out.println("Encontre un numero decimal en notacion exponencial " + yytext());}
{id}+  {System.out.println("Encontre un identificador " + yytext());}
{directiva}+  {System.out.println("Encontre una directiva de preprocesamiento " + yytext());}
