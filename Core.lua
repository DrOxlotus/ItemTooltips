--------------------------------------------------------------------------------
--                                 T O O L A I D                              --
--------------------------------------------------------------------------------
--               		Copyright 2018 Alex Metz (Oxlotus-Area 52)              	--
--------------------------------------------------------------------------------
-- Class Variables
--local achievement = ToolAid_Achievement:new()
local creature = ToolAid_Creature:new()
local item = ToolAid_Item:new()
local spell = ToolAid_Spell:new()

-- Creature
GameTooltip:HookScript("OnTooltipSetUnit", creature.AddCreatureIDToGameTooltip)

-- Item
GameTooltip:HookScript("OnTooltipSetItem", item.AddItemIDToGameTooltip)
GameTooltip:HookScript("OnTooltipSetItem", item.AddDefaultStackInfoToGameTooltip)
ItemRefTooltip:HookScript("OnTooltipSetItem", item.AddItemIDToItemRefTooltip)

-- Spell
--[[
Developer Note: Spells don't have their own reference tooltip; they piggyback on
the reference tooltip for items. Why? No idea...
]]--
GameTooltip:HookScript("OnTooltipSetSpell", spell.AddSpellIDToGameTooltip)
ItemRefTooltip:HookScript("OnTooltipSetSpell", spell.AddSpellIDToItemRefTooltip)
