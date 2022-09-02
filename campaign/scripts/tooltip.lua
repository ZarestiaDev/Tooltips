function onInit()
	if super and super.onInit then
		super.onInit();
	end
	
	local sRuleset = User.getRulesetName();
	local node = window.getDatabaseNode();
	local sNodeType = node.getParent().getName();
	
	local sTooltipText = TooltipManager.CreateTooltipText(node, DataTooltip.ORDER[sRuleset][sNodeType]);
	self.setTooltipText(sTooltipText);
end
