function onInit()
	if super and super.onInit then
		super.onInit();
	end

	local node = window.getDatabaseNode();
	local sNodeType = node.getParent().getName();
	Debug.console(sNodeType);
	
	--local sTooltipText = TooltipManager.CreateTooltipText(node, DataTooltip[TooltipManager.RULESET][sNodeType]);
	--self.setTooltipText(sTooltipText);
end
