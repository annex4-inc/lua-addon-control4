---@meta

---@class C4Ping
---@field Ping fun(self: C4Ping, endpoint: string, rounds: number) : C4Ping # The Ping method "pings" a specified endpoint by sending one, or more, ICMP "Echo" packets to the endpoint. 
---@field SetOnResult fun(self: C4Ping, callback: fun(self: C4Ping, success: boolean, error: string | nil)): C4Ping