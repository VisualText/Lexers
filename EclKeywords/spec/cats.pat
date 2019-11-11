###############################################
# FILE: cats.pat
# SUBJ: comment
# AUTH: David de Hilster
# CREATED: 29/Oct/19 16:04:42
# MODIFIED:
###############################################

@NODES _ROOT

@POST
S("con") = makeconcept(G("cats"),N("$text",7));
single();

@RULES
_catStart <-
    \< [s]				### (1)
    cat [s]				### (2)
    _xWHITE [s star]	### (3)
    group [s]			### (4)
    \= [s]				### (5)
    \" [s]				### (6)
    _xNUM [s]			### (7)
    \" [s]				### (8)
    \> [s]				### (9)
    @@

@RULES
_catEnd <-
	\< [s]	### (1)
	\/ [s]	### (2)
	cat [s]	### (3)
	\> [s]	### (4)
	@@