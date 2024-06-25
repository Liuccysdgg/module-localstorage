-- localstorage.lua
local localstorage = {}
localstorage.__index = localstorage

--[[
    创建一个新的 fw_localstorage 对象
    @return 返回一个新的 fw_localstorage 对象
]]
function localstorage.new(db)
    local instance = setmetatable({}, localstorage)
    if db == nil then
        instance.module = fw_localstorage.new()
    else
        instance.module = db    
    end
    
    return instance
end

--[[
    打开本地存储
    @param dirpath 目录路径
    @return 是否成功打开
]]
function localstorage:open(dirpath)
    return self.module:open(dirpath)
end

--[[
    关闭本地存储
]]
function localstorage:close()
    self.module:close()
end

--[[
    清空数据库
]]
function localstorage:clear()
    self.module:clear()
end

--[[
    写入数据
    @param name 名称
    @param value 值
    @return 是否成功写入
]]
function localstorage:write(name, value)
    return self.module:write(name, value)
end

--[[
    读取数据
    @param name 名称
]]
function localstorage:read(name)
    return self.module:read(name)
end

--[[
    删除数据
    @param name 名称
    @return 是否成功删除
]]
function localstorage:del(name)
    return self.module:del(name)
end

--[[
    检查数据是否存在
    @param name 名称
    @return 是否存在
]]
function localstorage:exist(name)
    return self.module:exist(name)
end

function localstorage:self()
    return self.module:self()
end

function localstorage:last_error()
    return self.module:last_error()
end
return localstorage
