package ve.edu.unet;

import java_cup.runtime.*;
import java.io.Reader;
//import otros.*;

%%
/* Habilitar la compatibilidad con el interfaz CUP para el generador sintactico*/
%cup
/* Llamar Scanner a la clase que contiene el analizador Lexico */
%class Lexico

/*-- DECLARACIONES --*/
%{
	public Lexico(Reader r, SymbolFactory sf){
        this(r);
		this.sf=sf;
		lineanum=0;
		debug=true;
	}
	private SymbolFactory sf;
	private int lineanum;
	private boolean debug;


/******************************************************************
BORRAR SI NO SE NECESITA
	//TODO: Cambiar la SF por esto o ver que se hace
	//Crear un nuevo objeto java_cup.runtime.Symbol con información sobre el token actual sin valor
 	  private Symbol symbol(int type){
    		return new Symbol(type,yyline,yycolumn);
	  }
	//Crear un nuevo objeto java_cup.runtime.Symbol con información sobre el token actual con valor
	  private Symbol symbol(int type,Object value){
    		return new Symbol(type,yyline,yycolumn,value);
	  }
******************************************************************/
%}
%eofval{
    return sf.newSymbol("EOF",sym.EOF);
%eofval}

/* Acceso a la columna y fila actual de analisis CUP */
%line
%column



digito		= [0-9]
numero		= {digito}+
letra			= [a-zA-Z]
identificador	= {letra}+
nuevalinea		= \n | \n\r | \r\n
espacio		= [ \t]+
%%

"VAR"           { if(debug) System.out.println("token VAR");
      			        return sf.newSymbol("VAR",sym.VAR);
      			}

"BOOLEAN"           { if(debug) System.out.println("token BOOLEAN");
      			        return sf.newSymbol("BOOLEAN",sym.BOOLEAN);
      			}

"INTEGER"           { if(debug) System.out.println("token INTEGER");
      			        return sf.newSymbol("INTEGER",sym.INTEGER);
      			}

"BEGIN"         { if(debug) System.out.println("token BEGIN");
                                     			        return sf.newSymbol("BEGIN",sym.BEGIN);
                                     			}

"END"         { if(debug) System.out.println("token END");
                               return sf.newSymbol("END",sym.END);
                                     			}

"FOR"         { if(debug) System.out.println("token FOR");
                               return sf.newSymbol("FOR",sym.FOR);
                                     			}

"TO"         { if(debug) System.out.println("token TO");
                               return sf.newSymbol("TO",sym.TO);
                                     			}

"DO"         { if(debug) System.out.println("token DO");
                               return sf.newSymbol("DO",sym.DO);
                                     			}

"REPEAT"         { if(debug) System.out.println("token REPEAT");
                               return sf.newSymbol("REPEAT",sym.REPEAT);
                                     			}

"UNTIL"         { if(debug) System.out.println("token UNTIL");
                               return sf.newSymbol("UNTIL",sym.UNTIL);
                                     			}

"READ"          {	if(debug) System.out.println("token READ");
			return sf.newSymbol("READ",sym.READ);
			}

"WRITE"         {	if(debug) System.out.println("token WRITE");
			return sf.newSymbol("WRITE",sym.WRITE);
			}

":="            {	if(debug) System.out.println("token ASSIGN");
			return sf.newSymbol("ASSIGN",sym.ASSIGN);
			}

"="             {	if(debug) System.out.println("token EQ");
			return sf.newSymbol("EQ",sym.EQ);
			}
"<>"             {	if(debug) System.out.println("token NE");
			return sf.newSymbol("NE",sym.NE);
			}

"<"             {	if(debug) System.out.println("token LT");
			return sf.newSymbol("LT",sym.LT);
			}

"<="             {	if(debug) System.out.println("token LE");
			return sf.newSymbol("LE",sym.LE);
			}

">"             {	if(debug) System.out.println("token GT");
			return sf.newSymbol("GT",sym.GT);
			}

">="             {	if(debug) System.out.println("token GE");
			return sf.newSymbol("GE",sym.GE);
			}

"+"             {	if(debug) System.out.println("token PLUS");
			return sf.newSymbol("PLUS",sym.PLUS);
			}

"-"             {	if(debug) System.out.println("token MINUS");
			return sf.newSymbol("MINUS",sym.MINUS);
			}

"*"             {	if(debug) System.out.println("token TIMES");
			return sf.newSymbol("TIMES",sym.TIMES);
			}

"/"             {	if(debug) System.out.println("token OVER");
			return sf.newSymbol("OVER",sym.OVER);
			}

"MOD"             {	if(debug) System.out.println("token MOD");
			return sf.newSymbol("MOD",sym.MOD);
			}

":"             {	if(debug) System.out.println("token DPUNT");
			return sf.newSymbol("DPUN",sym.DPUNT);
			}

"AND"             {	if(debug) System.out.println("token AND");
			return sf.newSymbol("AND",sym.AND);
			}

"OR"             {	if(debug) System.out.println("token OR");
			return sf.newSymbol("OR",sym.OR);
			}

"NOT"             {	if(debug) System.out.println("token NOT");
			return sf.newSymbol("NOT",sym.NOT); }

"IF"            {	if(debug) System.out.println("token IF");
			return sf.newSymbol("IF",sym.IF);
			}

"THEN"          { if(debug) System.out.println("token THEN");
			return sf.newSymbol("THEN",sym.THEN);
			}

"ELSE"          {	if(debug) System.out.println("token ELSE");
			return sf.newSymbol("ELSE",sym.ELSE);
			}

"("             {	if(debug) System.out.println("token LPAREN");
			return sf.newSymbol("LPAREN",sym.LPAREN);
			}

")"             {	if(debug) System.out.println("token RPAREN");
			return sf.newSymbol("RPAREN",sym.RPAREN);
			}

";"             {	if(debug) System.out.println("token SEMI");
			return sf.newSymbol("SEMI",sym.SEMI);
			}

","             {	if(debug) System.out.println("token COMMA");
			return sf.newSymbol("COMMA",sym.COMMA);
			}

"TRUE"       {	if(debug) System.out.println("token TRUE");
            			return sf.newSymbol("TRUE",sym.TRUE);
            			}

"FALSE"       {	if(debug) System.out.println("token FALSE");
            			return sf.newSymbol("FALSE",sym.FALSE);
            			}

{numero}        {	if(debug) System.out.println("token NUM");
			return sf.newSymbol("NUMBER",sym.NUM,new String(yytext()));
			}

{identificador}	{	if(debug) System.out.println("token ID");
				return sf.newSymbol("ID",sym.ID,new String(yytext()));
			}

{nuevalinea}       {lineanum++;}

{espacio}    { /* saltos espacios en blanco*/}

"{"[^}]+"}"  { /* salto comentarios */ if(debug) System.out.println("token COMENTARIO"); }

.               {System.err.println("Caracter Ilegal encontrado en analisis lexico: " + yytext() + "\n");}