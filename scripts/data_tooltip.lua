-- Tables represent the wanted database node names in the correct order.
-- Because of ruleset heterogeneity we have to define the label names here.
-- Structue: Ruleset -> NodeType -> Order { "DatabaseNodeTypeName", "Label" }.
-- If label is equivalent to the DatabaseNodeTypeName, we set the value here to "".
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
	featurelist = {
		{ "name", "" },
		{ "text", "Description" }
	};
	traitlist = {
		{ "name", "" },
		{ "text", "Description" }
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
	featlist = {
		{ "name", "" },
		{ "type", "" },
		{ "prerequisites", "" },
		{ "summary", "" },
		{ "benefit", "" },
		{ "normal", "" },
		{ "special", "" }
	};
	specialabilitylist = {
		{ "name", "" },
		{ "text", "Description" }
	};
	traitlist = {
		{ "name", "" },
		{ "text", "Description" }
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
	featlist = {
		{ "value", "Name" },
		{ "description", "" }
	};
	specialabilitylist = {
		{ "value", "Name" },
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
	specialabilitylist = {
		{ "name", "" },
		{ "source", "Source Book" },
		{ "class", "" },
		{ "feature", "" },
		{ "level", "" },
		{ "text", "Description" }
	};
	featlist = {
		{ "name", "" },
		{ "type", "" },
		{ "summary", "" },
		{ "prequisite", "Prerequisites" },
		{ "benefit", "" },
		{ "normal", "" },
		{ "special", "" }
	};
	themeabilitylist = {
		{ "name", "" },
		{ "level", "" },
		{ "text", "Description" }
	};
	proficiencylist = {
		{ "name", "" },
		{ "type", "" },
		{ "summary", "" },
		{ "prequisite", "Prerequisites" },
		{ "weaponsubtype", "Weaopn Sub Type" },
		{ "benefit", "" },
		{ "normal", "" },
		{ "special", "" }
	};
	traitlist = {
		{ "name", "" },
		{ "text", "Description" }
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
	featlist = {
		{ "name", "" },
		{ "level", "" },
		{ "traits", "" },
		{ "prerequisites", "" },
		{ "access", "" },
		{ "archetype", "" },
		{ "frequency", "" },
		{ "trigger", "" },
		{ "requirements", "" },
		{ "shortbenefits", "Short Benefits" },
		{ "effectsbenefits", "Description" },
		{ "special", "" }
	};
	specialabilitylist = {
		{ "name", "" },
		{ "text", "Description" }
	};
	traitlist = {
		{ "name", "" },
		{ "text", "Description" }
	};
};
