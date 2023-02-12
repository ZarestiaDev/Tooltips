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

function updateTooltip(shortcut, bShortcut)
	local node = window.getDatabaseNode();
	--local sNodeType = node.getParent().getName();
	local sNodeType = DB.getName(DB.getParent(node));
	
	local sTooltipText = TooltipManager.CreateTooltipText(node, DataTooltip[TooltipManager.RULESET][sNodeType]);

	if bShortcut then
		self.setTooltipText("");
		shortcut.setTooltipText(sTooltipText);
	else
		self.setTooltipText(sTooltipText);
		shortcut.setTooltipText("");
	end
end

function stateChanged()
	local bShortcut;
	local shortcut;

	if OptionsManager.isOption("TSOS", "on") then
		bShortcut = true;
	else
		bShortcut = false;
	end

	if window.shortcut then
		shortcut = window.shortcut;
	elseif window.parentcontrol.window.shortcut then
		shortcut = window.parentcontrol.window.shortcut;
	end

	updateTooltip(shortcut, bShortcut);
end
