ToolAid_Spell = {}
ToolAid_Spell.__index = ToolAid_Spell

function ToolAid_Spell:new()
  local self = {}
  setmetatable(self, ToolAid_Spell)
  return self
end

function ToolAid_Spell:AddSpellIDToGameTooltip()
  local spellID = select(2, GameTooltip:GetSpell())
  if not spellID then
    return
  else
    GameTooltip:AddDoubleLine("Spell ID: ", spellID, nil, nil, nil, 0.2, 0.7, 1)
  end
end

function ToolAid_Spell:AddBuffIDToGameTooltip()
  local buffID = select(10, UnitBuff("mouseover"))
  print(buffID)
  if not buffID then
    return
  else
    GameTooltip:AddDoubleLine("Spell ID: ", buffID, nil, nil, nil, 0.2, 0.7, 1)
  end
end

function ToolAid_Spell:AddDebuffIDToGameTooltip()
  local debuffID = select(10, UnitBuff("mouseover"))
  if not debuffID then
    return
  else
    GameTooltip:AddDoubleLine("Spell ID: ", debuffID, nil, nil, nil, 0.2, 0.7, 1)
  end
end

function ToolAid_Spell:AddAuraIDToGameTooltip()
  local unitAuraID = select(10, UnitAura("mouseover"))
  if not unitAuraID then
    return
  else
    GameTooltip:AddDoubleLine("Spell ID: ", unitAuraID, nil, nil, nil, 0.2, 0.7, 1)
  end
end

function ToolAid_Spell:AddSpellIDToItemRefTooltip()
  local spellID = select(2, ItemRefTooltip:GetSpell())
  if not spellID then
    return
  else
    ItemRefTooltip:AddDoubleLine("Spell ID: ", spellID, nil, nil, nil, 0.2, 0.7, 1)
  end
end
