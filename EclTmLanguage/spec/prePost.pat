###############################################
# FILE: listItems.pat
# SUBJ: comment
# AUTH: David de Hilster
# CREATED: 07/Nov/19 17:06:47
# MODIFIED:
###############################################

@PATH _ROOT _keyValue _match _value

@POST
X("pre",2) = N("$text",2);
X("post",2) = N("$text",4);
"preposts.txt" << X("$text",2) << "\n";
"preposts.txt" << N("$text",2) << " ==== " << N("$text",4) << "\n";
group(2,2,"_pre");
group(4,4,"_post");
	
@RULES
_xNIL <-
    _xSTART					### (1)
    _xWILD [fail=(_list)]	### (2)
    _list [trig]			### (3)
    _xWILD [plus]			### (4)
    _xEND					### (5)
    @@
