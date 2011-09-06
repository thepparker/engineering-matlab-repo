function weaponsmithing_calc(num_bars,proficiency)
    if proficiency == 'artisan'
        %experience gained per tier
        dwarfCraftBladeExp = 4;
        strongSteelHiltExp = 4;
        level32Experience = 6;
        level38Experience = 10;
        %setup component costs in terms of dwarf-iron ingots
        dwarfCraftBlade = 2;
        strongSteelHilt = 2;
        westernesseBlade = 3;
        
        %tier requirements
        tier32_Req = dwarfCraftBlade;
        tier38_Req = dwarfCraftBlade + strongSteelHilt;
        
        %number of possible crafts for lvl 32 tier
        max32Craft = floor(num_bars/tier32_Req);
        max38Craft = floor(num_bars/tier38_Req);
        
        totalExp_32 = zeros(1,num_bars);
        totalExp_38 = zeros(1,num_bars);
        y_32 = 1;
        y_38 = 1;
        for x = 1:num_bars
            if x <= max32Craft
                totalExp_32(y_32) = y_32*dwarfCraftBladeExp + y_32*level32Experience;
            end
            y_32 = y_32 + 1;
        end
        for x = 1:num_bars
            if x <= max38Craft
                totalExp_38(y_38) = y_38*dwarfCraftBladeExp + y_38*strongSteelHiltExp + y_38*level38Experience;
            end
            y_38 = y_38 + 1;
        end
        if totalExp_32(max32Craft) > totalExp_38(max38Craft)
            fprintf(1,'The most ideal crafting would be: %s, giving %d exp\n%s would only give %d exp\n','Level 32 Weapons',totalExp_32(max32Craft),'Level 38 Weapons',totalExp_38(max38Craft));
        else
            fprintf(1,'The most ideal crafting would be: %s, giving %d exp\n','Level 38 Weapons',totalExp_38(max38Craft));
        end
        figure;
        num_barsPlot = 1:num_bars;
        plot(num_barsPlot,totalExp_32,'r+');hold on;plot(num_barsPlot,totalExp_38,'b-');hold off
    end
end