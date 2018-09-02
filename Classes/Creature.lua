ToolAid_Creature = {}
ToolAid_Creature.__index = ToolAid_Creature

function ToolAid_Creature:new()
  local self = {}
  setmetatable(self, ToolAid_Creature)
  return self
end

function ToolAid_Creature:AddCreatureIDToGameTooltip()
  if UnitIsPlayer("mouseover") then
    return
  else
    local guid = UnitGUID("mouseover")
    local npcID = select(6, strsplit("-", guid, 7))
    GameTooltip:AddDoubleLine("Creature ID: ", npcID, nil, nil, nil, 0.2, 0.7, 1)
    GameTooltip:Show()
  end
end
