TipTop_Item = {}
TipTop_Item.__index = TipTop_Item

function TipTop_Item:new()
  local self = {}
  setmetatable(self, TipTop_Item)
  return self
end

function TipTop_Item:AddIDToGameTooltip()
  local itemLink = select(2, GameTooltip:GetItem())
  if not itemLink then
    return
  else
    local itemID = string.match(itemLink, "item:(%d*)")
    if itemID == "" and TradeSkillFrame ~= nil and TradeSkillFrame.IsVisible() and GetMouseFocus().reagentIndex then
      local recipeID = TradeSkillFrame.RecipeList:GetSelectedRecipeID()
      for reagentIndex = 1, 8 do
        if GetMouseFocus().reagentIndex == reagentIndex then
          itemID = C_TradeSkillUI.GetRecipeReagentItemLink(recipeID, reagentIndex):match("item:(%d*)") or nil
          break
        end
      end
    end
    GameTooltip:AddDoubleLine("Item ID: ", itemID, nil, nil, nil, 0.2, 0.7, 1)
  end
end

function TipTop_Item:AddIDToItemRefTooltip()
  local _, itemLink = ItemRefTooltip:GetItem()
  if not itemLink then
    return
  else
    local itemID = string.match(itemLink, "item:(%d*)")
    ItemRefTooltip:AddDoubleLine("Item ID: ", itemID, nil, nil, nil, 0.2, 0.7, 1)
  end
end
