###############################################
# FILE: outputKeywords.pat
# SUBJ: comment
# AUTH: David de Hilster
# CREATED: 30/Oct/19 10:39:40
# MODIFIED:
###############################################

@PATH _ROOT _catGroup

@POST
"output.txt" << "    <item>\n";
"output.txt" << "      <categoryid>" << N("category") << "</categoryid>\n";
"output.txt" << "      <name>Integer Symbol Value</name>\n";
"output.txt" << "      <tooltip></tooltip>\n";
"output.txt" << "      <insertbeforecursor>%</insertbeforecursor>\n";
"output.txt" << "      <insertaftercursor>%</insertaftercursor>\n";
"output.txt" << "      <canbefollowedby></canbefollowedby>\n";
"output.txt" << "    </item>\n";

@RULES
_xNIL <-
	_keyword	### (1)
	@@
