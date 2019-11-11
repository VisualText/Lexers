###############################################
# FILE: listItems.pat
# SUBJ: comment
# AUTH: David de Hilster
# CREATED: 07/Nov/19 17:06:47
# MODIFIED:
###############################################

@PATH _ROOT _keyValue _match _value _list

@POST
if (X("list",2))
	L("list") = X("list",2);
else
	L("list") = G("lists");
L("list") = makeconcept(L("list"),N("$text",1));
if (!X("list",2)) X("list",2) = L("list");

@RULES
_xNIL <-
    _xWILD [group="_listItem" plus fails=(\| \) \()] ### (2)	### (2)
    _xWILD [fails=(\| \) \()]	### (3)
    @@
