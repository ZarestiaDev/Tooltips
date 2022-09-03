function onInit()
	if super and super.onInit then
		super.onInit();
	end

	local node = window.getDatabaseNode();
	local sNodeType = node.getParent().getName();
	
	local sTooltipText = TooltipManager.CreateTooltipText(node, DataTooltip[sNodeType][TooltipManager.RULESET]);
	self.setTooltipText(sTooltipText);
end
