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

		if sNode ~= "" then
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
