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
	-- first search if records are available inside the campaign itself
	local tFeats = DB.findNode("feat").getChildren();

	for _,nodeFeat in pairs(tFeats) do
		if sFeat == DB.getValue(nodeFeat, "name", "") then
			return joinFeatDesc(nodeFeat), nodeFeat;
		end
	end

	-- otherwise search in loaded modules
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
				return joinFeatDesc(nodeFeat), nodeFeat;
			end
		end
	end
end

function joinFeatDesc(nodeFeat)
	local sSummary = DB.getValue(nodeFeat, "summary", "");
	local sBenefit = DB.getValue(nodeFeat, "benefit", "");
	local sNormal = DB.getValue(nodeFeat, "normal", "");
	local sSpecial = DB.getValue(nodeFeat, "special", "");

	local sFeatDesc = "";

	if not (sSummary == "" or sSummary == "<p />") then
		sFeatDesc = sFeatDesc .. "Summary\n" .. sSummary;
	end
	if not (sBenefit == "" or sBenefit == "<p />") then
		sFeatDesc = sFeatDesc .. "\n\nBenefit" .. sBenefit;
	end
	if not (sNormal == "" or sNormal == "<p />") then
		sFeatDesc = sFeatDesc .. "\n\nNormal" .. sNormal;
	end
	if not (sSpecial == "" or sSpecial == "<p />") then
		sFeatDesc = sFeatDesc .. "\nSpecial" .. sSpecial;
	end

	sFeatDesc = TooltipManager.generalCleanupText(sFeatDesc);
	-- Special cleanup
	sFeatDesc = sFeatDesc:gsub("Summary\n\n", "Summary\n");
	sFeatDesc = sFeatDesc:gsub("\n\n\n", "\n\n");

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
		local sWindow = "referencefeat";
		if TooltipManager.RULESET == "SFRPG" then
			sWindow = "feat";
		end
		Interface.openWindow(sWindow, nodeClick);
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
