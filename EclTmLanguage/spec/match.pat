###############################################
# FILE: match.pat
# SUBJ: comment
# AUTH: David de Hilster
# CREATED: 10/Nov/19 08:36:36
# MODIFIED:
###############################################

@PATH _ROOT _keyValue

@CHECK
if (X("key",2) != "match") fail();
@POST
S("text") = N("text");
single();

@RULES
_match <-
	_value
	@@
