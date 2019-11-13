###############################################
# FILE: saveKB.pat
# SUBJ: comment
# AUTH: David de Hilster
# CREATED: 08/Nov/19 16:11:52
# MODIFIED:
###############################################

@DECL

match(L("node"),L("con"))
{
	L("child") = pndown(L("node"));
#	if (pnvar(L("child"),"text") == "name")
#		renameconcept(L("con"),pnvar(pnnext(L("child")),"text"));
	addstrval(L("con"),pnvar(L("child"),"text"),pnvar(pnnext(L("child")),"text"));
	if (pnvar(L("child"),"text") == "match")
	{
		if (pnvar(L("node"),"list"))
		{
			"debug.txt" << conceptname(L("con")) << "\n";
			addstrval(L("con"),"pre",pnvar(L("node"),"pre"));
			addconval(L("con"),"list",pnvar(L("node"),"list"));
			addstrval(L("con"),"post",pnvar(L("node"),"post"));
		}
	}
}

capturePatterns(L("node"),L("con")) {
	L("capture") = makeconcept(L("con"),"captures");
	L("gchild") = pndown(pnnext(pnnext(pndown(L("node")))));

	while (L("gchild"))
	{
		if (pnname(L("gchild")) == "_key")
		{
			L("key") = makeconcept(L("capture"),pnvar(L("gchild"),"text"));
			L("ggchild") = pndown(pnnext(pnnext(L("gchild"))));
			patterns(L("ggchild"),L("key"));
		}
		L("gchild") = pnnext(L("gchild"));
	}
}

beginEndCapture(L("node"),L("con")) {
	L("child") = pndown(L("node"));
	L("key con") = makeconcept(L("con"),pnvar(L("child"),"text"));

	while (L("child"))
	{
		if (pnname(L("child")) == "_keyGroup")
		{
			L("position con") = makeconcept(L("key con"),pnvar(L("child"),"key"));
			L("gchild") = pndown(pnnext(pnnext(pndown(L("child")))));
			addstrval(L("position con"),
						pnvar(L("gchild"),"text"),
						pnvar(pnnext(L("gchild")),"text"));
		}
		L("child") = pnnext(L("child"));
	}
}

patterns(L("node"),L("con")) {
	while (L("node"))
	{
		if (pnname(L("node")) == "_group")
		{
			L("gchild") = pndown(pnnext(pndown(L("node"))));
			addstrval(L("con"),
						pnvar(L("gchild"),"text"),
						pnvar(pnnext(L("gchild")),"text"));
		}
		L("node") = pnnext(L("node"));
	}
}

@@DECL

@CODE

L("child") = pndown(pnroot());

while (L("child") = pnnext(L("child"))) # move past {
{
	if (pndown(L("child")))
	{
		L("gchild") = pndown(L("child"));
		L("con") = makeconcept(G("ecl"),pnvar(L("gchild"),"text"));  # key
		
		while (L("gchild"))
		{
			if (pnname(L("gchild")) == "_value") # in patterns
			{
				addstrval(L("con"),pnvar(L("child"),"key"),pnvar(L("gchild"),"text"));
			}
			else if (pnname(L("gchild")) == "_group") # in patterns
			{
				L("ggchild") = pndown(L("gchild"));
				if (G("pattern count") >= 10)
					L("pat") = "pattern" + str(G("pattern count")++);
				else
					L("pat") = "pattern" + "0" + str(G("pattern count")++);
				L("con pattern") = makeconcept(L("con"),L("pat"));
				while (L("ggchild") = pnnext(L("ggchild")))
				{
					if (pnname(L("ggchild")) == "_keyValue")
					{
						match(L("ggchild"),L("con pattern"));
					}
					else if (pnname(L("ggchild")) == "_keyGroup")
					{
						if (pnvar(L("ggchild"),"key") == "captures")
						{
							capturePatterns(L("ggchild"),L("con pattern"));
						}
					}
				}				
			}
			else if (pnname(L("gchild")) == "_keyGroup") # in repository
			{
				L("ggchild") = pndown(L("gchild"));
				L("con pattern") = makeconcept(L("con"),pnvar(L("ggchild"),"text"));  # key in keyGroup
				while (L("ggchild") = pnnext(L("ggchild"))) # move past {
				{
					if (pnname(L("ggchild")) == "_keyValue")
					{
						match(L("ggchild"),L("con pattern"));
					}
					else if (pnname(L("ggchild")) == "_keyGroup")
					{
						L("text") = pnvar(pndown(L("ggchild")),"text");
						if (L("text") == "patterns")
						{
							L("patterns") = makeconcept(L("con pattern"),"patterns");
							patterns(pndown(L("ggchild")),L("patterns"));
						}
						else if (strendswith(L("text"),"Captures"))
						{
							beginEndCapture(L("ggchild"),L("con pattern"));
						}
						else
						{
							match(L("ggchild"),L("con pattern"));
						}
					}
				}				
			}
			L("gchild") = pnnext(L("gchild"));
		}
	}
}

kbdumptree(G("ecl"),"C:\\git\\nlp\\Lexers\\kbs\\EclTM.kb");
kbdumptree(G("lists"),"C:\\git\\nlp\\Lexers\\kbs\\EclLists.kb");

@@CODE
