###############################################
# FILE: outputHeader.pat
# SUBJ: comment
# AUTH: David de Hilster
# CREATED: 30/Oct/19 10:28:21
# MODIFIED:
###############################################

@CODE

"output.txt" << "<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\" ?>\n";
"output.txt" << "<!DOCTYPE boost_serialization>\n";
"output.txt" << "<boost_serialization signature=\"serialization::archive\" version=\"5\">\n";
"output.txt" << "    <s class_id=\"0\" tracking_level=\"0\" version=\"0\">\n";
"output.txt" << "    <count>" << G("count") << "</count>\n";
"output.txt" << "    <item_version>0</item_version>\n";
"output.txt" << "    <item class_id=\"1\" tracking_level=\"0\" version=\"0\">\n";
	
@@CODE

