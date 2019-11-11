###############################################
# FILE: matchLists.pat
# SUBJ: comment
# AUTH: David de Hilster
# CREATED: 10/Nov/19 08:48:44
# MODIFIED:
###############################################

@PATH _ROOT _keyValue _match _value

@POST
"lists.txt" << N("$text",2) << "\n";
@RULES
_xNIL <-
    _xWILD [one match=(\) \()]										### (1)
    _xWILD [min=3 group="_list" match=(_xALPHA \| _xNUM \_ _xWHITE)]	### (2)
    @@
