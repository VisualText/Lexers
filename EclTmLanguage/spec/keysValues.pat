###############################################
# FILE: keysValues.pat
# SUBJ: comment
# AUTH: David de Hilster
# CREATED: 07/Nov/19 14:13:56
# MODIFIED:
###############################################

@NODES _ROOT

@POST
S("text") = N("$text",2);
single();

@RULES
_key <-
    \" [s]								### (1)
    _xWILD [s match=(_xALPHA \- _xNUM)]	### (2)
    \" [s]								### (3)
    \: [s]								### (4)
    @@
	
@POST
S("text") = N("$text",2);
single(); 
   
@RULES
_value <-
    \" [s]					### (1)
    _xWILD [s fail=(\")]	### (2)
    \" [s]					### (3)
    @@
