###############################################
# FILE: zones.pat
# SUBJ: comment
# AUTH: David de Hilster
# CREATED: 08/Nov/19 10:24:16
# MODIFIED:
###############################################

@NODES _ROOT

@PRE
<2,2> vareq("level",1);
<4,4> vareq("level",1);
@POST
S("zone") = "pattern";
single();

@RULES
_zonePattern <-
    _patterns	### (1)
    \[			### (2)
    _xWILD		### (3)
    \]			### (4)
    @@

@PRE
<2,2> vareq("level",1);
<4,4> vareq("level",1);
@POST
S("zone") = "repository";
single();

@RULES
_zoneRepository <-
    _repository	### (1)
    \{			### (2)
    _xWILD		### (3)
    \}			### (4)
    @@