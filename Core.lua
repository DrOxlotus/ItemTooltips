--------------------------------------------------------------------------------
--                                 T I P T O P                                --
--------------------------------------------------------------------------------
--               		Copyright 2018 Alex Metz (Oxlotus-Area 52)              	--
--------------------------------------------------------------------------------
local creature = TipTop_Creature:new()
local item = TipTop_Item:new()

--[[local function AddSpellIDToTooltip(gt)
  local spellID = select(3, gt:GetSpell())
  print(spellID)
end

GameTooltip:HookScript("OnTooltipSetSpell", AddSpellIDToTooltip)]]--

-- Creature
GameTooltip:HookScript("OnTooltipSetUnit", creature.AddIDToTooltip)

-- Item
GameTooltip:HookScript("OnTooltipSetItem", item.AddIDToGameTooltip)
ItemRefTooltip:HookScript("OnTooltipSetItem", item.AddIDToItemRefTooltip)

-- Trade Skills
GameTooltip:HookScript("SetRecipeReagentItem", item.AddIDToReagentListTooltip)
