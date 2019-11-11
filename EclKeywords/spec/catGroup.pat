###############################################
# FILE: catGroup.pat
# SUBJ: comment
# AUTH: David de Hilster
# CREATED: 29/Oct/19 16:05:52
# MODIFIED:
###############################################

@NODES _ROOT

@POST
S("con") = N("con",1);
single();

@RULES
_catGroup <-
    _catStart	### (1)
    _xWILD		### (2)
    _catEnd		### (3)
    @@
