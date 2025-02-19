%{
#include <stdio.h>
%}

KEYWORD     (int|float|char|double|return|if|else|while|for|do|break|continue|void)
IDENTIFIER  [a-zA-Z_][a-zA-Z0-9_]*
CONSTANT    [0-9]+(\.[0-9]+)?
STRING      \"([^\"]|\\\")*\"
PUNCTUATION [;{}(),.]
OPERATOR    [=+\-*/%<>!&|^]

%%

{KEYWORD}      { printf("Keyword: %s\n", yytext); }
{IDENTIFIER}   { printf("Identifier: %s\n", yytext); }
{CONSTANT}     { printf("Constant: %s\n", yytext); }
{STRING}       { printf("String: %s\n", yytext); }
{PUNCTUATION}  { printf("Punctuation: %s\n", yytext); }
{OPERATOR}     { printf("Operator: %s\n", yytext); }

"//".*          { /* Ignore single-line comments */ }
"/*"[^*]*"*"*("*/"|[^*]"*"*)* { /* Ignore multi-line comments */ }
[ \t\n]+       { /* Ignore whitespace */ }
.              { printf("Lexical Error: %s\n", yytext); }

%%

int main() {
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}
