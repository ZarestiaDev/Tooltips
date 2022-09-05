function onInit()
	if super and super.onInit then
		super.onInit();
	end

	DB.addHandler(DB.getPath(window.getDatabaseNode()), "onChildUpdate", updateTooltip);

	updateTooltip();
end

function onClose()
	if super and super.onClose then
		super.onClose();
	end

	DB.addHandler(DB.getPath(window.getDatabaseNode()), "onChildUpdate", updateTooltip);
end

function updateTooltip()
	local node = window.getDatabaseNode();
	local sNodeType = node.getParent().getName();
	
	local sTooltipText = TooltipManager.CreateTooltipText(node, DataTooltip[TooltipManager.RULESET][sNodeType]);
	self.setTooltipText(sTooltipText);
end
