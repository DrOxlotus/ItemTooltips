--------------------------------------------------------------------------------
--                            I T E M   T O O L T I P S                       --
--------------------------------------------------------------------------------
--               		Copyright 2018 Alex Metz (Oxlotus-Area 52)              	--
--------------------------------------------------------------------------------
local t = GameTooltip;

local function AddItemIDToTooltip(gt) -- GameTooltip (gt)
  local itemLink = gt:GetItem();

  local _, _, _, _, itemID, _, _, _, _, _, _, _, _, _, _ = string.find(itemLink, "|?c?f?f?(%x*)|?H?([^:]*):?(%d+):?(%d*):?(%d*):?(%d*):?(%d*):?(%d*):?(%-?%d*):?(%-?%d*):?(%d*):?(%d*)|?h?%[?([^%[%]]*)%]?|?h?|?r?");

  gt:AddDoubleLine("Item ID: ", itemID, nil, nil, nil, 0.2, 0.7, 1);
end

t:HookScript("OnTooltipSetItem", AddItemIDToTooltip);
