local _, ns = ...
local B, C, L, DB = unpack(ns)

tinsert(C.defaultThemes, function()
	if not NDuiDB["Skins"]["BlizzardSkins"] then return end

	local navFrame = EquipmentFlyoutFrame.NavigationFrame
	EquipmentFlyoutFrameButtons.bg1:SetAlpha(0)
	EquipmentFlyoutFrameButtons:DisableDrawLayer("ARTWORK")
	navFrame:SetWidth(204)
	navFrame:SetPoint("TOPLEFT", EquipmentFlyoutFrameButtons, "BOTTOMLEFT", 1, 0)

	hooksecurefunc("EquipmentFlyout_CreateButton", function()
		local button = EquipmentFlyoutFrame.buttons[#EquipmentFlyoutFrame.buttons]

		button.icon:SetTexCoord(unpack(DB.TexCoord))
		button:SetNormalTexture("")
		button:SetPushedTexture("")
		button:GetHighlightTexture():SetColorTexture(1, 1, 1, .25)
		button.bg = B.CreateBDFrame(button)
		B.ReskinIconBorder(button.IconBorder)

		if not button.Eye then
			button.Eye = button:CreateTexture()
			button.Eye:SetAtlas("Nzoth-inventory-icon")
			button.Eye:SetInside()
			button.Eye:Hide()
		end
	end)

	local function UpdateCorruption(button, location)
		local _, _, bags, voidStorage, slot, bag = EquipmentManager_UnpackLocation(location)
		if voidStorage then
			button.Eye:Hide()
			return
		end

		local itemLink
		if bags then
			itemLink = GetContainerItemLink(bag, slot)
		else
			itemLink = GetInventoryItemLink("player", slot)
		end
		button.Eye:SetShown(itemLink and IsCorruptedItem(itemLink))
	end

	hooksecurefunc("EquipmentFlyout_DisplayButton", function(button)
		local location = button.location
		local border = button.IconBorder
		if not location or not border then return end

		border:SetShown(location < EQUIPMENTFLYOUT_FIRST_SPECIAL_LOCATION)
		UpdateCorruption(button, location)
	end)

	local function reskinButtonFrame()
		local frame = EquipmentFlyoutFrame.buttonFrame
		if not frame.bg then
			frame.bg = B.SetBD(EquipmentFlyoutFrame.buttonFrame)
		end
		frame:SetWidth(frame:GetWidth()+3)
	end
	hooksecurefunc("EquipmentFlyout_UpdateItems", reskinButtonFrame)

	local navigationFrame = EquipmentFlyoutFrame.NavigationFrame
	B.SetBD(navigationFrame)
	navigationFrame:SetPoint("TOPLEFT", EquipmentFlyoutFrameButtons, "BOTTOMLEFT", 0, -3)
	navigationFrame:SetPoint("TOPRIGHT", EquipmentFlyoutFrameButtons, "BOTTOMRIGHT", 0, -3)
	B.ReskinArrow(navigationFrame.PrevButton, "left")
	B.ReskinArrow(navigationFrame.NextButton, "right")
end)