###############################################
# FILE: keyGroups.pat
# SUBJ: Copy of groups
# AUTH: David de Hilster
# CREATED: 07/Nov/19 16:32:08
# MODIFIED:
###############################################

@NODES _ROOT

@CHECK
if (N("level",1) != N("level",3)) fail();
@POST
single();

@RULES
_keyGroup <-
    _key [s]											### (1)
    \[ [s lookahead]									### (2)
    _xWILD [plus match=(_value _group _keyGroup _keyValue \,)]	### (3)
    \] [s]												### (4)
    @@
	
@CHECK
if (N("level",1) != N("level",3)) fail();
@POST
single();
	
@RULES
_keyGroup <-
    _key [s]													### (1)
    \{ [s lookahead]											### (2)
    _xWILD [plus match=(_value _group _keyGroup _keyValue \,)]	### (3)
    \} [s]														### (4)
    @@
