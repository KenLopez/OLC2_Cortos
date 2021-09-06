%{
    var correlativo = 0;
    var correlativo_label = 0;
    new_temp = () => {
        let temp = `T${correlativo}`;
        correlativo++;
        return temp;
    }; 
    new_label = () => {
        let label = `L${correlativo_label}`;
        correlativo_label++;
        return label;
    }; 
%}

%lex

%%

\s+                                 //Ignorar espacios vacíos
"*"                                 return 'por';
"+"                                 return 'mas';
"-"                                 return 'menos';
"/"                                 return 'div';
"("                                 return 'parea';
")"                                 return 'parec';
"{"                                 return 'llavea';
"}"                                 return 'llavec';
"<"                                 return 'menor';
">"                                 return 'mayor';
"="                                 return 'igual';
"!"                                 return 'diff';
"if"                                return 'if';
"else"                              return 'else';
"or"                                return 'or';
"and"                               return 'and';
"not"                               return 'not';
([a-z0-9A-Z_ñÑ])+                   return 'id';

/lex

%start S

%%

S
    :L  {console.log($1.C3D);}
;

/*IF                   
    :IFSOLO else IF
    {
        var LS = `${$1.LS},${$3.LS}`;
        var C3D = `${$1.C3D}${$1.LF}:\n${$3.C3D}:\n`;
        $$ = { LV: $1.LV, LF:$1.LF, C3D: C3D, LS: LS };
    }
    |IFSOLO else llavea id llavec
    {
        var C3D = `${$1.C3D}${$1.LF}:\n${$2.C3D}${$1.LS}:\n`;
        $$ = { LV: $1.LV, LF:$1.LF, C3D: C3D, LS: $1.LS };
    } 
    |IFSOLO
    {
        var C3D = `${$1.C3D}${$1.LF}:\n${$1.LS}:\n`;
        $$ = { LV: $1.LV, LF:$1.LF, C3D: C3D, LS: $1.LS };
    } 
;

IFSOLO
    :if parea L parec llavea id llavec
    {
        var LS = new_label();
        var C3D = `${$3.C3D}${$3.LV}:\n${$6}\ngoto ${LS}\n`;
        $$ = { LV: $3.LV, LF:$3.LF, C3D: C3D, LS: LS };
    }
;
*/

L
    :L or N
    {
        var LV = `${$1.LV},${$3.LV}`;
        var LF = $3.LF;
        var C3D = `--------------------\n${$1.C3D}${$1.LV}:\n${$3.C3D}--LV: ${LV}\n--LF: ${LF}\n--------------------\n`;
        $$ = { LV: LV, LF:LF, C3D:C3D };
    }       
    |L and N
    {
        var LV = $3.LV;
        var LF = `${$1.LF},${$3.LF}`;
        var C3D = `--------------------\n${$1.C3D}${$1.LV}:\n${$3.C3D}--LV: ${LV}\n--LF: ${LF}\n--------------------\n`;
        $$ = { LV: LV, LF:LF, C3D:C3D };
    }            
    |N
    {
        $$ = { LV: $1.LV, LF:$1.LF, C3D:$1.C3D };
    }                     
;

N
    :not C
    {
        var LV = $2.LF;
        var LF = $2.LV;
        var C3D = `---------------\n${$2.C3D}--LV: ${LV}\n--LF: ${LF}\n---------------\n`
        $$ = { LV: LV, LF: LF, C3D: C3D };
    }
    |C
    {
        $$ = { LV: $1.LV, LF:$1.LF, C3D:$1.C3D };
    }
;

C
    :C igual igual E
    {
        var LV = new_label();
        var LF = new_label();
        var C3D = `----------\n${$1.C3D}${$4.C3D}if ${$1.TMP}${$2}${$3}${$4.TMP} goto ${LV}\ngoto ${LF}\n--LV: ${LV}\n--LF: ${LF}\n----------\n`;
        $$ = { LV: LV, LF:LF, C3D:C3D };
    }
    |C diff igual E
    {
        var LV = new_label();
        var LF = new_label();
        var C3D = `----------\n${$1.C3D}${$4.C3D}if ${$1.TMP}${$2}${$3}${$4.TMP} goto ${LV}\ngoto ${LF}\n--LV: ${LV}\n--LF: ${LF}\n----------\n`;
        $$ = { LV: LV, LF:LF, C3D:C3D };
    }
    |C menor E
    {
        var LV = new_label();
        var LF = new_label();
        var C3D = `----------\n${$1.C3D}${$3.C3D}if ${$1.TMP}${$2}${$3.TMP} goto ${LV}\ngoto ${LF}\n--LV: ${LV}\n--LF: ${LF}\n----------\n`;
        $$ = { LV: LV, LF:LF, C3D:C3D };
    }
    |C mayor E
    {
        var LV = new_label();
        var LF = new_label();
        var C3D = `----------\n${$1.C3D}${$3.C3D}if ${$1.TMP}${$2}${$3.TMP} goto ${LV}\ngoto ${LF}\n--LV: ${LV}\n--LF: ${LF}\n----------\n`;
        $$ = { LV: LV, LF:LF, C3D:C3D };
    }
    |C mayor igual E
    {
        var LV = new_label();
        var LF = new_label();
        var C3D = `----------\n${$1.C3D}${$4.C3D}if ${$1.TMP}${$2}${$3}${$4.TMP} goto ${LV}\ngoto ${LF}\n--LV: ${LV}\n--LF: ${LF}\n----------\n`;
        $$ = { LV: LV, LF:LF, C3D:C3D };
    }
    |C menor igual E
    {
        var LV = new_label();
        var LF = new_label();
        var C3D = `----------\n${$1.C3D}${$4.C3D}if ${$1.TMP}${$2}${$3}${$4.TMP} goto ${LV}\ngoto ${LF}\n--LV: ${LV}\n--LF: ${LF}\n----------\n`;
        $$ = { LV: LV, LF:LF, C3D:C3D }
    }
    |E
    {
        $$ = { TMP: $1.TMP, C3D:$1.C3D };
    }
;

E
    :E mas T  
    {  
        var TMP = new_temp();
        var C3D = `${$1.C3D}${$3.C3D}${TMP} = ${$1.TMP} ${$2} ${$3.TMP}\n`; 
        $$ = { TMP: TMP, C3D: C3D };
    }
    |E menos T  
    {  
        var TMP = new_temp();
        var C3D = `${$1.C3D}${$3.C3D}${TMP} = ${$1.TMP} ${$2} ${$3.TMP}\n`; 
        $$ = { TMP: TMP, C3D: C3D };
    }
    |T 
    {  
        $$ = { TMP: $1.TMP, C3D:$1.C3D };
    }
;

T
    :T por F
    {  
        var TMP = new_temp();
        var C3D = `${$1.C3D}${$3.C3D}${TMP} = ${$1.TMP} ${$2} ${$3.TMP}\n`; 
        $$ = { TMP: TMP, C3D: C3D };
    }
    |T div F
    {  
        var TMP = new_temp();
        var C3D = `${$1.C3D}${$3.C3D}${TMP} = ${$1.TMP} ${$2} ${$3.TMP}\n`; 
        $$ = { TMP: TMP, C3D: C3D };
    }
    |F
    {  
        $$ = { TMP: $1.TMP, C3D:$1.C3D };
    }
;

F
    :parea L parec
    {  
        $$ = { TMP: $2.TMP, C3D:$2.C3D };
    }
    |id
    {  
        $$ = { TMP: $1, C3D:'' };
    }
;


