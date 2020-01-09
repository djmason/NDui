local _, ns = ...
local B, C, L, DB = unpack(ns)

tinsert(C.themes["AuroraClassic"], function()
	hooksecurefunc("LFGDungeonListButton_SetDungeon", function(button)
		if not button.expandOrCollapseButton.styled then
			B.ReskinCheck(button.enableButton)
			B.ReskinExpandOrCollapse(button.expandOrCollapseButton)

			button.expandOrCollapseButton.styled = true
		end

		button.enableButton:GetCheckedTexture():SetDesaturated(true)
	end)

	B.StripTextures(LFDParentFrame)
	LFDQueueFrameBackground:Hide()
	B.CreateBD(LFDRoleCheckPopup)
	B.CreateSD(LFDRoleCheckPopup)
	LFDRoleCheckPopup.Border:Hide()
	B.Reskin(LFDRoleCheckPopupAcceptButton)
	B.Reskin(LFDRoleCheckPopupDeclineButton)
	B.Reskin(LFDQueueFrameRandomScrollFrameChildFrame.bonusRepFrame.ChooseButton)
	B.ReskinScroll(LFDQueueFrameSpecificListScrollFrameScrollBar)
	B.StripTextures(LFDQueueFrameRandomScrollFrameScrollBar, 0)
	B.ReskinScroll(LFDQueueFrameRandomScrollFrameScrollBar)
	B.ReskinDropDown(LFDQueueFrameTypeDropDown)
	B.Reskin(LFDQueueFrameFindGroupButton)
	B.Reskin(LFDQueueFramePartyBackfillBackfillButton)
	B.Reskin(LFDQueueFramePartyBackfillNoBackfillButton)
	B.Reskin(LFDQueueFrameNoLFDWhileLFRLeaveQueueButton)

	LFDQueueFrameRandomScrollFrame:SetWidth(LFDQueueFrameRandomScrollFrame:GetWidth()+1)
	LFDQueueFrameSpecificListScrollFrameScrollBarScrollDownButton:SetPoint("TOP", LFDQueueFrameSpecificListScrollFrameScrollBar, "BOTTOM", 0, 2)
	LFDQueueFrameRandomScrollFrameScrollBarScrollDownButton:SetPoint("TOP", LFDQueueFrameRandomScrollFrameScrollBar, "BOTTOM", 0, 2)
end)