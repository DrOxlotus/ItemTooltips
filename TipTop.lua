--------------------------------------------------------------------------------
--                                 T I P T O P                                --
--------------------------------------------------------------------------------
--               		Copyright 2018 Alex Metz (Oxlotus-Area 52)              	--
--------------------------------------------------------------------------------
print("Me");
local t = GameTooltip;

local function AddIDToTooltip(gt) -- GameTooltip (gt)
  print("B");
  if (gt:GetItem()) then
    local itemName, itemLink = gt:GetItem();
    if not itemName or not itemLink then return; end

    local itemString = select(3, strfind(itemLink, "|H(.+)|h"));
    local _, itemID, _, _, _, _, _, _, _, _, _, _, _, _ = strsplit(":", itemString)

    gt:AddDoubleLine("Item ID: ", itemID, nil, nil, nil, 0.2, 0.7, 1);
  elseif (gt:GetSpell()) then
    local _, _, spellID = gt:GetSpell();

    gt:AddDoubleLine("Spell ID: ", spellID, nil, nil, nil, 0.2, 0.7, 1);
end

print("A");

t:HookScript("OnTooltipSetItem", AddIDToTooltip);
