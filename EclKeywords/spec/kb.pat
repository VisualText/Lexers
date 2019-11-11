###############################################
# FILE: kb.pat
# SUBJ: comment
# AUTH: David de Hilster
# CREATED: 07/Nov/19 13:44:06
# MODIFIED:
###############################################

@CODE

G("cats") = findconcept(findroot(), "cats");
if (!G("cats")) G("cats") = makeconcept(findroot(), "cats");

rmchildren(G("cats"));

@@CODE

