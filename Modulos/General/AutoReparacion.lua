local x = CreateFrame("Frame")
    x:RegisterEvent("MERCHANT_SHOW")
    x:SetScript("OnEvent", function()
        if CanMerchantRepair() then
            local costoReparar = GetRepairAllCost()

            if costoReparar > 0 then
                local dinero = GetMoney()

                if IsInGuild() then
                    local hermandadDinero = GetGuildBankWithdrawMoney()

                    if (hermandadDinero > GetGuildBankMoney()) then
                        hermandadDinero = GetGuildBankMoney()
                end

                if hermandadDinero > costoReparar and CanGuildBankRepair() then
                    RepairAllItems(1)
                    print(format("|cfff07100Costo de reparaciones cubierto por la hermandad: %.1fg|r", costoReparar * 0.0001))
                    return
                end
            end

            if dinero > costoReparar then
                RepairAllItems()
                print(format("|cffead000Te volaste: %.1fg|r", costoReparar * 0.0001))
            else
                print("Tas palmao chatel, hacete caso.")
            end        
        end
    end
end)