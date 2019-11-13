###############################################
# FILE: groups.pat
# SUBJ: comment
# AUTH: David de Hilster
# CREATED: 07/Nov/19 14:19:06
# MODIFIED:
###############################################

@NODES _ROOT

@CHECK
if (N("level",1) != N("level",3)) fail();
@POST
S("key") = N("$text",1);
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
S("key") = N("text",1);
single();
	
@RULES
_keyGroup <-
    _key [s]													### (1)
    \{ [s lookahead]											### (2)
    _xWILD [plus match=(_value _group _keyGroup _keyValue \,)]	### (3)
    \} [s]														### (4)
    @@

@CHECK
if (N("level",2) != N("level",4)) fail();
@POST
singler(2,4);

@RULES
_group <-
    _xWILD [one matches=(\[ \{ \,)]			### (1)
    \{ [s lookahead]						### (2)
    _xWILD [plus match=(_value _group _keyGroup _keyValue \,)]	### (3)
    \} [s]									### (4)
    @@
	
@CHECK
if (N("level",2) != N("level",4)) fail();
@POST
singler(2,4);

@RULES
_group <-
    _xWILD [one matches=(\[ \{ \,)]								### (1)
    \[ [s lookahead]											### (2)
    _xWILD [plus match=(_value _group _keyGroup _keyValue \,)]	### (3)
    \] [s]														### (4)
    @@