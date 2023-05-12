---@meta

---@class C4LuaMQTT
---@field Connect fun(self: C4LuaMQTT, host: string, port: number, keepalive: boolean)
---@field Subscribe fun(self: C4LuaMQTT, sub: string, qos: number)
---@field Publish fun(self: C4LuaMQTT, topic: string, payload: string, qos: number, retain: boolean)