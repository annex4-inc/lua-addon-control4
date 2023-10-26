---@meta

---Function called by Director when a command is received for this DriverWorks driver.
---@param strCommand string The command
---@param tParams table Table of command parameters 
function _G.ExecuteCommand(strCommand, tParams) end

---This callback API supports password protection for SSL Certificates that are embedded within a device driver. ImplementingGetPrivateKeyPasswordwithin a driver permits a password to be returned for a binding which requires an SSL Certificate. When implemented correctly, this API will return the string value of the SSL Certificate password. Use of this API is recommended in conjunction with encrypted drivers. This API can be invoked during OnDriverInit.
---@param bindingId number Binding ID of the network connection with the password-protected certificate.
---@param port number Port number for the networkconnection with the password-protected certificate.
---@return string string String value of the SSL Certificate password
function _G.GetPrivateKeyPassword(bindingId, port) end

---Called when a device sends a UI Request to this device
---@param request string
---@param params table
function _G.UIRequest(request, params) end

---Function called by Director when a binding changes state (bound or unbound).
---@param idBinding number ID of the binding whose state has changed.
---@param strClass string Class of binding that has changed. A single binding can have multiple classes: COMPONENT, STEREO, etc. This indicates which has been bound or unbound.
---@param bIsBound boolean Whether the binding has been bound or unbound.
---@param otherDeviceId number This Device ID value represents the Device ID for the device that makes up the other half of this binding.
---@param otherBindingId number This Binding ID value represents the Binding ID for the device represented by the otherDeviceID value in the parameter above.
function _G.OnBindingChanged(idBinding, strClass, bIsBound, otherDeviceId, otherBindingId) end

---Called when a driver is deleted from a project, updated within a project or Director is shut down. All of the driver's timers will be killed within the OnDriverDestroyed function.
---@param strDit DestructionMethod This optional parameter indicates the scenario in which the driver is destroyed
function _G.OnDriverDestroyed(strDit) end

---Function that serves as a callback into a project after the project is loaded. If any initialization has to occur after the project is loaded, it must occur in OndriverLateInit. See the safe usage table for a list of APIs that can be invoked before OnDriverLateInit is executed.
---@param strDit? InitializationMethod This optional parameter indicates the scenario in which the driver is initializin
function _G.OnDriverLateInit(strDit) end

---Function invoked when a driver is loaded or being updated. This API is provided for the driver developer to initialize all of the driver objects that require initialization.
---@param strDit? InitializationMethod This optional parameter indicates the scenario in which the driver is initializing
function _G.OnDriverInit(strDit) end

---Function called by Director when a property changes value.
---@param strProperty string Name of property that has changed.
function _G.OnPropertyChanged(strProperty) end

---Function which dumps the data received from serial (hex format) for inspection via print. It then evaluates the response for specific delimiters and extracts the necessary components which are then used to do something. This API should not be invoked during OnDriverInit.
---@param idBinding number ID of the serial interface the data was received on
---@param strData string Data received from the serial interface
function _G.ReceivedFromSerial(idBinding, strData) end

---Function called by Director when a proxy bound to the specified binding sends a BindMessage to the DriverWorks driver. This API should not be invoked during OnDriverInit.
---@param idBinding number Binding ID of the proxy that sent a BindMessage to the DriverWorks driver.
---@param strCommand string Command that was sent
---@param tParams table Lua table of received command parameters
function _G.ReceivedFromProxy(idBinding, strCommand, tParams) end

---Function which combines the data received from the network into a variable for processing when the connection status changes. This API should not be invoked during OnDriverInit.
---@param idBinding number Binding ID of the interface the data was received from
---@param nPort number Network Port the data was received on
---@param strData string Network data from the specified binding and port
function _G.ReceivedFromNetwork(idBinding, nPort, strData) end

---This function is used in conjunction with urlGet and urlPost. It handles the data contained in the data ticket. As soon as data is returned from getUrl, Director will call this in the Lua code. This API should not be invoked during OnDriverInit.
---@param ticketId number Number representing the data ticket
---@param strData string String representing the data contained in the ticket
---@param responseCode unknown Response code
---@param tHeaders table Lua table of response headers
---@param strError string String representing the error content
function _G.ReceivedAsync(ticketId, strData, responseCode, tHeaders, strError) end

---Function called by Director when one of this driver’s variables’ values is changed.
---@param strName string Name of variable that has changed
function _G.OnVariableChanged(strName) end

---Function called by Director when a Control4 variable changes value.
---@param idDevice number Device ID of the device that owns the changed variable
---@param idVariable number Variable ID of the changed variable
---@param strValue string  	New value of variable that has changed
function _G.OnWatchedVariableChanged(idDevice, idVariable, strValue) end

---Function based on this return from the system used to process communication.
---@param idBinding number ID of the network binding whose status has changed
---@param nPort number Port number whose status has changed
---@param strStatus Status Status
function _G.OnConnectionStatusChanged(idBinding, nPort, strStatus) end

---The OnServerStatusChanged callback is invoked to notify a driver that the status of a server has changed. More specifically, that the server is now either online or offline.
---@param port number The port on which the server is listening.
---@param status Status A string containing the status of the server. This is either "ONLINE" or "OFFLINE”.
---@param identifer any The identifier that was specified when the server was created with either C4:CreateServer.
function _G.OnServerStatusChanged(port, status, identifer) end

---The OnServerConnectionStatusChanged callback is invoked to notify a driver that either: a) a new connection has been accepted by the server; or b) a previously accepted connection is now closed.
---@param handle number A handle to the connection. A driver can use this handle to address the connection in subsequent calls to C4:ServerSend() and C4:ServerCloseClient().
---@param port number The port on which the server is listening.
---@param status Status Status
---@param address string The IP address of the remote endpoint that is connected to the server.
---@param identifier string The identifier that was specified when the server was created with C4:CreateServer.
function _G.OnServerConnectionStatusChanged(handle, port, status, address, identifier) end

---The OnServerDataIn callback is invoked to notify a driver that data has received on a server connection.
---@param handle number A handle to the connection. A driver can use this handle to address the connection in subsequent calls to C4:ServerSend() and C4:ServerCloseClient().
---@param data string The data that was received from the connection.
---@param address string The IP address of the remote endpoint that is connected to the server.
---@param port number The port of the remote endpoint that is connected to the server.
---@param identifier string  The identifier that was specified when the server was created with C4:CreateServer
function _G.OnServerDataIn(handle, data, address, port, identifier) end

---Function called by Director when a network connection has been addressed (‘identified’ on Network Connections Page) or unaddressed (‘disconnect’).
---@param idBinding number ID of the network binding whose status has changed
---@param bIsBound boolean Whether the network binding has a bound address
function _G.OnNetworkBindingChanged(idBinding, bIsBound) end

---This function gets called when the Online status of a Zigbee node changes.
---@param strStatus ZigbeeStatus Status
---@param strVersion string Version
---@param strSkew string Skew
function _G.OnZigbeeOnlineStatusChanged(strStatus, strVersion, strSkew) end

---Function called by Director when a Zigbee device grants communication access. Ensures that the driver is the only one currently granted permission to update the device.
function _G.OnReflashLockGranted() end

---Function called by Director when a driver loses permission to perform a device update.
function _G.OnReflashLockRevoked() end

function _G.OnSystemEvent(data) end

---This is a callback function that is sent to a driver when a device event is fired. The function delivers the Device ID for the device that fired the event and the Event's ID value. 
---@param firingDeviceId number The device ID value of the device firing the event.
---@param eventId number The fired event's ID value.
function _G.OnDeviceEvent(firingDeviceId, eventId) end

---If the .jpeg file from the device is stored on the web or in a cloud, the GetNotificationAttachmentURL API should be included in your driver to return the URL of the file.
---@return string URL
function _G.GetNotificationAttachmentURL() end

---If the .jpeg file is placed on the Control4 controller by the driver, the GetNotificationAttachmentFile API should be included in your driver to return the file.
---@return string file
function _G.GetNotificationAttachmentFile() end

---If the .jpeg file is stored in the memory of the device, the GetNotificationAttachmentBytes API should be included in your driver to return the file. Note that this API has the potential to block data if the driver takes too long to execute the function. If it takes more than one second, a log entry will be created in the director log warning that the driver took too long.
---@return string data Base64Encoded image data
function _G.GetNotificationAttachmentBytes() end

---This API has been included in the event that your driver needs to do any sort of clean-up with the stored .jpeg file. It also provides a notification when the original notification has been sent. This is an optional API and only recommended if cleanup is needed. For example, if it is desirable to remove a temporary image file from your system. 
function _G.FinishedWithNotificationAttachment() end

