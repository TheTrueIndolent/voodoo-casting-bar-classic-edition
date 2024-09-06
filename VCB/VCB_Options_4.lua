-- taking care of the panel --
vcbOptions4:ClearAllPoints()
vcbOptions4:SetPoint("TOPLEFT", vcbOptions00, "TOPLEFT", 0, 0)
vcbOptions4.BGtexture:SetAlpha(1)
vcbOptions4.CenterTxt:Hide()
vcbOptions4.BottomTxt:Hide()
vcbOptions4.BottomLeftTxt:Hide()
vcbOptions4.TopTxt:SetText("Create, load, and delete profiles!")
vcbOptions4Box1.TitleTxt:SetText("Create a profile!")
vcbOptions4Box2:SetPoint("TOP", vcbOptions4Box1, "BOTTOM", 0, 0)
vcbOptions4Box2.TitleTxt:SetText("Load a profile!")
vcbOptions4Box3:SetPoint("TOP", vcbOptions4Box2, "BOTTOM", 0, 0)
vcbOptions4Box3.TitleTxt:SetText("Delete a profile!")
vcbOptions4Box3.CenterTxt:SetText(vcbHighColor:WrapTextInColorCode("Note: ").."When you "..vcbHighColor:WrapTextInColorCode("SAVE")..", "..vcbHighColor:WrapTextInColorCode("LOAD")..", or "..vcbHighColor:WrapTextInColorCode("DELETE").." a Profile, the UI will be RELOADED!")
-- some variables --
local NameExist = false
-- finding keys --
local function FindingKeys()
	local Keys = 0
	for k, v in pairs(VCBcProfile) do
		Keys = Keys + 1
	end
	VCBcNumber = Keys
end
-- coping the tables --
local function CopyTable(k)
	VCBcPlayer = VCBcProfile[k]["Player"]
	VCBcTarget = VCBcProfile[k]["Target"]
	VCBcFocus = VCBcProfile[k]["Focus"]
end
-- deleting keys --
local function DeletingKeys(self)
	for k, v in pairs(VCBcProfile) do
		if k == self:GetText() then
		VCBcProfile[k] = nil
		end
	end
end
-- functions for loading the profiles --
local function LoadingProfiles()
	if VCBcCounterLoading == 0 and VCBcNumber > 0 then
		for k, v in pairs(VCBcProfile) do
			VCBcCounterLoading = VCBcCounterLoading + 1
			local button = CreateFrame("Button" , "vcbOptions4Box2PopOut1Choice"..VCBcCounterLoading, vcbOptions4Box2PopOut1Choice0, "vcbPopOutButton")
			_G["vcbOptions4Box2PopOut1Choice"..VCBcCounterLoading]:SetPoint("TOP","vcbOptions4Box2PopOut1Choice"..VCBcCounterLoading - 1, "BOTTOM", 0, 0)
			_G["vcbOptions4Box2PopOut1Choice"..VCBcCounterLoading].Text:SetText(k)
			_G["vcbOptions4Box2PopOut1Choice"..VCBcCounterLoading]:HookScript("OnClick", function(self, button, down)
				if button == "LeftButton" and down == false then
					CopyTable(k)
					C_UI.Reload()
				end
			end)
		end
	end
end
-- functions for deleting the profiles --
local function DeletingProfiles()
	if VCBcCounterDeleting == 0 and VCBcNumber > 0 then
		for k, v in pairs(VCBcProfile) do
			VCBcCounterDeleting = VCBcCounterDeleting + 1
			local button = CreateFrame("Button" , "vcbOptions4Box3PopOut1Choice"..VCBcCounterDeleting, vcbOptions4Box3PopOut1Choice0, "vcbPopOutButton")
			_G["vcbOptions4Box3PopOut1Choice"..VCBcCounterDeleting]:SetPoint("TOP","vcbOptions4Box3PopOut1Choice"..VCBcCounterDeleting - 1, "BOTTOM", 0, 0)
			_G["vcbOptions4Box3PopOut1Choice"..VCBcCounterDeleting].Text:SetText(k)
			_G["vcbOptions4Box3PopOut1Choice"..VCBcCounterDeleting]:HookScript("OnClick", function(self, button, down)
				if button == "LeftButton" and down == false then
					DeletingKeys(self)
					C_UI.Reload()
				end
			end)
		end
	end
end
-- taking care of the edit box --
-- width and height --
local fontFile, height, flags = vcbOptions4Box1EditBox1.WritingLine:GetFont()
vcbOptions4Box1EditBox1.WritingLine:SetHeight(height)
vcbOptions4Box1EditBox1:SetWidth(vcbOptions4Box1:GetWidth()*0.65)
vcbOptions4Box1EditBox1:SetHeight(vcbOptions4Box1EditBox1.WritingLine:GetHeight()*1.75)
vcbOptions4Box1EditBox1.WritingLine:SetWidth(vcbOptions4Box1EditBox1:GetWidth()*0.95)
-- enter --
vcbOptions4Box1EditBox1.WritingLine:HookScript("OnEnter", function(self)
	vcbEnteringMenus(self)
	GameTooltip:SetText(vcbMainColor:WrapTextInColorCode(C_AddOns.GetAddOnMetadata("VCB", "Title")).."|nWrite a name for your profile in the Edit Box and|npress enter to save your settings/options!") 
end)
-- leave --
vcbOptions4Box1EditBox1.WritingLine:HookScript("OnLeave", vcbLeavingMenus)
-- pressing enter --
vcbOptions4Box1EditBox1.WritingLine:SetScript("OnEnterPressed", function(self)
	if self:HasText() then
		EditBox_HighlightText(self)
		local name = self:GetText()
		for k, v in pairs(VCBcProfile) do
			if k == name then
				NameExist = true
			else
				NameExist = false
			end
			if NameExist then
				local vcbTime = GameTime_GetTime(false)
				DEFAULT_CHAT_FRAME:AddMessage(vcbTime.." ["..vcbMainColor:WrapTextInColorCode(C_AddOns.GetAddOnMetadata("VCB", "Title")).."] This Profile already exist please try another name!")
				return
			end
		end
		VCBcNumber = VCBcNumber + 1
		VCBcProfile[name] = {Player = VCBcPlayer, Target = VCBcTarget, Focus = VCBcFocus}
		C_UI.Reload()
	else
		local vcbTime = GameTime_GetTime(false)
		DEFAULT_CHAT_FRAME:AddMessage(vcbTime.." ["..vcbMainColor:WrapTextInColorCode(C_AddOns.GetAddOnMetadata("VCB", "Title")).."] Please enter a name for your profile!")
	end
end)
-- Box 2 --
-- Popout 1 LOAD --
-- width --
vcbOptions4Box2PopOut1:SetWidth(vcbOptions4Box2:GetWidth()*0.65)
-- enter --
vcbOptions4Box2PopOut1:SetScript("OnEnter", function(self)
	vcbEnteringMenus(self)
	GameTooltip:SetText(vcbMainColor:WrapTextInColorCode(C_AddOns.GetAddOnMetadata("VCB", "Title")).."|nSelect one of the profiles to be "..vcbHighColor:WrapTextInColorCode("LOADED!")) 
end)
-- leave --
vcbOptions4Box2PopOut1:SetScript("OnLeave", vcbLeavingMenus)
-- drop down --
vcbClickPopOut(vcbOptions4Box2PopOut1, vcbOptions4Box2PopOut1Choice0)
-- choice 0 --
vcbOptions4Box2PopOut1Choice0:HookScript("OnClick", function(self, button, down)
	if button == "LeftButton" and down == false then
		local vcbTime = GameTime_GetTime(false)
		DEFAULT_CHAT_FRAME:AddMessage(vcbTime.." ["..vcbMainColor:WrapTextInColorCode(C_AddOns.GetAddOnMetadata("VCB", "Title")).."] I did nothing, I literally do nothing as button!")
		vcbOptions4Box2PopOut1Choice0:Hide()
	end
end)
-- naming --
vcbOptions4Box2PopOut1Choice0.Text:SetText("Nothing")
-- Box 3 --
-- Popout 1 DELETE --
-- width --
vcbOptions4Box3PopOut1:SetWidth(vcbOptions4Box3:GetWidth()*0.65)
-- enter --
vcbOptions4Box3PopOut1:SetScript("OnEnter", function(self)
	vcbEnteringMenus(self)
	GameTooltip:SetText(vcbMainColor:WrapTextInColorCode(C_AddOns.GetAddOnMetadata("VCB", "Title")).."|nSelect one of the profiles to be "..vcbHighColor:WrapTextInColorCode("DELETED!")) 
end)
-- leave --
vcbOptions4Box3PopOut1:SetScript("OnLeave", vcbLeavingMenus)
-- drop down --
vcbClickPopOut(vcbOptions4Box3PopOut1, vcbOptions4Box3PopOut1Choice0)
-- choice 0 --
vcbOptions4Box3PopOut1Choice0:HookScript("OnClick", function(self, button, down)
	if button == "LeftButton" and down == false then
		local vcbTime = GameTime_GetTime(false)
		DEFAULT_CHAT_FRAME:AddMessage(vcbTime.." ["..vcbMainColor:WrapTextInColorCode(C_AddOns.GetAddOnMetadata("VCB", "Title")).."] I did nothing, I literally do nothing as button!")
		vcbOptions4Box3PopOut1Choice0:Hide()
	end
end)
-- naming --
vcbOptions4Box3PopOut1Choice0.Text:SetText("Nothing")
-- Showing the panel --
vcbOptions4:HookScript("OnShow", function(self)
	FindingKeys()
	LoadingProfiles()
	DeletingProfiles()
	vcbOptions4Box2PopOut1.Text:SetText("Click me")
	vcbOptions4Box3PopOut1.Text:SetText("Click me")
	--if vcbOptions2:IsShown() then vcbOptions2:Hide() end
	--if vcbOptions3:IsShown() then vcbOptions3:Hide() end
	if vcbOptions1:IsShown() then vcbOptions1:Hide() end
	vcbOptions00Tab1.Text:SetTextColor(vcbMainColor:GetRGB())
	--vcbOptions00Tab2.Text:SetTextColor(vcbMainColor:GetRGB())
	--vcbOptions00Tab3.Text:SetTextColor(vcbMainColor:GetRGB())
	vcbOptions00Tab4.Text:SetTextColor(vcbHighColor:GetRGB())
end)
