-- Colors --
vcbMainColor = CreateColorFromHexString("FFF0E68C")
vcbHighColor = CreateColorFromHexString("FF9ACD32")
vcbNoMainColor = CreateColorFromHexString("00F0E68C")
vcbNoHighColor = CreateColorFromHexString("009ACD32")
-- function for showing the menu --
function vcbShowMenu()
	if not vcbOptions00:IsShown() then
		vcbOptions00:Show()
	else
		vcbOptions00:Hide()
	end
end
-- Slash Command --
SLASH_VOODOOCASTINGBAR1, SLASH_VOODOOCASTINGBAR2 = '/vcb', '/voodoocastingbar'
function SlashCmdList.VOODOOCASTINGBAR(msg, editBox)
	vcbShowMenu()
end
-- functions for the buttons and popouts --
-- on enter --
function vcbEnteringMenus(self)
	GameTooltip_ClearStatusBars(GameTooltip)
	GameTooltip:SetOwner(self, "ANCHOR_NONE")
	GameTooltip:ClearAllPoints()
	GameTooltip:SetPoint("RIGHT", self, "LEFT", 0, 0)
end
-- on leave --
function vcbLeavingMenus()
	GameTooltip:Hide()
end
-- click on Pop Out --
function vcbClickPopOut(var1, var2)
	var1:SetScript("OnClick", function(self, button, down)
		if button == "LeftButton" and down == false then
			if not var2:IsShown() then
				var2:Show()
				PlaySound(855, "Master")
			else
				var2:Hide()
			end
		end
	end)
end
