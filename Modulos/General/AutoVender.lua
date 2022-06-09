local x = CreateFrame("Frame")
x:RegisterEvent("MERCHANT_SHOW")
local function eventoTienda()
    local enlace
    for mochila = 0, 4 do
        for casilla = 1, GetContainerNumSlots(mochila) do
            enlace = GetContainerItemLink(mochila, casilla)
            if enlace and (select(3, GetItemInfo(enlace)) == 0) then
                UseContainerItem(mochila, casilla)
            end
        end
    end
end
x:SetScript("OnEvent", eventoTienda)