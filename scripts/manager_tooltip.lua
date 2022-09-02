function CreateTooltipText(node, tNodeOrder)
	local sTooltipText = "";
	
	sTooltipText = GetTooltipData(node, tNodeOrder, sTooltipText);
	sTooltipText = CleanupTooltipData(sTooltipText);
	
	return sTooltipText;
end

function GetTooltipData(node, tNodeOrder, sTooltipText)
	for _,sNodeName in ipairs(tNodeOrder) do
		local sLabel = "";
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
