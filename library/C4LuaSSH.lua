---@meta

---@class C4LuaSSH
local class = {}

--- Attempts to establish a connection to a remote device
---@param endpoint string The endpoint to which the SSH connection is to be established. This can be either a host name or an IP address. If the caller specifies a host name, the C4SSH object will attempt to resolve the IP address of the endpoint before connecting.
---@param username string The username with which to log in to the remote device.
---@param password string The password to use when logging in to the remote device. This value can be empty if no password is required.
---@param port number The port to use when establishing a connection to the remote device. If omitted, then the default port of 22 is used.
function class:Connect(endpoint, username, password, port) end

--- Sends a command to a remote device
---@param command string The command to be sent to the remote device.
---@return C4LuaSSH | nil self
---@return string error A message describing the failure
function class:Send(command) end

--- Closes the connection
---@return C4LuaSSH self
function class:Disconnect() end

---Sets the amount of time the C4SSH object waits before determining that an attempt to establish a connection to an endpoint has failed
---@param timeout number The number of seconds to wait before determining that an attempt to establish a connection has failed. The default is 30 seconds.
function class:SetConnectTimeout(timeout) end

---Sets the callback function that is invoked when a client connection has been established
---@param callback function A callback function to be invoked when a connection has been established.
function class:SetOnConnected(callback) end

---Sets the callback function that is invoked when data has been read from a connection
---@param callback function A callback function to be invoked when data has been read from a connection.
function class:SetOnData(callback) end

---Sets the callback function that is invoked when a connection is disconnected or has otherwise failed
---@param callback function A callback function to be invoked when a connection is disconnected or has otherwise failed.
function class:SetOnDisconnnected(callback) end