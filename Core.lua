--------------------------------------------------------------------------------
--                                 T I P T O P                                --
--------------------------------------------------------------------------------
--               		Copyright 2018 Alex Metz (Oxlotus-Area 52)              	--
--------------------------------------------------------------------------------
local creature = TipTop_Creature:new()
local item = TipTop_Item:new()
local spell = TipTop_Spell:new()

-- Creature
GameTooltip:HookScript("OnTooltipSetUnit", creature.AddCreatureIDToGameTooltip)

-- Item
GameTooltip:HookScript("OnTooltipSetItem", item.AddItemIDToGameTooltip)
ItemRefTooltip:HookScript("OnTooltipSetItem", item.AddItemIDToItemRefTooltip)

-- Spell
GameTooltip:HookScript("OnTooltipSetSpell", spell.AddSpellIDToGameTooltip)
SpellRefTooltip:HookScript("OnTooltipSetSpell", spell.AddSpellIDToSpellRefTooltip)
