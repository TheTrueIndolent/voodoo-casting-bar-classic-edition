-- Position of the Name Text --
local function NameTextPosition(self, var1, var2)
	if VCBcPlayer[var1] == "Top Left" then
		var2:ClearAllPoints()
		var2:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 2, 2)
		if not var2:IsShown() then var2:Show() end
	elseif VCBcPlayer[var1] == "Left" then
		var2:ClearAllPoints()
		var2:SetPoint("LEFT", self, "LEFT", 3, 3)
		if not var2:IsShown() then var2:Show() end
	elseif VCBcPlayer[var1] == "Bottom Left" then
		var2:ClearAllPoints()
		var2:SetPoint("TOPLEFT", self, "BOTTOMLEFT", 2, 0)
		if not var2:IsShown() then var2:Show() end
	elseif VCBcPlayer[var1] == "Top" then
		var2:ClearAllPoints()
		var2:SetPoint("BOTTOM", self, "TOP", 0, 2)
		if not var2:IsShown() then var2:Show() end
	elseif VCBcPlayer[var1] == "Center" then
		var2:ClearAllPoints()
		var2:SetPoint("CENTER", self, "CENTER", 0, 3)
		if not var2:IsShown() then var2:Show() end
	elseif VCBcPlayer[var1] == "Bottom" then
		var2:ClearAllPoints()
		var2:SetPoint("TOP", self, "BOTTOM", 0, 0)
		if not var2:IsShown() then var2:Show() end
	elseif VCBcPlayer[var1] == "Top Right" then
		var2:ClearAllPoints()
		var2:SetPoint("BOTTOMRIGHT", self, "TOPRIGHT", -2, 2)
		if not var2:IsShown() then var2:Show() end
	elseif VCBcPlayer[var1] == "Right" then
		var2:ClearAllPoints()
		var2:SetPoint("RIGHT", self, "RIGHT", -3, 3)
		if not var2:IsShown() then var2:Show() end
	elseif VCBcPlayer[var1] == "Bottom Right" then
		var2:ClearAllPoints()
		var2:SetPoint("TOPRIGHT", self, "BOTTOMRIGHT", -2, 0)
		if not var2:IsShown() then var2:Show() end
	elseif VCBcPlayer[var1] == "Hide" then
		if var2:IsShown() then var2:Hide() end
	end
end
-- Position of the Casting Texts --
local function CastingTextPosition(self, var1, var2)
	if VCBcPlayer[var1]["Position"] == "Top Left" then
		var2:ClearAllPoints()
		var2:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 2, 2)
		if not var2:IsShown() then var2:Show() end
	elseif VCBcPlayer[var1]["Position"] == "Left" then
		var2:ClearAllPoints()
		var2:SetPoint("LEFT", self, "LEFT", 3, 3)
		if not var2:IsShown() then var2:Show() end
	elseif VCBcPlayer[var1]["Position"] == "Bottom Left" then
		var2:ClearAllPoints()
		var2:SetPoint("TOPLEFT", self, "BOTTOMLEFT", 2, 0)
		if not var2:IsShown() then var2:Show() end
	elseif VCBcPlayer[var1]["Position"] == "Top" then
		var2:ClearAllPoints()
		var2:SetPoint("BOTTOM", self, "TOP", 0, 2)
		if not var2:IsShown() then var2:Show() end
	elseif VCBcPlayer[var1]["Position"] == "Center" then
		var2:ClearAllPoints()
		var2:SetPoint("CENTER", self, "CENTER", 0, 3)
		if not var2:IsShown() then var2:Show() end
	elseif VCBcPlayer[var1]["Position"] == "Bottom" then
		var2:ClearAllPoints()
		var2:SetPoint("TOP", self, "BOTTOM", 0, 0)
		if not var2:IsShown() then var2:Show() end
	elseif VCBcPlayer[var1]["Position"] == "Top Right" then
		var2:ClearAllPoints()
		var2:SetPoint("BOTTOMRIGHT", self, "TOPRIGHT", -2, 2)
		if not var2:IsShown() then var2:Show() end
	elseif VCBcPlayer[var1]["Position"] == "Right" then
		var2:ClearAllPoints()
		var2:SetPoint("RIGHT", self, "RIGHT", -3, 3)
		if not var2:IsShown() then var2:Show() end
	elseif VCBcPlayer[var1]["Position"] == "Bottom Right" then
		var2:ClearAllPoints()
		var2:SetPoint("TOPRIGHT", self, "BOTTOMRIGHT", -2, 0)
		if not var2:IsShown() then var2:Show() end
	elseif VCBcPlayer[var1]["Position"] == "Hide" then
		if var2:IsShown() then var2:Hide() end
	end
end
-- Ascending, Descending and Sec --
local function AscendingDescendingSec(self)
	if self.casting then
		if VCBcPlayer["CurrentTimeText"]["Sec"] == "Show" then
			if VCBcPlayer["CurrentTimeText"]["Direction"] == "Ascending" or VCBcPlayer["CurrentTimeText"]["Direction"] == "Both" then
				VCBcurrentTimeText:SetFormattedText("%.2f sec", self.value)
			elseif VCBcPlayer["CurrentTimeText"]["Direction"] == "Descending" then
				local VCBdescending = self.maxValue - self.value
				VCBcurrentTimeText:SetFormattedText("%.2f sec", VCBdescending)
			end
		elseif VCBcPlayer["CurrentTimeText"]["Sec"] == "Hide" then
			if VCBcPlayer["CurrentTimeText"]["Direction"] == "Ascending" or VCBcPlayer["CurrentTimeText"]["Direction"] == "Both" then
				VCBcurrentTimeText:SetFormattedText("%.2f", self.value)
			elseif VCBcPlayer["CurrentTimeText"]["Direction"] == "Descending" then
				local VCBdescending = self.maxValue - self.value
				VCBcurrentTimeText:SetFormattedText("%.2f", VCBdescending)
			end
		end
		if VCBcPlayer["BothTimeText"]["Sec"] == "Show" then
			if VCBcPlayer["BothTimeText"]["Direction"] == "Ascending" or VCBcPlayer["BothTimeText"]["Direction"] == "Both" then
				VCBbothTimeText:SetFormattedText("%.2f/%.2f sec", self.value, self.maxValue)
			elseif VCBcPlayer["BothTimeText"]["Direction"] == "Descending" then
				local VCBdescending = self.maxValue - self.value
				VCBbothTimeText:SetFormattedText("%.2f/%.2f sec", VCBdescending, self.maxValue)
			end
		elseif VCBcPlayer["BothTimeText"]["Sec"] == "Hide" then
			if VCBcPlayer["BothTimeText"]["Direction"] == "Ascending" or VCBcPlayer["BothTimeText"]["Direction"] == "Both" then
				VCBbothTimeText:SetFormattedText("%.2f/%.2f", self.value, self.maxValue)
			elseif VCBcPlayer["BothTimeText"]["Direction"] == "Descending" then
				local VCBdescending = self.maxValue - self.value
				VCBbothTimeText:SetFormattedText("%.2f/%.2f", VCBdescending, self.maxValue)
			end
		end
	elseif self.channeling then
		if VCBcPlayer["CurrentTimeText"]["Sec"] == "Show" then
			if VCBcPlayer["CurrentTimeText"]["Direction"] == "Descending" or VCBcPlayer["CurrentTimeText"]["Direction"] == "Both" then
				VCBcurrentTimeText:SetFormattedText("%.2f sec", self.value)
			elseif VCBcPlayer["CurrentTimeText"]["Direction"] == "Ascending" then
				local VCBdescending = self.maxValue - self.value
				VCBcurrentTimeText:SetFormattedText("%.2f sec", VCBdescending)
			end
		elseif VCBcPlayer["CurrentTimeText"]["Sec"] == "Hide" then
			if VCBcPlayer["CurrentTimeText"]["Direction"] == "Descending" or VCBcPlayer["CurrentTimeText"]["Direction"] == "Both" then
				VCBcurrentTimeText:SetFormattedText("%.2f", self.value)
			elseif VCBcPlayer["CurrentTimeText"]["Direction"] == "Ascending" then
				local VCBdescending = self.maxValue - self.value
				VCBcurrentTimeText:SetFormattedText("%.2f", VCBdescending)
			end
		end
		if VCBcPlayer["BothTimeText"]["Sec"] == "Show" then
			if VCBcPlayer["BothTimeText"]["Direction"] == "Descending" or VCBcPlayer["BothTimeText"]["Direction"] == "Both" then
				VCBbothTimeText:SetFormattedText("%.2f/%.2f sec", self.value, self.maxValue)
			elseif VCBcPlayer["BothTimeText"]["Direction"] == "Ascending" then
				local VCBdescending = self.maxValue - self.value
				VCBbothTimeText:SetFormattedText("%.2f/%.2f sec", VCBdescending, self.maxValue)
			end
		elseif VCBcPlayer["BothTimeText"]["Sec"] == "Hide" then
			if VCBcPlayer["BothTimeText"]["Direction"] == "Descending" or VCBcPlayer["BothTimeText"]["Direction"] == "Both" then
				VCBbothTimeText:SetFormattedText("%.2f/%.2f", self.value, self.maxValue)
			elseif VCBcPlayer["BothTimeText"]["Direction"] == "Ascending" then
				local VCBdescending = self.maxValue - self.value
				VCBbothTimeText:SetFormattedText("%.2f/%.2f", VCBdescending, self.maxValue)
			end
		end
	end
end
-- Hooking Time part 1 --
CastingBarFrame:HookScript("OnShow", function(self)
	if VCBcPlayer["Icon"] == "Left" then
		if not self.Icon:IsShown() then self.Icon:Show() end
		if VCBiconSpell:IsShown() then VCBiconSpell:Hide() end
	elseif VCBcPlayer["Icon"] == "Right" then
		if self.Icon:IsShown() then self.Icon:Hide() end
		if not VCBiconSpell:IsShown() then VCBiconSpell:Show() end
		VCBiconSpell:SetTexture(CastingBarFrame.Icon:GetTextureFileID())
	elseif VCBcPlayer["Icon"] == "Left and Right" then
		if not self.Icon:IsShown() then self.Icon:Show() end
		if not VCBiconSpell:IsShown() then VCBiconSpell:Show() end
		VCBiconSpell:SetTexture(CastingBarFrame.Icon:GetTextureFileID())
	elseif VCBcPlayer["Icon"] == "Hide" then
		if self.Icon:IsShown() then self.Icon:Hide() end
		if VCBiconSpell:IsShown() then VCBiconSpell:Hide() end
	end
	NameTextPosition(self, "NameText", VCBnameText)
	CastingTextPosition(self, "CurrentTimeText", VCBcurrentTimeText)
	CastingTextPosition(self, "BothTimeText", VCBbothTimeText)
	CastingTextPosition(self, "TotalTimeText", VCBtotalTimeText)
end)
-- Hooking Time part 2 --
CastingBarFrame:HookScript("OnUpdate", function(self)
	self.Text:SetAlpha(0)
	AscendingDescendingSec(self)
	if VCBcPlayer["TotalTimeText"]["Sec"] == "Show" then
		VCBtotalTimeText:SetFormattedText("%.2f sec", self.maxValue)
	elseif VCBcPlayer["TotalTimeText"]["Sec"] == "Hide" then
		VCBtotalTimeText:SetFormattedText("%.2f", self.maxValue)
	end
	VCBnameText:SetText(self.Text:GetText())
end)
