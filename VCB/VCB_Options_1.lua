-- taking care of the panel --
vcbOptions1:ClearAllPoints()
vcbOptions1:SetPoint("TOPLEFT", vcbOptions00, "TOPLEFT", 0, 0)
vcbOptions1.BGtexture:SetAlpha(1)
vcbOptions1.CenterTxt:Hide()
vcbOptions1.BottomTxt:Hide()
vcbOptions1.BottomLeftTxt:Hide()
vcbOptions1.TopTxt:SetText("Player's Castbar Options!")
vcbOptions1Box1.TitleTxt:SetText("Spell's Icon & Spell's Name")
vcbOptions1Box2:SetPoint("TOP", vcbOptions1Box1, "BOTTOM", 0, 0)
vcbOptions1Box2.TitleTxt:SetText("Current Cast Time")
vcbOptions1Box3:SetPoint("TOP", vcbOptions1Box2, "BOTTOM", 0, 0)
vcbOptions1Box3.TitleTxt:SetText("Current & Total Cast Time")
vcbOptions1Box4:SetPoint("TOP", vcbOptions1Box3, "BOTTOM", 0, 0)
vcbOptions1Box4.TitleTxt:SetText("Total Cast Time")
vcbOptions1Box5:SetPoint("TOP", vcbOptions1Box4, "BOTTOM", 0, 0)
vcbOptions1Box5.TitleTxt:SetText("Latency Bar")
-- Checking the Saved Variables --
local function CheckSavedVariables()
	vcbOptions1Box1PopOut1:SetText(VCBcPlayer["Icon"])
	vcbOptions1Box1PopOut2:SetText(VCBcPlayer["NameText"])
	vcbOptions1Box2PopOut1:SetText(VCBcPlayer["CurrentTimeText"]["Position"])
	vcbOptions1Box2PopOut2:SetText(VCBcPlayer["CurrentTimeText"]["Direction"])
	vcbOptions1Box2PopOut3:SetText(VCBcPlayer["CurrentTimeText"]["Sec"])
	vcbOptions1Box3PopOut1:SetText(VCBcPlayer["BothTimeText"]["Position"])
	vcbOptions1Box3PopOut2:SetText(VCBcPlayer["BothTimeText"]["Direction"])
	vcbOptions1Box3PopOut3:SetText(VCBcPlayer["BothTimeText"]["Sec"])
	vcbOptions1Box4PopOut1:SetText(VCBcPlayer["TotalTimeText"]["Position"])
	vcbOptions1Box4PopOut2:SetText(VCBcPlayer["TotalTimeText"]["Sec"])
	vcbOptions1Box5PopOut1:SetText(VCBcPlayer["LagBar"])
end
-- Box 1 Spell's Icon & Spell's Name --
-- pop out 1 Spell's Icon --
-- enter --
vcbOptions1Box1PopOut1:HookScript("OnEnter", function(self)
	vcbEnteringMenus(self)
	GameTooltip:SetText(vcbMainColor:WrapTextInColorCode(C_AddOns.GetAddOnMetadata("VCB", "Title")).."|nWhere do you want the|nSpell's Icon to be shown?") 
end)
-- leave --
vcbOptions1Box1PopOut1:HookScript("OnLeave", vcbLeavingMenus)
-- drop down --
vcbClickPopOut(vcbOptions1Box1PopOut1, vcbOptions1Box1PopOut1Choice0)
-- sort & clicking --
for i = 1, 3, 1 do
	local k = i - 1
	_G["vcbOptions1Box1PopOut1Choice"..i]:SetParent(vcbOptions1Box1PopOut1Choice0)
	_G["vcbOptions1Box1PopOut1Choice"..i]:SetPoint("TOP", _G["vcbOptions1Box1PopOut1Choice"..k], "BOTTOM", 0, 0)
	_G["vcbOptions1Box1PopOut1Choice"..k]:HookScript("OnClick", function(self, button, down)
		if button == "LeftButton" and down == false then
			VCBcPlayer["Icon"] = self.Text:GetText()
			vcbOptions1Box1PopOut1.Text:SetText(self:GetText())
			vcbOptions1Box1PopOut1Choice0:Hide()
		end
	end)
end
vcbOptions1Box1PopOut1Choice3:HookScript("OnClick", function(self, button, down)
	if button == "LeftButton" and down == false then
		VCBcPlayer["Icon"] = self.Text:GetText()
		vcbOptions1Box1PopOut1.Text:SetText(self:GetText())
		vcbOptions1Box1PopOut1Choice0:Hide()
	end
end)
-- naming --
vcbOptions1Box1PopOut1Choice0.Text:SetText("Left")
vcbOptions1Box1PopOut1Choice1.Text:SetText("Right")
vcbOptions1Box1PopOut1Choice2.Text:SetText("Left and Right")
vcbOptions1Box1PopOut1Choice3.Text:SetText("Hide")
-- pop out 2 Spell's Name --
-- enter --
vcbOptions1Box1PopOut2:HookScript("OnEnter", function(self)
	vcbEnteringMenus(self)
	GameTooltip:SetText(vcbMainColor:WrapTextInColorCode(C_AddOns.GetAddOnMetadata("VCB", "Title")).."|nWhere do you want the|nSpell's Name to be shown?")
end)
-- leave --
vcbOptions1Box1PopOut2:HookScript("OnLeave", vcbLeavingMenus)
-- drop down --
vcbClickPopOut(vcbOptions1Box1PopOut2, vcbOptions1Box1PopOut2Choice0)
-- sort & clicking --
for i = 1, 9, 1 do
	local k = i - 1
	_G["vcbOptions1Box1PopOut2Choice"..i]:SetParent(vcbOptions1Box1PopOut2Choice0)
	_G["vcbOptions1Box1PopOut2Choice"..i]:SetPoint("TOP", _G["vcbOptions1Box1PopOut2Choice"..k], "BOTTOM", 0, 0)
	_G["vcbOptions1Box1PopOut2Choice"..k]:HookScript("OnClick", function(self, button, down)
		if button == "LeftButton" and down == false then
			VCBcPlayer["NameText"] = self.Text:GetText()
			vcbOptions1Box1PopOut2.Text:SetText(self:GetText())
			vcbOptions1Box1PopOut2Choice0:Hide()
		end
	end)
end
vcbOptions1Box1PopOut2Choice9:HookScript("OnClick", function(self, button, down)
	if button == "LeftButton" and down == false then
		VCBcPlayer["NameText"] = self.Text:GetText()
		vcbOptions1Box1PopOut2.Text:SetText(self:GetText())
		vcbOptions1Box1PopOut2Choice0:Hide()
	end
end)
-- naming --
vcbOptions1Box1PopOut2Choice0.Text:SetText("Top Left")
vcbOptions1Box1PopOut2Choice1.Text:SetText("Left")
vcbOptions1Box1PopOut2Choice2.Text:SetText("Bottom Left")
vcbOptions1Box1PopOut2Choice3.Text:SetText("Top")
vcbOptions1Box1PopOut2Choice4.Text:SetText("Center")
vcbOptions1Box1PopOut2Choice5.Text:SetText("Bottom")
vcbOptions1Box1PopOut2Choice6.Text:SetText("Top Right")
vcbOptions1Box1PopOut2Choice7.Text:SetText("Right")
vcbOptions1Box1PopOut2Choice8.Text:SetText("Bottom Right")
vcbOptions1Box1PopOut2Choice9.Text:SetText("Hide")
-- Box 2 Current Cast Time --
-- pop out 1 Current Cast Time --
-- enter --
vcbOptions1Box2PopOut1:HookScript("OnEnter", function(self)
	vcbEnteringMenus(self)
	GameTooltip:SetText(vcbMainColor:WrapTextInColorCode(C_AddOns.GetAddOnMetadata("VCB", "Title")).."|nWhere do you want the|nCurrent Cast Time to be shown?")
end)
-- leave --
vcbOptions1Box2PopOut1:HookScript("OnLeave", vcbLeavingMenus)
-- drop down --
vcbClickPopOut(vcbOptions1Box2PopOut1, vcbOptions1Box2PopOut1Choice0)
-- sort & clicking --
for i = 1, 9, 1 do
	local k = i - 1
	_G["vcbOptions1Box2PopOut1Choice"..i]:SetParent(vcbOptions1Box2PopOut1Choice0)
	_G["vcbOptions1Box2PopOut1Choice"..i]:SetPoint("TOP", _G["vcbOptions1Box2PopOut1Choice"..k], "BOTTOM", 0, 0)
	_G["vcbOptions1Box2PopOut1Choice"..k]:HookScript("OnClick", function(self, button, down)
		if button == "LeftButton" and down == false then
			VCBcPlayer["CurrentTimeText"]["Position"] = self.Text:GetText()
			vcbOptions1Box2PopOut1.Text:SetText(self:GetText())
			vcbOptions1Box2PopOut1Choice0:Hide()
		end
	end)
end
vcbOptions1Box2PopOut1Choice9:HookScript("OnClick", function(self, button, down)
	if button == "LeftButton" and down == false then
		VCBcPlayer["CurrentTimeText"]["Position"] = self.Text:GetText()
		vcbOptions1Box2PopOut1.Text:SetText(self:GetText())
		vcbOptions1Box2PopOut1Choice0:Hide()
	end
end)
-- naming --
vcbOptions1Box2PopOut1Choice0.Text:SetText("Top Left")
vcbOptions1Box2PopOut1Choice1.Text:SetText("Left")
vcbOptions1Box2PopOut1Choice2.Text:SetText("Bottom Left")
vcbOptions1Box2PopOut1Choice3.Text:SetText("Top")
vcbOptions1Box2PopOut1Choice4.Text:SetText("Center")
vcbOptions1Box2PopOut1Choice5.Text:SetText("Bottom")
vcbOptions1Box2PopOut1Choice6.Text:SetText("Top Right")
vcbOptions1Box2PopOut1Choice7.Text:SetText("Right")
vcbOptions1Box2PopOut1Choice8.Text:SetText("Bottom Right")
vcbOptions1Box2PopOut1Choice9.Text:SetText("Hide")
-- pop out 2 Current Cast Time Direction --
-- enter --
vcbOptions1Box2PopOut2:HookScript("OnEnter", function(self)
	vcbEnteringMenus(self)
	GameTooltip:SetText(vcbMainColor:WrapTextInColorCode(C_AddOns.GetAddOnMetadata("VCB", "Title")).."|nHow do you want the direction of time to be?|nBoth means that the timer,|nwhile casting would be Ascending, and|nwhile channeling would be Descending!")
end)
-- leave --
vcbOptions1Box2PopOut2:HookScript("OnLeave", vcbLeavingMenus)
-- drop down --
vcbClickPopOut(vcbOptions1Box2PopOut2, vcbOptions1Box2PopOut2Choice0)
-- sort and clicking --
for i = 1, 2, 1 do
	local k = i - 1
	_G["vcbOptions1Box2PopOut2Choice"..i]:SetParent(vcbOptions1Box2PopOut2Choice0)
	_G["vcbOptions1Box2PopOut2Choice"..i]:SetPoint("TOP", _G["vcbOptions1Box2PopOut2Choice"..k], "BOTTOM", 0, 0)
	_G["vcbOptions1Box2PopOut2Choice"..k]:HookScript("OnClick", function(self, button, down)
		if button == "LeftButton" and down == false then
			VCBcPlayer["CurrentTimeText"]["Direction"] = self.Text:GetText()
			vcbOptions1Box2PopOut2.Text:SetText(self:GetText())
			vcbOptions1Box2PopOut2Choice0:Hide()
		end
	end)
end
vcbOptions1Box2PopOut2Choice2:HookScript("OnClick", function(self, button, down)
	if button == "LeftButton" and down == false then
		VCBcPlayer["CurrentTimeText"]["Direction"] = self.Text:GetText()
		vcbOptions1Box2PopOut2.Text:SetText(self:GetText())
		vcbOptions1Box2PopOut2Choice0:Hide()
	end
end)
-- naming --
vcbOptions1Box2PopOut2Choice0.Text:SetText("Ascending")
vcbOptions1Box2PopOut2Choice1.Text:SetText("Descending")
vcbOptions1Box2PopOut2Choice2.Text:SetText("Both")
-- pop out 3 Current Cast Time Sec? --
-- enter --
vcbOptions1Box2PopOut3:HookScript("OnEnter", function(self)
	vcbEnteringMenus(self)
	GameTooltip:SetText(vcbMainColor:WrapTextInColorCode(C_AddOns.GetAddOnMetadata("VCB", "Title")).."|nDo you want the|nWord 'Sec' to be shown?")
end)
-- leave --
vcbOptions1Box2PopOut3:HookScript("OnLeave", vcbLeavingMenus)
-- drop down --
vcbClickPopOut(vcbOptions1Box2PopOut3, vcbOptions1Box2PopOut3Choice0)
-- sort & clicking --
vcbOptions1Box2PopOut3Choice1:SetParent(vcbOptions1Box2PopOut3Choice0)
vcbOptions1Box2PopOut3Choice1:SetPoint("TOP",vcbOptions1Box2PopOut3Choice0, "BOTTOM", 0, 0)
vcbOptions1Box2PopOut3Choice0:HookScript("OnClick", function(self, button, down)
	if button == "LeftButton" and down == false then
		VCBcPlayer["CurrentTimeText"]["Sec"] = self.Text:GetText()
		vcbOptions1Box2PopOut3.Text:SetText(self:GetText())
		vcbOptions1Box2PopOut3Choice0:Hide()
	end
end)
vcbOptions1Box2PopOut3Choice1:HookScript("OnClick", function(self, button, down)
	if button == "LeftButton" and down == false then
		VCBcPlayer["CurrentTimeText"]["Sec"] = self.Text:GetText()
		vcbOptions1Box2PopOut3.Text:SetText(self:GetText())
		vcbOptions1Box2PopOut3Choice0:Hide()
	end
end)
-- naming --
vcbOptions1Box2PopOut3Choice0.Text:SetText("Show")
vcbOptions1Box2PopOut3Choice1.Text:SetText("Hide")
-- Box 3 Current & Total Cast Time --
-- pop out 1 Current & Total Cast Time --
-- enter --
vcbOptions1Box3PopOut1:HookScript("OnEnter", function(self)
	vcbEnteringMenus(self)
	GameTooltip:SetText(vcbMainColor:WrapTextInColorCode(C_AddOns.GetAddOnMetadata("VCB", "Title")).."|nWhere do you want the|nCurrent & Total Cast Time to be shown?")
end)
-- leave --
vcbOptions1Box3PopOut1:HookScript("OnLeave", vcbLeavingMenus)
-- drop down --
vcbClickPopOut(vcbOptions1Box3PopOut1, vcbOptions1Box3PopOut1Choice0)
-- sort & clicking --
for i = 1, 9, 1 do
	local k = i - 1
	_G["vcbOptions1Box3PopOut1Choice"..i]:SetParent(vcbOptions1Box3PopOut1Choice0)
	_G["vcbOptions1Box3PopOut1Choice"..i]:SetPoint("TOP", _G["vcbOptions1Box3PopOut1Choice"..k], "BOTTOM", 0, 0)
	_G["vcbOptions1Box3PopOut1Choice"..k]:HookScript("OnClick", function(self, button, down)
		if button == "LeftButton" and down == false then
			VCBcPlayer["BothTimeText"]["Position"] = self.Text:GetText()
			vcbOptions1Box3PopOut1.Text:SetText(self:GetText())
			vcbOptions1Box3PopOut1Choice0:Hide()
		end
	end)
end
vcbOptions1Box3PopOut1Choice9:HookScript("OnClick", function(self, button, down)
	if button == "LeftButton" and down == false then
		VCBcPlayer["BothTimeText"]["Position"] = self.Text:GetText()
		vcbOptions1Box3PopOut1.Text:SetText(self:GetText())
		vcbOptions1Box3PopOut1Choice0:Hide()
	end
end)
-- naming --
vcbOptions1Box3PopOut1Choice0.Text:SetText("Top Left")
vcbOptions1Box3PopOut1Choice1.Text:SetText("Left")
vcbOptions1Box3PopOut1Choice2.Text:SetText("Bottom Left")
vcbOptions1Box3PopOut1Choice3.Text:SetText("Top")
vcbOptions1Box3PopOut1Choice4.Text:SetText("Center")
vcbOptions1Box3PopOut1Choice5.Text:SetText("Bottom")
vcbOptions1Box3PopOut1Choice6.Text:SetText("Top Right")
vcbOptions1Box3PopOut1Choice7.Text:SetText("Right")
vcbOptions1Box3PopOut1Choice8.Text:SetText("Bottom Right")
vcbOptions1Box3PopOut1Choice9.Text:SetText("Hide")
-- pop out 2 Current & Total Cast Time Direction --
-- enter --
vcbOptions1Box3PopOut2:HookScript("OnEnter", function(self)
	vcbEnteringMenus(self)
	GameTooltip:SetText(vcbMainColor:WrapTextInColorCode(C_AddOns.GetAddOnMetadata("VCB", "Title")).."|nHow do you want the direction of time to be?|nBoth means that the timer,|nwhile casting would be Ascending, and|nwhile channeling would be Descending!")
end)
-- leave --
vcbOptions1Box3PopOut2:HookScript("OnLeave", vcbLeavingMenus)
-- drop down --
vcbClickPopOut(vcbOptions1Box3PopOut2, vcbOptions1Box3PopOut2Choice0)
-- sort & clicking --
for i = 1, 2, 1 do
	local k = i - 1
	_G["vcbOptions1Box3PopOut2Choice"..i]:SetParent(vcbOptions1Box3PopOut2Choice0)
	_G["vcbOptions1Box3PopOut2Choice"..i]:SetPoint("TOP", _G["vcbOptions1Box3PopOut2Choice"..k], "BOTTOM", 0, 0)
	_G["vcbOptions1Box3PopOut2Choice"..k]:HookScript("OnClick", function(self, button, down)
		if button == "LeftButton" and down == false then
			VCBcPlayer["BothTimeText"]["Direction"] = self.Text:GetText()
			vcbOptions1Box3PopOut2.Text:SetText(self:GetText())
			vcbOptions1Box3PopOut2Choice0:Hide()
		end
	end)
end
vcbOptions1Box3PopOut2Choice2:HookScript("OnClick", function(self, button, down)
	if button == "LeftButton" and down == false then
		VCBcPlayer["BothTimeText"]["Direction"] = self.Text:GetText()
		vcbOptions1Box3PopOut2.Text:SetText(self:GetText())
		vcbOptions1Box3PopOut2Choice0:Hide()
	end
end)
-- naming --
vcbOptions1Box3PopOut2Choice0.Text:SetText("Ascending")
vcbOptions1Box3PopOut2Choice1.Text:SetText("Descending")
vcbOptions1Box3PopOut2Choice2.Text:SetText("Both")
-- pop out 3 Current & Total Cast Time Sec? --
-- enter --
vcbOptions1Box3PopOut3:HookScript("OnEnter", function(self)
	vcbEnteringMenus(self)
	GameTooltip:SetText(vcbMainColor:WrapTextInColorCode(C_AddOns.GetAddOnMetadata("VCB", "Title")).."|nDo you want the|nWord 'Sec' to be shown?")
end)
-- leave --
vcbOptions1Box3PopOut3:HookScript("OnLeave", vcbLeavingMenus)
-- drop down --
vcbClickPopOut(vcbOptions1Box3PopOut3, vcbOptions1Box3PopOut3Choice0)
-- sort & clicking --
vcbOptions1Box3PopOut3Choice1:SetParent(vcbOptions1Box3PopOut3Choice0)
vcbOptions1Box3PopOut3Choice1:SetPoint("TOP",vcbOptions1Box3PopOut3Choice0, "BOTTOM", 0, 0)
vcbOptions1Box3PopOut3Choice0:HookScript("OnClick", function(self, button, down)
	if button == "LeftButton" and down == false then
		VCBcPlayer["BothTimeText"]["Sec"] = self.Text:GetText()
		vcbOptions1Box3PopOut3.Text:SetText(self:GetText())
		vcbOptions1Box3PopOut3Choice0:Hide()
	end
end)
vcbOptions1Box3PopOut3Choice1:HookScript("OnClick", function(self, button, down)
	if button == "LeftButton" and down == false then
		VCBcPlayer["BothTimeText"]["Sec"] = self.Text:GetText()
		vcbOptions1Box3PopOut3.Text:SetText(self:GetText())
		vcbOptions1Box3PopOut3Choice0:Hide()
	end
end)
-- naming --
vcbOptions1Box3PopOut3Choice0.Text:SetText("Show")
vcbOptions1Box3PopOut3Choice1.Text:SetText("Hide")
-- Box 4 Total Cast Time --
-- pop out 1 Total Cast Time --
-- enter --
vcbOptions1Box4PopOut1:HookScript("OnEnter", function(self)
	vcbEnteringMenus(self)
	GameTooltip:SetText(vcbMainColor:WrapTextInColorCode(C_AddOns.GetAddOnMetadata("VCB", "Title")).."|nWhere do you want the|nTotal Cast Time to be shown?")
end)
-- leave --
vcbOptions1Box4PopOut1:HookScript("OnLeave", vcbLeavingMenus)
-- drop down --
vcbClickPopOut(vcbOptions1Box4PopOut1, vcbOptions1Box4PopOut1Choice0)
-- sort & clicking --
for i = 1, 9, 1 do
	local k = i - 1
	_G["vcbOptions1Box4PopOut1Choice"..i]:SetParent(vcbOptions1Box4PopOut1Choice0)
	_G["vcbOptions1Box4PopOut1Choice"..i]:SetPoint("TOP", _G["vcbOptions1Box4PopOut1Choice"..k], "BOTTOM", 0, 0)
	_G["vcbOptions1Box4PopOut1Choice"..k]:HookScript("OnClick", function(self, button, down)
		if button == "LeftButton" and down == false then
			VCBcPlayer["TotalTimeText"]["Position"] = self.Text:GetText()
			vcbOptions1Box4PopOut1.Text:SetText(self:GetText())
			vcbOptions1Box4PopOut1Choice0:Hide()
		end
	end)
end
vcbOptions1Box4PopOut1Choice9:HookScript("OnClick", function(self, button, down)
	if button == "LeftButton" and down == false then
		VCBcPlayer["TotalTimeText"]["Position"] = self.Text:GetText()
		vcbOptions1Box4PopOut1.Text:SetText(self:GetText())
		vcbOptions1Box4PopOut1Choice0:Hide()
	end
end)
-- naming --
vcbOptions1Box4PopOut1Choice0.Text:SetText("Top Left")
vcbOptions1Box4PopOut1Choice1.Text:SetText("Left")
vcbOptions1Box4PopOut1Choice2.Text:SetText("Bottom Left")
vcbOptions1Box4PopOut1Choice3.Text:SetText("Top")
vcbOptions1Box4PopOut1Choice4.Text:SetText("Center")
vcbOptions1Box4PopOut1Choice5.Text:SetText("Bottom")
vcbOptions1Box4PopOut1Choice6.Text:SetText("Top Right")
vcbOptions1Box4PopOut1Choice7.Text:SetText("Right")
vcbOptions1Box4PopOut1Choice8.Text:SetText("Bottom Right")
vcbOptions1Box4PopOut1Choice9.Text:SetText("Hide")
-- pop out 2 Total Cast Time Sec? --
-- enter --
vcbOptions1Box4PopOut2:HookScript("OnEnter", function(self)
	vcbEnteringMenus(self)
	GameTooltip:SetText(vcbMainColor:WrapTextInColorCode(C_AddOns.GetAddOnMetadata("VCB", "Title")).."|nDo you want the|nWord 'Sec' to be shown?")
end)
-- leave --
vcbOptions1Box4PopOut2:HookScript("OnLeave", vcbLeavingMenus)
-- drop down --
vcbClickPopOut(vcbOptions1Box4PopOut2, vcbOptions1Box4PopOut2Choice0)
-- sort & clicking --
vcbOptions1Box4PopOut2Choice1:SetParent(vcbOptions1Box4PopOut2Choice0)
vcbOptions1Box4PopOut2Choice1:SetPoint("TOP",vcbOptions1Box4PopOut2Choice0, "BOTTOM", 0, 0)
vcbOptions1Box4PopOut2Choice0:HookScript("OnClick", function(self, button, down)
	if button == "LeftButton" and down == false then
		VCBcPlayer["TotalTimeText"]["Sec"] = self.Text:GetText()
		vcbOptions1Box4PopOut2.Text:SetText(self:GetText())
		vcbOptions1Box4PopOut2Choice0:Hide()
	end
end)
vcbOptions1Box4PopOut2Choice1:HookScript("OnClick", function(self, button, down)
	if button == "LeftButton" and down == false then
		VCBcPlayer["TotalTimeText"]["Sec"] = self.Text:GetText()
		vcbOptions1Box4PopOut2.Text:SetText(self:GetText())
		vcbOptions1Box4PopOut2Choice0:Hide()
	end
end)
-- naming --
vcbOptions1Box4PopOut2Choice0.Text:SetText("Show")
vcbOptions1Box4PopOut2Choice1.Text:SetText("Hide")
-- Box 4 Lag Bar --
-- pop out 1 Lag Bar --
-- enter --
vcbOptions1Box5PopOut1:HookScript("OnEnter", function(self)
	vcbEnteringMenus(self)
	GameTooltip:SetText(vcbMainColor:WrapTextInColorCode(C_AddOns.GetAddOnMetadata("VCB", "Title")).."|nDo you want the|nLatency Bar to be shown?")
end)
-- leave --
vcbOptions1Box5PopOut1:HookScript("OnLeave", vcbLeavingMenus)
-- drop down --
vcbClickPopOut(vcbOptions1Box5PopOut1, vcbOptions1Box5PopOut1Choice0)
-- sort & clicking --
vcbOptions1Box5PopOut1Choice1:SetParent(vcbOptions1Box5PopOut1Choice0)
vcbOptions1Box5PopOut1Choice1:SetPoint("TOP",vcbOptions1Box5PopOut1Choice0, "BOTTOM", 0, 0)
vcbOptions1Box5PopOut1Choice0:HookScript("OnClick", function(self, button, down)
	if button == "LeftButton" and down == false then
		VCBcPlayer["LagBar"] = self.Text:GetText()
		vcbOptions1Box5PopOut1.Text:SetText(self:GetText())
		vcbOptions1Box5PopOut1Choice0:Hide()
	end
end)
vcbOptions1Box5PopOut1Choice1:HookScript("OnClick", function(self, button, down)
	if button == "LeftButton" and down == false then
		VCBcPlayer["LagBar"] = self.Text:GetText()
		vcbOptions1Box5PopOut1.Text:SetText(self:GetText())
		vcbOptions1Box5PopOut1Choice0:Hide()
	end
end)
-- naming --
vcbOptions1Box5PopOut1Choice0.Text:SetText("Show")
vcbOptions1Box5PopOut1Choice1.Text:SetText("Hide")
-- Showing the panel --
vcbOptions1:HookScript("OnShow", function(self)
	CheckSavedVariables()
	--if vcbOptions2:IsShown() then vcbOptions2:Hide() end
	--if vcbOptions3:IsShown() then vcbOptions3:Hide() end
	if vcbOptions4:IsShown() then vcbOptions4:Hide() end
	vcbOptions00Tab1.Text:SetTextColor(vcbHighColor:GetRGB())
	--vcbOptions00Tab2.Text:SetTextColor(vcbMainColor:GetRGB())
	--vcbOptions00Tab3.Text:SetTextColor(vcbMainColor:GetRGB())
	vcbOptions00Tab4.Text:SetTextColor(vcbMainColor:GetRGB())
end)
