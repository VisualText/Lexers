###############################################
# FILE: glue.pat
# SUBJ: comment
# AUTH: David de Hilster
# CREATED: 10/Nov/19 07:18:14
# MODIFIED:
###############################################

@NODES _ROOT

@POST
"glue.txt" << phrasetext() << "\n";
single();

@RULES
_token <-
    _xALPHA						### (1)
    _xWILD [match=(\_ _xNUM)]	### (2)
    _xALPHA						### (3)
    @@
