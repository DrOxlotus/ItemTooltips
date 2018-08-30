--------------------------------------------------------------------------------
--                                 T O O L A I D                              --
--------------------------------------------------------------------------------
--               		Copyright 2018 Alex Metz (Oxlotus-Area 52)              	--
--------------------------------------------------------------------------------
-- Class Variables
local creature = TipTop_Creature:new()
local item = TipTop_Item:new()
local spell = TipTop_Spell:new()

-- Creature
GameTooltip:HookScript("OnTooltipSetUnit", creature.AddCreatureIDToGameTooltip)

-- Item
GameTooltip:HookScript("OnTooltipSetItem", item.AddItemIDToGameTooltip)
ItemRefTooltip:HookScript("OnTooltipSetItem", item.AddItemIDToItemRefTooltip)

-- Spell
--[[
Developer Note: Spells don't have their own reference tooltip; they piggyback on
the reference tooltip for items. Why? No idea...
]]--
GameTooltip:HookScript("OnTooltipSetSpell", spell.AddSpellIDToGameTooltip)
ItemRefTooltip:HookScript("OnTooltipSetSpell", spell.AddSpellIDToItemRefTooltip)
