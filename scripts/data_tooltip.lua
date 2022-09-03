-- Tables represent the wanted database node names in the correct order
-- Because of ruleset heterogeneity we have to define the label names here

powers = {
	["2E"] = {
		node = {
			"name",
			"type",
			"level",
			"school",
			"sphere",
			"castingtime",
			"range",
			"aoe",
			"components",
			"duration",
			"save",
			"description"
		};
		name = {
			"Name",
			"Type",
			"Level",
			"School",
			"Sphere",
			"Casting Time",
			"Range",
			"AoE",
			"Components",
			"Duration",
			"Save",
			"Description"
		}
	};
	["4E"] = {
		node = {
			"name",
			"recharge",
			"keywords",
			"action",
			"range",
			"description",
		};
		name = {
			"Name",
			"Recharge",
			"Reywords",
			"Action",
			"Range",
			"Description",
		};
	};
	["5E"] = {
		node = {
			"name",
			"level",
			"school",
			"ritual",
			"castingtime",
			"range",
			"components",
			"duration",
			"description"
		};
		name = {
			"Name",
			"Level",
			"School",
			"Ritual",
			"Casting Time",
			"Range",
			"Components",
			"Duration",
			"Description"
		};
	};
};

spells = {
	["3.5E"] = {
		node = {
			"name",
			"school",
			"level",
			"components",
			"castingtime",
			"range",
			"effect",
			"duration",
			"save",
			"sr",
			"description"
		};
		name = {
			"Name",
			"School",
			"Level",
			"Components",
			"Casting Time",
			"Range",
			"Effect/Target",
			"Duration",
			"Saving Throw",
			"Spell Resist.",
			"Description"
		};
	};
	["SFRPG"] = {
		node = {
			"name",
			"source",
			"school",
			"level",
			"requiresrp",
			"descriptors",
			"castingtime",
			"range",
			"area",
			"effect",
			"targets",
			"duration",
			"savingthrow",
			"sr",
			"description"
		};
		name = {
			"Name",
			"Class",
			"School",
			"Level",
			"Requires RP",
			"Descriptors",
			"Casting Time",
			"Range",
			"Area",
			"Effect/Target",
			"Target",
			"Duration",
			"Saving Throw",
			"SR",
			"Description"
		};
	};
	["PFRPG2"] = {
		node = {
			"name",
			"spelltype",
			"level",
			"superscripts",
			"traits",
			"traditions",
			"casting",
			"trigger",
			"requirements",
			"range",
			"cost",
			"area",
			"targets",
			"savingthrow",
			"duration",
			"effects",
			"critsuccess",
			"success",
			"failure",
			"critfailure",
			"heightened"
		};
		name = {
			"Name",
			"Type",
			"Level",
			"Superscripts",
			"Traits",
			"Traditions",
			"Casting",
			"Trigger",
			"Requirements",
			"Cost",
			"Range",
			"Area",
			"Targets",
			"Saving Throw",
			"Duration",
			"Description",
			"Critical Success",
			"Success",
			"Failure",
			"Critical Failure",
			"Heightened"
		};
	};
};
