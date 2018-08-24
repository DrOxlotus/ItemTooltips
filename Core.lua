--------------------------------------------------------------------------------
--                                 T I P T O P                                --
--------------------------------------------------------------------------------
--               		Copyright 2018 Alex Metz (Oxlotus-Area 52)              	--
--------------------------------------------------------------------------------
local function AddItemIDToTooltip(gt)
  -- Items
  local itemLink = select(2, gt:GetItem());
  if not itemLink then
    return
  else
    local itemID = string.match(itemLink, "item:(%d*)");
    gt:AddDoubleLine("Item ID: ", itemID, nil, nil, nil, 0.2, 0.7, 1);
  end
end

local function AddSpellIDToTooltip(gt)
  local spellName, spellRank, spellID = gt:GetSpell();
  if spellID == nil then
    --print("Spell ID is nil.");
  else
    --print(spellID);
  end
end

local function AddCreatureIDToTooltip(gt)
  if UnitIsPlayer("mouseover") then
    return
  else
    local guid = UnitGUID("mouseover");
    local _, _, _, _, _, npcID, _ = strsplit("-", guid);
    gt:AddDoubleLine("Creature ID: ", npcID, nil, nil, nil, 0.2, 0.7, 1);
  end
end

GameTooltip:HookScript("OnTooltipSetItem", AddItemIDToTooltip);
--GameTooltip:HookScript("OnTooltipSetSpell", AddSpellIDToTooltip);
GameTooltip:HookScript("OnTooltipSetUnit", AddCreatureIDToTooltip);
