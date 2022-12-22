local aFeats = {};

function onInit()
    parseFeats();

end

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

function parseFeats()
    aFeats = {};

    local aClauses, aClauseStats = StringManager.split(getValue(), ",", true);

    for i = 1, #aClauses do
        local sName = aClauses[i];
		-- Cleanup potential brackets
		sName = sName:gsub("%s?%b()", "");
		local sDesc = parseDesc(sName);
		if sDesc then
			sDesc = TooltipManager.generalCleanupText(sDesc);
		end
        table.insert(aFeats, {nStart = aClauseStats[i].startpos, nEnd = aClauseStats[i].endpos, sName = sName, sDesc = sDesc })
    end
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

				return joinFeatDesc(sSummary, sBenefit, sSpecial);
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

	return sFeatDesc;
end

function onHover(oncontrol)
	-- Reset selection when the cursor leaves the control
	if not oncontrol then
		-- Clear any selections
		setSelectionPosition(0);
	end
end

function onHoverUpdate(x, y)
	-- Compute the locations of the relevant phrases, and the mouse
	local nMouseIndex = getIndexAt(x, y);
	
	for i = 1, #aFeats, 1 do
		if aFeats[i].nStart <= nMouseIndex and aFeats[i].nEnd > nMouseIndex then
		  setCursorPosition(aFeats[i].nStart);
		  setSelectionPosition(aFeats[i].nEnd);

		  setHoverCursor("hand");
		  
		  setTooltipText(aFeats[i].sDesc);
		  
		  return;
		end
	end	
	
	-- Reset the cursor and tooltip
	setHoverCursor("arrow");
	setTooltipText("");
end