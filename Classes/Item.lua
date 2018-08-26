TipTop_Item = {}
TipTop_Item.__index = TipTop_Item

function TipTop_Item:new()
  local self = {}
  setmetatable(self, TipTop_Item)
  return self
end

function TipTop_Item:AddItemIDToGameTooltip()
  local itemLink = select(2, GameTooltip:GetItem())
  if not itemLink then
    return
  else
    local itemID = string.match(itemLink, "item:(%d*)")
    if (itemID == "" or itemID == "0") and TradeSkillFrame ~= nil and TradeSkillFrame:IsVisible() and GetMouseFocus().reagentIndex then
      local selectedRecipe = TradeSkillFrame.RecipeList:GetSelectedRecipeID()
      for i = 1, 8 do
        if GetMouseFocus().reagentIndex == i then
          itemID = C_TradeSkillUI.GetRecipeReagentItemLink(selectedRecipe, i):match("item:(%d*)") or nil
          break
        end
      end
    end
    GameTooltip:AddDoubleLine("Item ID: ", itemID, nil, nil, nil, 0.2, 0.7, 1)
  end
end

function TipTop_Item:AddItemIDToItemRefTooltip()
  local itemLink = select(2, ItemRefTooltip:GetItem())
  if not itemLink then
    return
  else
    local itemID = string.match(itemLink, "item:(%d*)")
    ItemRefTooltip:AddDoubleLine("Item ID: ", itemID, nil, nil, nil, 0.2, 0.7, 1)
  end
end
