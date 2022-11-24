%{
/*
 * this is a implementation of simple  noun and verb recognition:
 * a noun or a verb/not a noun or a verb.
 */
int count_noun = 0;
/*
 * the count variable is used to count the number of nouns
 */
int count_verb = 0;
/*
 * the count variable is used to count the number of verbs
 */
%}
 
/*** Rule Section has a set of nouns and verbs that will be used***/
%%
[\t ]+                   /* ignore whitespace */ ;

time |
person |
year |
way |
day |
thing |
man |
world |
life |
hand |
part |
child |
eye |
woman |
place |
work |
week |
case |
point |
government { printf("%s: is a noun\n", yytext); count_noun++;}

choose |
come |
bring |
build |
feel |
become |
eat |
have |
grow |
hear |
make |
forget |
fly |
say |
run |
think |
take |
tell |
speak |
forgive { printf("%s: is a verb\n", yytext); count_verb++;}

[a-zA-Z]+ { printf("%s: is not a noun or verb\n", yytext); }

.|\n      {return 0;}
%%

int yywrap(){}
int main(){
 
// Explanation:
// yywrap() - wraps the above rule section
/* yyin - takes the file pointer
          which contains the input*/
/* yylex() - this is the main flex function
          which runs the Rule Section*/
// yytext is the text in the buffer
 

FILE *fp;
char word[50];
printf("Enter the sentence: \n");
scanf("%s", word);
fp = fopen(word,"r");
yyin = fp;
 
yylex();
printf("\nNumber of Nouns "
      "in the given input - %d\n", count_noun);
printf("\nNumber of Verbs "
      "in the given input - %d\n", count_verb);
 
return 0;
}