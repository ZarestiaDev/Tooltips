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
		
		sTooltipText = sTooltipText .. sLabel .. ": " .. sNode .. "\n";
	end
	
	return sTooltipText;
end

function CleanupTooltipData(sTooltipText)
	-- Cleanup formatting in description
	sTooltipText = sTooltipText:gsub("</?b>", "");
	sTooltipText = sTooltipText:gsub("</?i>", "");
	sTooltipText = sTooltipText:gsub("</?u>", "");
	sTooltipText = sTooltipText:gsub("<p>", "");
	
	-- Add linebreaks and delete ending ones
	sTooltipText = sTooltipText:gsub("</p>", "\n");
	sTooltipText = sTooltipText:gsub("\n*$", "");
	
	return sTooltipText;
end
