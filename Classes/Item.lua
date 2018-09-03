-- TODO: I need a way to cache all of the items in the game so I can easily convert names to ID values (this would save a TON of time and resources.)
ToolAid_Item = {}
ToolAid_Item.__index = ToolAid_Item

function ToolAid_Item:new()
  local self = {}
  setmetatable(self, ToolAid_Item)
  self.itemLink = select(2, GameTooltip:GetItem())
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
            ToolAid_Item:AddStackInfoToGameTooltip(itemID)
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

function ToolAid_Item:AddStackInfoToGameTooltip(itemID)
  local itemLink = select(2, GameTooltip:GetItem())
  if itemID then
    local itemStackCount = select(8, GetItemInfo(itemID))
    local inventoryCount = GetItemCount(itemID)
    local bankCount = GetItemCount(itemID, true)
    if (inventoryCount == 0) and (bankCount - inventoryCount == 0) then
      if (itemStackCount < 2) then
        -- The player doesn't have any of the shown item and it only stacks to 1
      else
        GameTooltip:AddDoubleLine("Stack Info: ", tostring(itemStackCount), nil, nil, nil, 0.89, 0.88, 0.004)
      end
    elseif (itemStackCount > 1) and (bankCount - inventoryCount == 0) then
      GameTooltip:AddDoubleLine("Stack Info: ", tostring(itemStackCount).." (Inventory: "..tostring(inventoryCount)..")", nil, nil, nil, 0.89, 0.88, 0.004)
    elseif (itemStackCount > 1) and (bankCount - inventoryCount ~= 0) then
      GameTooltip:AddDoubleLine("Stack Info: ", tostring(itemStackCount).." (Inventory: "..tostring(inventoryCount)..", Bank: "..tostring(bankCount - inventoryCount)..")", nil, nil, nil, 0.89, 0.88, 0.004)
    elseif (itemStackCount == 1) and (bankCount - inventoryCount == 0) then
      GameTooltip:AddDoubleLine("Stack Info: ", "(Inventory: "..tostring(inventoryCount)..")", nil, nil, nil, 0.89, 0.88, 0.004)
    elseif (itemStackCount == 1) and (bankCount - inventoryCount ~= 0) then
      GameTooltip:AddDoubleLine("Stack Info: ", "(Inventory: "..tostring(inventoryCount)..", Bank: "..tostring(bankCount - inventoryCount)..")", nil, nil, nil, 0.89, 0.88, 0.004)
    else
    end
  elseif itemLink then
    local itemStackCount = select(8, GetItemInfo(itemLink))
    local inventoryCount = GetItemCount(itemLink)
    local bankCount = GetItemCount(itemLink, true)
    if (inventoryCount == 0) and (bankCount - inventoryCount == 0) then
      if (itemStackCount < 2) then
        -- The player doesn't have any of the shown item and it only stacks to 1
      else
        GameTooltip:AddDoubleLine("Stack Info: ", tostring(itemStackCount), nil, nil, nil, 0.89, 0.88, 0.004)
      end
    elseif (itemStackCount > 1) and (bankCount - inventoryCount == 0) then
      GameTooltip:AddDoubleLine("Stack Info: ", tostring(itemStackCount).." (Inventory: "..tostring(inventoryCount)..")", nil, nil, nil, 0.89, 0.88, 0.004)
    elseif (itemStackCount > 1) and (bankCount - inventoryCount ~= 0) then
      GameTooltip:AddDoubleLine("Stack Info: ", tostring(itemStackCount).." (Inventory: "..tostring(inventoryCount)..", Bank: "..tostring(bankCount - inventoryCount)..")", nil, nil, nil, 0.89, 0.88, 0.004)
    elseif (itemStackCount == 1) and (bankCount - inventoryCount == 0) then
      GameTooltip:AddDoubleLine("Stack Info: ", "(Inventory: "..tostring(inventoryCount)..")", nil, nil, nil, 0.89, 0.88, 0.004)
    elseif (itemStackCount == 1) and (bankCount - inventoryCount ~= 0) then
      GameTooltip:AddDoubleLine("Stack Info: ", "(Inventory: "..tostring(inventoryCount)..", Bank: "..tostring(bankCount - inventoryCount)..")", nil, nil, nil, 0.89, 0.88, 0.004)
    else
    end
  else
  end
end
