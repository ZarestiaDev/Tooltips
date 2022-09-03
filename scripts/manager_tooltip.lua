RULESET = "";

local function getRuleset()
	RULESET = User.getRulesetName();

	if RULESET == "PFRPG" then
		RULESET = "3.5E"
	end
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
	for index,sNodeName in ipairs(tNodeOrder.node) do
		local sLabel = tNodeOrder.name[index];
		local sNode = DB.getValue(node, sNodeName, "");

		if sNode ~= "" then
			sTooltipText = sTooltipText .. sLabel .. ": " .. sNode .. "\n";
		end
	end
	
	return sTooltipText;
end

function CleanupTooltipData(sTooltipText)
	-- Add linebreaks
	sTooltipText = sTooltipText:gsub("</p>", "\n");
	sTooltipText = sTooltipText:gsub("Description", "\n%1");

	-- Delete all formatting tags
	sTooltipText = sTooltipText:gsub("%b<>", "");
	
	-- Delete ending linebreaks
	sTooltipText = sTooltipText:gsub("\n*$", "");

	-- Specific cleanup for rulesets
	if RULESET == "5E" then
		sTooltipText = sTooltipText:gsub("Ritual: 0", "Ritual: No");
		sTooltipText = sTooltipText:gsub("Ritual: 1", "Ritual: Yes");
	elseif RULESET == "SFRPG" then
		sTooltipText = sTooltipText:gsub("Requires RP: 0", "Requires RP: No");
		sTooltipText = sTooltipText:gsub("Requires RP: 1", "Requires RP: Yes");
	end
	
	return sTooltipText;
end
