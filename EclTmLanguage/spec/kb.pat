###############################################
# FILE: kb.pat
# SUBJ: comment
# AUTH: David de Hilster
# CREATED: 07/Nov/19 14:07:28
# MODIFIED:
###############################################

@CODE

take("C:\\git\\nlp\\analyzers\\kbs\\EclKeywords.kb");

G("ecl") = findconcept(findroot(),"ecl");
if (!G("ecl")) makeconcept(findroot(),"ecl");
rmchildren(G("ecl"));

G("lists") = findconcept(findroot(),"lists");
if (!G("lists")) makeconcept(findroot(),"lists");
rmchildren(G("lists"));

@@CODE
