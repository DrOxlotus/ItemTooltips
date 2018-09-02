-- TODO: I need a way to cache all of the items in the game so I can easily convert names to ID values (this would save a TON of time and resources.)
ToolAid_Item = {}
ToolAid_Item.__index = ToolAid_Item

function ToolAid_Item:new()
  local self = {}
  setmetatable(self, ToolAid_Item)
  return self
end

function ToolAid_Item:AddItemIDToGameTooltip()
  local itemLink = select(2, GameTooltip:GetItem())
  if not itemLink then
    return
  else
    -- We need to check if the item is a recipe before slapping an ID to it
    local itemID = string.match(itemLink, "item:(%d*)")
    local itemType = select(6, GetItemInfo(itemLink))
    if (itemType == "Recipe") then
      --[[local recipeItemName = select(1, GetItemInfo(itemLink))
      recipeItemName = recipeItemName:gsub(".*: ", "")
      print(GetItemInfo(recipeItemName))]]--
    -- Check if the item in the tooltip is an item in the Trade skill frame
    elseif (itemID == "" or itemID == "0") and TradeSkillFrame ~= nil and TradeSkillFrame:IsVisible() and GetMouseFocus().reagentIndex then
        local selectedRecipe = TradeSkillFrame.RecipeList:GetSelectedRecipeID()
        for i = 1, 8 do
          if GetMouseFocus().reagentIndex == i then
            itemID = C_TradeSkillUI.GetRecipeReagentItemLink(selectedRecipe, i):match("item:(%d*)") or nil
            GameTooltip:AddDoubleLine("Item ID: ", itemID, nil, nil, nil, 0.2, 0.7, 1)
            ToolAid_Item:AddReagentStackInfoToGameTooltip(itemID)
            break
          end
        end
    else
      GameTooltip:AddDoubleLine("Item ID: ", itemID, nil, nil, nil, 0.2, 0.7, 1)
    end
  end
end

function ToolAid_Item:AddItemIDToItemRefTooltip()
  local itemLink = select(2, ItemRefTooltip:GetItem())
  if not itemLink then
    return
  else
    local itemID = string.match(itemLink, "item:(%d*)")
    ItemRefTooltip:AddDoubleLine("Item ID: ", itemID, nil, nil, nil, 0.2, 0.7, 1)
  end
end

-- This function is used for all items outside of the trade skill reagent frame
function ToolAid_Item:AddDefaultStackInfoToGameTooltip()
  local itemLink = select(2, GameTooltip:GetItem())
  local itemStackCount = select(8, GetItemInfo(itemLink))
  local inventoryItemCount = GetItemCount(itemLink, false)
  local bankItemCount = GetItemCount(itemLink, true)
  if (inventoryItemCount == 0) and (bankItemCount - inventoryItemCount == 0) then
    -- The player doesn't have any of the shown item
  elseif (itemStackCount > 1) and (bankItemCount - inventoryItemCount == 0) then
    GameTooltip:AddDoubleLine("Stack Info: ", tostring(itemStackCount).." (Inventory: "..tostring(inventoryItemCount)..")", nil, nil, nil, 0.89, 0.88, 0.004)
  elseif (itemStackCount > 1) and (bankItemCount - inventoryItemCount ~= 0) then
    GameTooltip:AddDoubleLine("Stack Info: ", tostring(itemStackCount).." (Inventory: "..tostring(inventoryItemCount)..", Bank: "..tostring(bankItemCount - inventoryItemCount)..")", nil, nil, nil, 0.89, 0.88, 0.004)
  elseif (itemStackCount == 1) and (bankItemCount - inventoryItemCount == 0) then
    GameTooltip:AddDoubleLine("Stack Info: ", "(Inventory: "..tostring(inventoryItemCount)..")", nil, nil, nil, 0.89, 0.88, 0.004)
  elseif (itemStackCount == 1) and (bankItemCount - inventoryItemCount ~= 0) then
    GameTooltip:AddDoubleLine("Stack Info: ", "(Inventory: "..tostring(inventoryItemCount)..", Bank: "..tostring(bankItemCount - inventoryItemCount)..")", nil, nil, nil, 0.89, 0.88, 0.004)
  else
  end
end

-- This function is used explicitly for trade skill reagents
function ToolAid_Item:AddReagentStackInfoToGameTooltip(itemID)
  local itemStackCount = select(8, GetItemInfo(itemID))
  local inventoryItemCount = GetItemCount(itemID, false)
  local bankItemCount = GetItemCount(itemID, true)
  if (inventoryItemCount == 0) and (bankItemCount - inventoryItemCount == 0) then
    -- The player doesn't have any of the shown reagent
  elseif (itemStackCount > 1) and (bankItemCount - inventoryItemCount == 0) then
    GameTooltip:AddDoubleLine("Stack Info: ", tostring(itemStackCount).." (Inventory: "..tostring(inventoryItemCount)..")", nil, nil, nil, 0.89, 0.88, 0.004)
  elseif (itemStackCount > 1) and (bankItemCount - inventoryItemCount ~= 0) then
    GameTooltip:AddDoubleLine("Stack Info: ", tostring(itemStackCount).." (Inventory: "..tostring(inventoryItemCount)..", Bank: "..tostring(bankItemCount - inventoryItemCount)..")", nil, nil, nil, 0.89, 0.88, 0.004)
  elseif (itemStackCount == 1) and (bankItemCount - inventoryItemCount == 0) then
    GameTooltip:AddDoubleLine("Stack Info: ", "(Inventory: "..tostring(inventoryItemCount)..")", nil, nil, nil, 0.89, 0.88, 0.004)
  elseif (itemStackCount == 1) and (bankItemCount - inventoryItemCount ~= 0) then
    GameTooltip:AddDoubleLine("Stack Info: ", "(Inventory: "..tostring(inventoryItemCount)..", Bank: "..tostring(bankItemCount - inventoryItemCount)..")", nil, nil, nil, 0.89, 0.88, 0.004)
  else
  end
end
