TipTop_Creature = {}
TipTop_Creature.__index = TipTop_Creature

function TipTop_Creature:new()
  local self = {}
  setmetatable(self, TipTop_Creature)
  return self
end

function TipTop_Creature:AddCreatureIDToGameTooltip()
  if UnitIsPlayer("mouseover") then
    return
  else
    local guid = UnitGUID("mouseover")
    local npcID = select(6, strsplit("-", guid, 7))
    GameTooltip:AddDoubleLine("Creature ID: ", npcID, nil, nil, nil, 0.2, 0.7, 1)
    GameTooltip:Show()
  end
end