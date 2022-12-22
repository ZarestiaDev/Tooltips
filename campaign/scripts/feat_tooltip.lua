local aFeats = {};
local bParsed = false;

local nodeClick = nil;

function getLoadedModules()
	local tLoadedModules = {};
	local tAllModules = Module.getModules();

	for _,sModuleName in ipairs(tAllModules) do
		local tModuleData = Module.getModuleInfo(sModuleName);
		if tModuleData.loaded then
			tLoadedModules[#tLoadedModules+1] = tModuleData.name;
		end
	end

	return tLoadedModules;
end

function onChar(nKeyCode)
	bParsed = false;
end

function parseFeats()
    aFeats = {};

    local aClauses, aClauseStats = StringManager.split(getValue(), ",", true);

    for i = 1, #aClauses do
        local sName = aClauses[i];
		-- Cleanup potential brackets
		sName = sName:gsub("%s?%s?%b()", "");
		local sDesc, nodeFeat = parseDesc(sName);
        table.insert(aFeats, {nStart = aClauseStats[i].startpos, nEnd = aClauseStats[i].endpos, sName = sName, sDesc = sDesc, node = nodeFeat })
    end

	bParsed = true;
end

function parseDesc(sFeat)
	local tModules = getLoadedModules();
	
	for _,sModule in pairs(tModules) do
		local nodeFeatModule = DB.findNode("reference.feats" .. "@" .. sModule);
		if not nodeFeatModule then
			return;
		end
		
		for _,nodeFeat in pairs(nodeFeatModule.getChildren()) do
			local sModuleFeat = DB.getValue(nodeFeat, "name", "");
			if sModuleFeat == "" then
				return;
			end
			
			if sModuleFeat == sFeat then
				local sSummary = DB.getValue(nodeFeat, "summary", "");
				local sBenefit = DB.getValue(nodeFeat, "benefit", "");
				local sSpecial = DB.getValue(nodeFeat, "special", "");

				return joinFeatDesc(sSummary, sBenefit, sSpecial), nodeFeat;
			end
		end
	end
end

function joinFeatDesc(sSummary, sBenefit, sSpecial)
	local sFeatDesc = "";

	if sSummary ~= "" then
		sFeatDesc = sFeatDesc .. "Summary\n" .. sSummary;
	end
	if sBenefit ~= "" then
		sFeatDesc = sFeatDesc .. "\n\nBenefit" .. sBenefit;
	end
	if sSpecial ~= "" then
		sFeatDesc = sFeatDesc .. "\nSpecial" .. sSpecial;
	end

	sFeatDesc = TooltipManager.generalCleanupText(sFeatDesc);

	return sFeatDesc;
end

function onHover(oncontrol)
	-- Reset selection when the cursor leaves the control
	if not oncontrol then
		-- Clear any selections
		setSelectionPosition(0);
		nodeClick = nil;
	end
end

function onHoverUpdate(x, y)
	if not bParsed then
		parseFeats();
	end

	local nMouseIndex = getIndexAt(x, y);
	
	for i = 1, #aFeats, 1 do
		if aFeats[i].nStart <= nMouseIndex and aFeats[i].nEnd > nMouseIndex then
		  setCursorPosition(aFeats[i].nStart);
		  setSelectionPosition(aFeats[i].nEnd);

		  nodeClick = aFeats[i].node;
		  setHoverCursor("hand");
		  
		  setTooltipText(aFeats[i].sDesc);
		  
		  return;
		end
	end
	
	-- Reset the cursor and tooltip
	nodeClick = nil;
	setHoverCursor("arrow");
	setTooltipText("");
end

function onDoubleClick(x, y)
	if nodeClick then
		Interface.openWindow("referencefeat", nodeClick)
	end

	return true;
end

-- On mouse click, set focus, set cursor position and clear selection
function onClickRelease(button, x, y)
	setFocus();
	
	local n = getIndexAt(x, y);
	setSelectionPosition(n);
	setCursorPosition(n);
	
	return true;
end
