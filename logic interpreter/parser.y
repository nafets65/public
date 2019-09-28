%{
    #include <stdio.h>
    #include <string.h>
    #include <stdlib.h>
    #include <stdbool.h>
    #define YYDEBUG 1
    #include "y.tab.h"
    
    int yyerror(char *msg){
        fprintf(stderr, "Error in parser: %s\n" ,msg);
        exit(EXIT_FAILURE);
    }
    extern int yylex();
    
    
    
    typedef struct promenljiva{
        
        int tf;
        char *name;
    
    }promenljiva;
    
    
    promenljiva *niz = NULL;
    
    int alocirano = 0;
    int br_promenljivih = 0;
    
    void definisi(int tf1 , char *nm){
    
        if(alocirano == br_promenljivih){
        
            alocirano += 5;
            niz = realloc(niz, sizeof(promenljiva) * alocirano);
            if(niz == NULL){
                yyerror("Malloc failure");
            }
        }
        niz[br_promenljivih].tf = tf1;
        
        niz[br_promenljivih].name = strdup(nm);
        
        br_promenljivih++;
    
    }
    int nadji(char *name){
    
        for(int i = 0 ; i <br_promenljivih ; i ++){
            if(!strcmp(name, niz[i].name))
                return i;
        }
        return -1;
    
    }

    
%}


%union{
    
    int vr;
    char *niska;
}






%left EKV 
%left I ILI
%left SLEDI
%right '!'


%token DOD
%token <vr> TRUE 
%token <vr> FALSE
%token <niska> ID

%type <vr> izraz


%%

program : program linija
        | linija                
        ;
linija : izraz                  {   printf("%s\n" , ($1 == 0)? "False": "True");}
        | ID DOD izraz          {definisi($3,$1);}
        ;
izraz : izraz I izraz               {$$ =  $1 && $3;}
        | izraz ILI izraz           {$$ = $1 || $3;}
        | izraz SLEDI izraz         {$$ = ($1==0? 1 : 0) || $3 ;}
        | izraz EKV izraz           {$$ = ($1==$3? 1 : 0);}
        | '!' izraz                 {$$ = ($2==0? 1 : 0);}
        | '(' izraz ')'             {$$ = $2;}
        | ID                        { int indeks = nadji($1); 
                                        if(indeks == -1){
                                            char *buffer;
                                            sprintf(buffer, "Variable %s is not defined", $1);
                                            yyerror(buffer);
                                        }
                                        else{
                                            $$ = niz[indeks].tf;
                                        }}
        | TRUE                      {$$= $1;}
        | FALSE                     {$$ = $1;}
        ;

%%
int main(){

    yydebug =0;
    yyparse();


}