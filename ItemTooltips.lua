--------------------------------------------------------------------------------
--                            I T E M   T O O L T I P S                       --
--------------------------------------------------------------------------------
--               		Copyright 2018 Alex Metz (Oxlotus-Area 52)              	--
--------------------------------------------------------------------------------
local t = GameTooltip;

local function AddItemIDToTooltip(gt) -- GameTooltip (gt)
  local itemName, itemLink = gt:GetItem();
  if not itemName or not itemLink then return; end

  local itemString = select(3, strfind(itemLink, "|H(.+)|h"));
  local _, itemID, _, _, _, _, _, _, _, _, _, _, _, _ = strsplit(":", itemString)

  gt:AddDoubleLine("Item ID: ", itemID, nil, nil, nil, 0.2, 0.7, 1);
end

t:HookScript("OnTooltipSetItem", AddItemIDToTooltip);
