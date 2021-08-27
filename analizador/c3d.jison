%{
    var correlativo = 0;
    new_temp = ()=> {
        let temp = `T${correlativo}`;
        correlativo++;
        return temp;
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
([a-z0-9A-Z_ñÑ])+                   return 'id';

/lex

%start S

%%

S
    :E  {console.log($1.C3D);}
;

E
    :E mas T  
    {  
        let TMP = new_temp();
        let C3D = `${$1.C3D}${$3.C3D}${TMP} = ${$1.TMP} ${$2} ${$3.TMP}\n`; 
        $$ = { TMP: TMP, C3D: C3D };
    }
    |E menos T  
    {  
        let TMP = new_temp();
        let C3D = `${$1.C3D}${$3.C3D}${TMP} = ${$1.TMP} ${$2} ${$3.TMP}\n`; 
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
        let TMP = new_temp();
        let C3D = `${$1.C3D}${$3.C3D}${TMP} = ${$1.TMP} ${$2} ${$3.TMP}\n`; 
        $$ = { TMP: TMP, C3D: C3D };
    }
    |T div F
    {  
        let TMP = new_temp();
        let C3D = `${$1.C3D}${$3.C3D}${TMP} = ${$1.TMP} ${$2} ${$3.TMP}\n`; 
        $$ = { TMP: TMP, C3D: C3D };
    }
    |F
    {  
        $$ = { TMP: $1.TMP, C3D:$1.C3D };
    }
;

F
    :parea E parec
    {  
        $$ = { TMP: $2.TMP, C3D:$2.C3D };
    }
    |id
    {  
        $$ = { TMP: $1, C3D:'' };
    }
;


