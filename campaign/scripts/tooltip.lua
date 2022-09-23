function onInit()
	if super and super.onInit then
		super.onInit();
	end

	OptionsManager.registerCallback("TSOS", stateChanged);
	DB.addHandler(DB.getPath(window.getDatabaseNode()), "onChildUpdate", stateChanged);

	stateChanged();
end

function onClose()
	if super and super.onClose then
		super.onClose();
	end

	OptionsManager.unregisterCallback("TSOS", stateChanged);
	DB.addHandler(DB.getPath(window.getDatabaseNode()), "onChildUpdate", stateChanged);
end

function updateTooltip(bShortcut)
	local node = window.getDatabaseNode();
	local sNodeType = node.getParent().getName();
	
	local sTooltipText = TooltipManager.CreateTooltipText(node, DataTooltip[TooltipManager.RULESET][sNodeType]);

	if bShortcut then
		self.setTooltipText("");
		if window.shortcut then
			window.shortcut.setTooltipText(sTooltipText);
		elseif window.parentcontrol.window.shortcut then
			window.parentcontrol.window.shortcut.setTooltipText(sTooltipText);
		end
	else
		self.setTooltipText(sTooltipText);
		if window.shortcut then
			window.shortcut.setTooltipText("");
		elseif window.parentcontrol.window.shortcut then
			window.parentcontrol.window.shortcut.setTooltipText("");
		end
	end
end

function stateChanged()
	local bShortcut;

	if OptionsManager.isOption("TSOS", "on") then
		bShortcut = true;
	else
		bShortcut = false;
	end

	updateTooltip(bShortcut);
end