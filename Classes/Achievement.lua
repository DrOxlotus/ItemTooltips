ToolAid_Achievement = {}
ToolAid_Achievement.__index = ToolAid_Achievement

function ToolAid_Achievement:new()
  local self = {}
  setmetatable(self, ToolAid_Achievement)
  return self
end

function ToolAid_Achievement:AddAchievementIDToGameTooltip()
end
