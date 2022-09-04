RULESET = "";

local function getRuleset()
	RULESET = User.getRulesetName();

	if RULESET == "PFRPG" then
		RULESET = "3.5E"
	end

	if RULESET:match("^%d") then
		RULESET = "DND" .. RULESET;
	end

	RULESET = RULESET:gsub("%.", "");
end

function onInit()
	getRuleset();
end

function CreateTooltipText(node, tNodeOrder)
	local sTooltipText = "";

	sTooltipText = GetTooltipData(node, tNodeOrder, sTooltipText);
	sTooltipText = CleanupTooltipData(sTooltipText);

	return sTooltipText;
end

function GetTooltipData(node, tNodeOrder, sTooltipText)
	for _,sNodeData in ipairs(tNodeOrder) do
		local sNode = DB.getValue(node, sNodeData[1], "");

		if not (sNode == "" or sNode == "<p />") then
			local sLabel = sNodeData[2];

			if sLabel == "" then
				sLabel = StringManager.capitalize(sNodeData[1]);
			end
		
			sTooltipText = sTooltipText .. sLabel .. ": " .. sNode .. "\n";
		end
	end

	return sTooltipText;
end

function CleanupTooltipData(sTooltipText)
	-- Add linebreaks
	sTooltipText = sTooltipText:gsub("<p>", "\n");
	sTooltipText = sTooltipText:gsub("</p>", "\n");
	sTooltipText = sTooltipText:gsub("</link>", "\n");
	sTooltipText = sTooltipText:gsub("Description", "\n%1");

	-- Prepare deletion of duplicate headings
	sTooltipText = sTooltipText:gsub("<h>", "<");
	sTooltipText = sTooltipText:gsub("</h>", ">");

	-- Delete all formatting tags
	sTooltipText = sTooltipText:gsub("%b<>", "");

	-- Delete ending linebreaks
	sTooltipText = sTooltipText:gsub("\n*$", "");

	-- Specific cleanup for rulesets
	if RULESET == "5E" then
		sTooltipText = sTooltipText:gsub("Ritual: 1", "Ritual: Yes");
		sTooltipText = sTooltipText:gsub("Ritual: 0", "Ritual: No");
	elseif RULESET == "SFRPG" then
		sTooltipText = sTooltipText:gsub("Requires RP: 1", "Requires RP: Yes");
		sTooltipText = sTooltipText:gsub("Requires RP: 0", "Requires RP: No");
	end

	-- Unicode Cleanup
	sTooltipText = sTooltipText:gsub("&#196;", "Ä");
	sTooltipText = sTooltipText:gsub("&#228;", "ä");
	sTooltipText = sTooltipText:gsub("&#214;", "Ö");
	sTooltipText = sTooltipText:gsub("&#246;", "ö");
	sTooltipText = sTooltipText:gsub("&#220;", "Ü");
	sTooltipText = sTooltipText:gsub("&#252;", "ü");
	sTooltipText = sTooltipText:gsub("&#223;", "ß");
	sTooltipText = sTooltipText:gsub("&#38;", "&");
	sTooltipText = sTooltipText:gsub("&#34;", "„");
	sTooltipText = sTooltipText:gsub("&#180", "´");
	sTooltipText = sTooltipText:gsub("&#13", "\n");
	sTooltipText = sTooltipText:gsub("&#141", "");

	return sTooltipText;
end
