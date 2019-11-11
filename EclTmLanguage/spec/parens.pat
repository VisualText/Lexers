###############################################
# FILE: parens.pat
# SUBJ: comment
# AUTH: David de Hilster
# CREATED: 08/Nov/19 10:37:41
# MODIFIED:
###############################################

@NODES _ROOT

@POST
N("level") = G("paren level")++
@RULES
_xNIL <-
	\[	### (1)
	@@

@POST
G("paren level")--;
N("level") = G("paren level");

@RULES
_xNIL <-
	\]	### (1)
	@@
	
@POST
N("level") = G("paren level")++;

@RULES
_xNIL <-
	\{	### (1)
	@@

@POST
G("paren level")--;
N("level") = G("paren level");

@RULES
_xNIL <-
	\}	### (1)
	@@