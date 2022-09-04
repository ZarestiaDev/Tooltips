-- Tables represent the wanted database node names in the correct order.
-- Because of ruleset heterogeneity we have to define the label names here.
-- Structue: NodeType -> Ruleset -> Order { DatabaseNodeName, Label }.
-- If label is equivalent to the DatabaseNodeName, we set the value here to "".
-- If the label is different, we set the value here to the one we want.

-- Powers & Spells

DND2E = {
	powers = {
		{ "name", "" },
		{ "type", "" },
		{ "level", "" },
		{ "school", "" },
		{ "sphere", "" },
		{ "castingtime", "Casting Time" },
		{ "range", "" },
		{ "aoe", "AoE" },
		{ "components", "" },
		{ "duration", "" },
		{ "save", "" },
		{ "description", "" }
	};
};

DND35E = {
	spells = {
		{ "name", "" },
		{ "school", "" },
		{ "level", "" },
		{ "components", "" },
		{ "castingtime", "Casting Time" },
		{ "range", "" },
		{ "effect", "Effect/Target" },
		{ "duration", "" },
		{ "save", "Saving Throw" },
		{ "sr", "Spell Resist." },
		{ "description", "" }
	};
};

DND4E = {
	powers = {
		{ "name", "" },
		{ "recharge", "" },
		{ "keywords", "" },
		{ "action", "" },
		{ "range", "" },
		{ "description", "" }
	};
};

DND5E = {
	powers = {
		{ "name", "" },
		{ "level", "" },
		{ "school", "" },
		{ "ritual", "" },
		{ "castingtime", "Casting Time" },
		{ "range", "" },
		{ "components", "" },
		{ "duration", "" },
		{ "description", "" }
	};
	featlist = {
		{ "name", "" },
		{ "text", "Description" }
	};
	featurelist = {
		{ "name", "" },
		{ "text", "Description" }
	};
	traitlist = {
		{ "name", "" },
		{ "text", "Description" }
	};
};

SFRPG = {
	spells = {
		{ "name", "" },
		{ "source", "Class" },
		{ "school", "" },
		{ "level", "" },
		{ "requiresrp", "Requires RP" },
		{ "descriptors", "" },
		{ "castingtime", "Casting Time" },
		{ "range", "" },
		{ "area", "" },
		{ "effect", "Effect/Target" },
		{ "targets", "Target" },
		{ "duration", "" },
		{ "savingthrow", "Saving Throw" },
		{ "sr", "SR" },
		{ "description", "" },
	};
};

PFRPG2 = {
	spells = {
		{ "name", "" },
		{ "spelltype", "Type" },
		{ "level", "" },
		{ "superscripts", "" },
		{ "traits", "" },
		{ "traditions", "" },
		{ "casting", "" },
		{ "trigger", "" },
		{ "requirements", "" },
		{ "cost", "" },
		{ "range", "" },
		{ "area", "" },
		{ "targets", "" },
		{ "savingthrow", "Saving Throw" },
		{ "duration", "" },
		{ "effects", "Description" },
		{ "critsuccess", "Critical Success" },
		{ "success", "" },
		{ "failure", "" },
		{ "critfailure", "Critical Failure" },
		{ "heightened", "" }
	};
};
