%{

#include <stdio.h>
#include <stdlib.h>


/* Output format specifiers */
char* OUTPUT_FIELD_SEPARATOR = "\t" ;

char* TAB_ESCAPE = "\\t" ;
char* NEWLINE_ESCAPE = "\\n" ;

/* I/O parameters */
FILE* outfile = NULL ;

%}


%option noyywrap



%x INSTRING

%%

 /* In ordinary fields or quoted fields, escape tabs. */
<INITIAL,INSTRING>\t      { fprintf(outfile,"%s", TAB_ESCAPE) ; }

 /* In ordinary fields, watch for quotes and commas. */
<INITIAL>\n               { fprintf(outfile,"\n") ; }
<INITIAL>,                { fprintf(outfile,"%s",OUTPUT_FIELD_SEPARATOR) ; }
<INITIAL>["]              { BEGIN(INSTRING) ; }
<INITIAL>.                { fprintf(outfile,"%c", *yytext) ; }

 /* Quoted field should ignore internal commas and escape internal tabs. */
<INSTRING>\n              { fprintf(outfile,"%s",NEWLINE_ESCAPE) ; }
<INSTRING>\\["]           { fprintf(outfile,"\"") ; }
<INSTRING>["]             { BEGIN(INITIAL) ; }
<INSTRING>.               { fprintf(outfile,"%c",*yytext) ; }

%%


int main(int argc, char* argv[]) {
 
  (void)argc; 
  (void)argv; 

  (void)yyunput; 
  (void)input ;

  outfile = stdout ;

  yylex() ;
   
  return EXIT_SUCCESS ;
}
