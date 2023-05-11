---@meta

---@class C4LuaUrl
---@field OnDone fun(self, OnDoneHandler: fun(self, responses, errorCode, errorMessage: string)) # Sets a callback function that will be called when the entire transfer succeeded or failed. It is only called once at the end of the entire transfer regardless of how many responses have been received. Note that this method can only be called before a transfer was started.
---@field SetOptions fun(self, options: C4LuaUrlOptions)
---@field Get fun(self, url: string, table: C4LuaUrlOptions)
---@field Cancel fun()

---@class C4LuaUrlOptions
---@field fail_on_error boolean
---@field timeout number Timeout in seconds
---@field connect_timeout number Connection timeout in seconds