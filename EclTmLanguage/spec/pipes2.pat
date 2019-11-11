###############################################
# FILE: pipes.pat
# SUBJ: comment
# AUTH: David de Hilster
# CREATED: 07/Nov/19 17:06:47
# MODIFIED:
###############################################

@NODES _ROOT

@POST
makeconcept(N("list",2),N("$text",3));
listadd(2,4,"false");
"pipes.txt" << N("$text",4) << "\n";

@RULES
_xNIL <-
    _xWILD [matches=(\) \()]		### (1)
    _pipes [lookahead]				### (2)
    \|								### (3)
    _xWILD [fails=(\| \) \()]	### (4)
    @@
