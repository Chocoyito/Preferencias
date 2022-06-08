local marcoNpc = CreateFrame("Frame")
    marcoNpc:RegisterEvent("ADDON_LOADED")
    marcoNpc:SetScript("OnEvent", function(self, event, addon)
        -- https://wowwiki-archive.fandom.com/wiki/API_hooksecurefunc
        if addon == "Blizzard_TalkingHeadUI" then
            hooksecurefunc("TalkingHeadFrame_PlayCurrent", function() TalkingHeadFrame_CloseImmediately()
        end)
        self:UnregisterEvent(event)
    end
end)