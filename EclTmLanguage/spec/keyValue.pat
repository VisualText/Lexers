###############################################
# FILE: labelValue.pat
# SUBJ: comment
# AUTH: David de Hilster
# CREATED: 07/Nov/19 14:24:44
# MODIFIED:
###############################################

@NODES _ROOT

@POST
S("key") = N("text",1);
single();

@RULES
_keyValue <-
    _key [s]	### (1)
    _value [s]	### (2)
    @@
	
@POST
S("key") = N("text",1);
single();

@RULES
_array <-
    _key [s]					### (1)
    \[ [s]						### (2)
    _xWILD [match=(_value \,)]	### (3)
    \]							### (4)
    @@