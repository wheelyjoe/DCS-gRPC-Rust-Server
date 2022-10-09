--
-- RPC unit actions
-- https://wiki.hoggitworld.com/view/DCS_Class_Group
--

local GRPC = GRPC

GRPC.methods.getUnits = function(params)
  -- https://wiki.hoggitworld.com/view/DCS_func_getByName
  local group = Group.getByName(params.groupName)
  if group == nil then
    return GRPC.errorNotFound("group does not exist")
  end

  -- https://wiki.hoggitworld.com/view/DCS_func_getUnits
  local units = group:getUnits()

  local result = {}
  for i, unit in ipairs(units) do
    if params.active == nil or params.active == unit:isActive() then
      result[i] = GRPC.exporters.unit(unit)
    end
  end

  return GRPC.success({units = result})
end

GRPC.methods.isExist = function(params)
-- https://wiki.hoggitworld.com/view/DCS_func_isExist
    local group = Group.getByName(params.groupName)
    local result = {}
    if group == nil then
        return GRPC.errorNotFound("group does not exist")
    end
    local exist = Group.isExist(group)
    result["result"] = exist
    return GRPC.success(result)
end