###############################################
# FILE: saveKB.pat
# SUBJ: comment
# AUTH: David de Hilster
# CREATED: 08/Nov/19 16:11:52
# MODIFIED:
###############################################

@CODE

rmchildren(G("ecl"));

L("child") = pndown(pnroot());

while (L("child") = pnnext(L("child")))
{
	if (pndown(L("child")))
	{
		L("gchild") = pndown(L("child"));
		"top.txt" << pnname(L("child")) << "\n";
		L("con") = makeconcept(G("ecl"),pnvar(L("gchild"),"text"));
			
		while (L("gchild") = pnnext(L("gchild")))
		{
			if (pnname(L("gchild")) == "_group")
			{
				L("ggchild") = pndown(L("gchild"));
				L("con pattern") = makeconcept(L("con"),"pattern");
				while (L("ggchild") = pnnext(L("ggchild")))
				{
					if (pnname(L("ggchild")) == "_keyValue")
					{
						L("gggchild") = pndown(L("ggchild"));
						if (pnvar(L("gggchild"),"text") == "name")
							renameconcept(L("con pattern"),pnvar(pnnext(L("gggchild")),"text"));
						L("key con") = addstrval(L("con pattern"),
											pnvar(L("gggchild"),"text"),
											pnvar(pnnext(L("gggchild")),"text"));
						if (pnvar(L("gggchild"),"text") == "match")
						{
							if (pnvar(L("ggchild"),"list"))
							{
#								addconval(L("con pattern"),"pre",pnvar(L("ggchild"),"pre"));
								addconval(L("con pattern"),"list",pnvar(L("ggchild"),"list"));
#								addconval(L("con pattern"),"post",pnvar(L("ggchild"),"post"));
							}
						}
					}
				}				
			}
			else if (pnname(L("gchild")) == "_keyGroup")
			{
				L("ggchild") = pndown(L("gchild"));
				L("con pattern") = makeconcept(L("con"),pnvar(L("ggchild"),"text"));
				while (L("ggchild") = pnnext(L("ggchild")))
				{
					if (pnname(L("ggchild")) == "_keyValue")
					{
						L("gggchild") = pndown(L("ggchild"));
						L("key con") = addstrval(L("con pattern"),
											pnvar(L("gggchild"),"text"),
											pnvar(pnnext(L("gggchild")),"text"));
					}
				}				
			}
		}
	}
}

@@CODE
