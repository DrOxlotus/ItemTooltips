TipTop_Spell = {}
TipTop_Spell.__index = TipTop_Spell

function TipTop_Spell:new()
  local self = {}
  setmetatable(self, TipTop_Spell)
  return self
end

function TipTop_Spell:AddSpellIDToGameTooltip()
  local spellID = select(2, GameTooltip:GetSpell())
  if not spellID then
    return
  else
    GameTooltip:AddDoubleLine("Spell ID: ", spellID, nil, nil, nil, 0.2, 0.7, 1)
  end
end

function TipTop_Spell:AddSpellIDToItemRefTooltip()
  local spellID = select(2, ItemRefTooltip:GetSpell())
  if not spellID then
    return
  else
    ItemRefTooltip:AddDoubleLine("Spell ID: ", spellID, nil, nil, nil, 0.2, 0.7, 1)
  end
end
