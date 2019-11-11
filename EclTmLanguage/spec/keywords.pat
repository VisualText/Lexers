###############################################
# FILE: keys.pat
# SUBJ: comment
# AUTH: David de Hilster
# CREATED: 07/Nov/19 14:13:56
# MODIFIED:
###############################################

@NODES _ROOT

@PRE
<5,5> vareq("level",1);
@POST
singler(1,4);
@RULES
_patterns <-
    \" [s]			### (1)
    patterns [s]	### (2)
    \" [s]			### (3)
    \: [s]			### (4)
    \[				### (5)
    @@
	
@RULES
_repository <-
    \" [s]			### (1)
    repository [s]	### (2)
    \" [s]			### (3)
    \: [s]			### (4)
    @@
