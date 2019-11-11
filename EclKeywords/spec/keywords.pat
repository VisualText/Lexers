###############################################
# FILE: keywords.pat
# SUBJ: comment
# AUTH: David de Hilster
# CREATED: 29/Oct/19 16:10:47
# MODIFIED:
###############################################

@PATH _ROOT _catGroup

@POST
addstrval(X("con",2),"keyword", N("$text",7));
G("count")++;
single();

@RULES
_keyword <-
    \< [s]				### (1)
    keyword [s]			### (2)
    _xWHITE [s star]	### (3)
    name [s]			### (4)
    \= [s]				### (5)
    \" [s]				### (6)
    _xWILD [s]			### (7)
    \" [s]				### (8)
    \/ [s]				### (9)
    \> [s]				### (10)
    @@