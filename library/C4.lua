--- @meta

C4 = {}

--- Removes a key/value pair from the Registry.
--- @param key string The key to be removed from the Registry
function C4:RegistryDeleteValue(key) end

--- Retrieves a value from the Registry.
--- @param key string The key for the value to be retrieved from the Registry
--- @return number | string | boolean | table
function C4:RegistryGetValue(key) end

--- Function that returns the version of Director that is currently running. This API can be invoked during OnDriverInit.
--- @return GetVersionInfoResult
function C4:GetVersionInfo() end

--- Function to notify director that data from this driver has been modified and needs to be persisted. This API should not be invoked during OnDriverInit.
function C4:InvalidateState() end

--- Encodes a given string with the specified data encoding.
--- @param data string
--- @param data_encoding EncodeDataEncoding
--- @return string result
--- @return string error
function C4:Encode(data, data_encoding) end

---Encrypts a given string with the specified cipher, using the specified key and IV.
---@param cipher any
---@param key any
---@param iv any
---@param data any
---@param options any
function C4:Encrypt(cipher, key, iv, data, options) end

--- 
function C4:Decode(data, data_encoding) end

--- 
function C4:Decrypt(cipher, key, iv, data, options) end

--- This API will generate a certificate signing request (CSR) which, when sent to a certificate authority, will return a digital identity certificate that meets the encryption criteria defined by Elliptic-curve cryptography (ECC) standard. The use of this API assumes a thorough knowledge of public-key cryptosystems and the ECC cryptosystem definition.
function C4:GenerateCSR_ECC(digest, curve, subject, tx509_exts) end

--- This API will generate a certificate signing request (CSR) which, when sent to a certificate authority, will return a digital identity certificate that meets the encryption criteria defined by the Rivestâ€“Shamirâ€“Adleman (RSA) standard. The use of this API assumes a thorough knowledge of public-key cryptosystems and the RSA cryptosystem definition.
function C4:GenerateCSR_RSA(digest, sizeCert, subject, tx509_exts) end

--- Returns the list of ciphers supported by the Encrypt and Decrypt functions.
function C4:GetSupportedCiphers() end

--- Returns the list of digests supported by the Hash, HMAC and PBKDF2 functions.
function C4:GetSupportedDigests() end

--- Hashes a given string with the specified digest.
function C4:Hash(digest, data, options) end

--- Computes a hash-based message authentication code (HMAC) for a given string using the specified key.
function C4:HMAC(digest, key, data, options) end

--- Load a certificate and private key from a #PKCS12 file.The Lua PKCS #12 interface enables drivers to manage certificates and private keys using the PKCS #12file format. These files are encrypted and protected by a password. This ensures that cryptographic assets are secure and are not easily recovered.
function C4:LoadPKCS12(filename, password) end

--- Performs a Password-Based Key Derivation Function 2 (PKCS#5) (PBKDF2) for a given password using the specified digest, salt, number of iterations and desired output key length.
function C4:PBKDF2(digest, password, salt, iterations, key_length, options) end

--- Sign enables drivers to crypto-graphically sign an arbitrary payload using a specified key. The API currently supports both HMAC &amp; RSA signing. Control4 strongly recommends thatdriver developers implement this new API beginning with OS Release 3.1.0. This API is the best solution to cryptographically sign a payload. Control4 recommends its use rather than other Lua libraries.
---@param operation any
---@param digest any
---@param key any
---@param data any
---@param options? any
function C4:Sign(operation, digest, key, data, options) end

--- Writes a certificate and private key to a specified #PKCS12 file.The Lua PKCS #12 interface enables drivers to manage certificates and private keys using the PKCS #12file format. These files are encrypted and protected by a password. This ensures that cryptographic assets are secure and are not easily recovered.
function C4:WritePKCS12(filename, password, certificate, key, label, options) end

--- Function called from DriverWorks driver to add a new Event. This API should not be invoked during OnDriverInit.
function C4:AddEvent(num, str, str) end

--- Function called from DriverWorks driver to delete an Event. This API should not be invoked during OnDriverInit.
function C4:DeleteEvent(num) end

--- Function called from DriverWorks driver to Fire a static or Dynamic Event on the driver. This API should not be invoked during OnDriverInit.
function C4:FireEvent(strEvent) end

--- Function called from DriverWorks driver to Fire a static or Dynamic Event (using the Event's ID Value) on the driver. This API should not be invoked during OnDriverInit.
function C4:FireEventByID(num) end

--- This API allows for a driver to register for another driver's event. The device ID passed is the ID of the device that is firing the event of interest. This is followed by the event ID.
function C4:RegisterDeviceEvent(deviceId, eventId) end

--- Creates a registration for a notification when a system event fires.
function C4:RegisterSystemEvent(systemEventId, deviceId) end

--- This API unregisters all prior event registrations created by the RegisterDeviceEvent API. 
function C4:UnregisterAllDeviceEvents() end

--- Un-registers from all notification of all system events.
function C4:UnregisterAllSystemEvents() end

--- Un-registers a notification when a system event fires.
function C4:UnregisterSystemEvent(eventId, deviceId) end

--- This API unregisters prior event registration created by the RegisterDeviceEvent API. The device ID passed is the ID of the device that is firing the registered event. This is followed by the event ID.
function C4:UnregisterDeviceEvent(deviceId, eventId) end

--- Used to close an opened file handle. This API can be invoked during OnDriverInit.
function C4:FileClose(nFileHandle) end

--- Used to delete a file on the file system. This call will fail if there is a opened handle to the file. This function takes a file name to delete and returns a bool if the delete succeeded. This API can be invoked during OnDriverInit.
function C4:FileDelete(strFileName) end

--- Used to see if a file exists on the file system. This function takes a file name and returns a bool if the file exists. This API can be invoked during OnDriverInit.
function C4:FileExists(strFileName) end

--- Used to see how much free space exists on the file system in bytes. This API can be invoked during OnDriverInit.
function C4:FileFreeSpace() end

--- Used to see if a file is still valid to be written or read from.This is useful to check before or after reading to see if an end of file condition has been reached.This function returns a bool of the file status. This API can be invoked during OnDriverInit.
function C4:FileIsValid(nFileHandle) end

--- Used to get the name of an opened file handle. This function takes a file handle and returns a string of the file name.An empty string is returned if the file handle is not valid. This API can be invoked during OnDriverInit.
function C4:FileGetName(nFileHandle) end

--- Used to get the current read or write position for the file. This function takes a file handle and returns the current position. This API can be invoked during OnDriverInit.
function C4:FileGetPos(nFileHandle) end

--- File to get the current size of an opened file handle. This API can be invoked during OnDriverInit.
function C4:FileGetSize(nFileHandle) end

--- Used to open (if file exists) or create a new file. This function takes a file name, returns a handle. A value of -1 is returned if an error. This API can be invoked during OnDriverInit.
function C4:FileOpen(strFilename) end

--- Used to retrieve a table of all the opened file handles in your sandbox or nil if none are opened.The table is index = file handle and value=file name. This API can be invoked during OnDriverInit.
function C4:FileGetOpenedHandles() end

--- Used to retrieve a table of all the files that are present or nil if none exist. This API can be invoked during OnDriverInit.
function C4:FileList() end

--- Used to read data from a file. Returns an empty string if no bytes are read. This function takes a file handle and number of bytes to be read. If an end of file is reached with this read operation, a string of what data was read is returned and any subsequent calls to FileRead will return an empty string. Use the FileIsValid call to see if and end of file condition has been reached. This API can be invoked during OnDriverInit.
function C4:FileRead(int, number) end

--- Used to set the position within the file to read or write from.This function takes a file handle and number for the new position. This API can be invoked during OnDriverInit.
function C4:FileSetPos(int, number) end

--- Used to write data to a file. This function returns the number of bytes written or -1 if file is not valid (example file has been closed).This function takes a file handle, the number of bytes of the string to be written, and a string of data to be written. This API can be invoked during OnDriverInit.
function C4:FileWrite(int, number, string) end

--- Function to write a string to an opened file handle.
function C4:FileWriteString(int, string) end

--- The AddDevice API provides the ability for a driver to add a device driver to a project. The ability to specify the location of the driver within the project as well as naming the device is also supported by the API.
function C4:AddDevice(strDriverName, nRoomId, strNewName, fnCallback) end

--- The AddLocation API provides the ability for a driver to add a location to a project. The locations that can be added are those available in a Control4 project. This includes:
function C4:AddLocation () end

--- Note the order of the parameters passed in the Bind API. Each has a \"Provider\" and \"Consumer\" designation. The Provider designation represents the Device ID value of the device providing the data within the binding. To verify if a device driver is a Provider, go to the driver's &lt;Connections&gt; XML.This API provides the ability to create a binding between two devices: a \"Provider Device\" and a \"Consumer Device.\" The binding creation through this API is the same as manually creating a binding in ComposerPro's The &lt;consumer&gt; XML tag for this device's driver will be False or: &lt;consumer&gt;False&lt;/consumer&gt;. Subsequently, the Provider Binding ID value is the Provider device's binding value.
function C4:Bind(idDeviceProvider, idBindingProvider, idDeviceConsumer, idBindingConsumer, strClass) end

--- Function to decrypt using Blowfish in ECB mode. ECB mode operates on exactly 64 bits (8 bytes) of data. This API can be invoked during OnDriverInit.
--- @param str string Encrypted Data
function C4:blowfishEcbDecrypt(str) end

--- Function to encrypt using Blowfish in ECB mode. ECB mode operates on exactly 64 bits (8 bytes) of data. This API can be invoked during OnDriverInit.
function C4:blowfishEcbEncrypt() end

--- API that makes calling functions asynchronously much easier. This API should not be invoked during OnDriverInit.
function C4:CallAsync() end

--- EvaluateConditional evaluates the expression and returns a Boolean result. This API has 3 parameters, a logic operator and two operands. â€˜value1â€™ is the left operand and â€˜value2â€™ is the right operand. 
function C4:EvaluateExpression(logic, value1, value2) end

--- Function that will return the directory path on the controller where driver.c4i files reside.
function C4:GetC4iDir() end

--- Function that will return the directory path on the controller where driver.c4z files reside.
function C4:GetC4zDir() end

--- Function that will return the directory path on the controller where log files reside.
function C4:GetLogDir() end

--- Returns the Project's current Time Zone in the form of a LUA string. If there is no Time Zone set for the project, such as in the case of an unidentified controller, an empty string is returned.
function C4:GetTimeZone () end

--- Helper function which turns a XML document into a .lua table of parsed XML data. This API can be invoked during OnDriverInit.
function C4:ParseXml(str) end

--- Helper Function that writes history events to the History Agent database. 
function C4:RecordHistory(severity, eventType, category, subcategory, description) end

--- Function called from DriverWorks driver to convert a text string of hex into a string with hex values in it. Typically used when a protocol sends commands that are hex values. Note that for convenience, the print function can be called without prefacing with C4: This API can be invoked during OnDriverInit.
function C4:tohex(strHex) end

--- String helper function to convert a number to a string using the â€˜Câ€™ locale regardless of the locale setting of the Control4 Operating System. Some countries use commas instead of decimal points for floating point numbers. Lua â€˜tostringâ€™ command and string concatenation (..) with a number variable will convert the decimal value from a decimal point to a comma in some countries (locales). There may be instances where you do not want this conversion to take place and want the floating-point number to always be represented using a decimal point as opposed to a comma. In these cases, the C4:ToStringLocaleC(num) command can be used to convert the number to a string using decimal points.
function C4:ToStringLocaleC (num) end

--- This API provides the ability to unbind bound devices. The unbinding of the devices binding through this API is the same as manually unbinding two devices in ComposerPro's Connections area. Note the parameters passed in the API. Both have \"Consumer\" designation. These parameters represent the device that consumes data from the Provider device. To verify if a device driver is a Consumer, go to the driver's &lt;Connections&gt; XML. The &lt;consumer&gt; XML tag for this device's driver will be True or: &lt;consumer&gt;True&lt;/consumer&gt;. Subsequently, the Consumer Binding ID value is the Consumer device's binding value.
function C4:Unbind(idDeviceConsumer, idBindingConsumer) end

--- \"Escapes\" the passed in string rendering any XML characters (only &amp;, &lt;, and &gt;) in the string as characters that are valid in an XML value. This API should not be invoked during OnDriverInit.
function C4:XmlEscapeString(strRawInput) end

--- Function called from DriverWorks driver to send an IR Code. This API should not be invoked during OnDriverInit.
function C4:SendIR(idBinding,idIRCode) end

--- Causes Director to start sending the specified IR Code out the specified binding. This is typically used on button press events. This API should not be invoked during OnDriverInit.
function C4:SendIRStart(idBinding, idBinding, idIRCode) end

--- Causes Director to stop sending the specified IR Code out the specified binding. This is typically used on button release events. This API can be invoked during OnDriverInit.
function C4:SendIRStop(idBinding,idBinding, idIRCode) end

--- JSON function that takes the data in the Lua tCommand table and encodes it into a JSON formatted command string representing a Lua object. On success, this function returns a single value which is as designed. On failure, the function returns two values:
function C4:JsonEncode(json, formatted, encodeArray, symmetric) end

--- JSON function that takes data from the JSON formatted string message and decodes it into the Lua table. On success, this function returns a single value which is as designed. On failure, the function returns two values:
function C4:JsonDecode(json, decodeNull) end

--- Function called from DriverWorks driver to send messages to the following log files: director.log and driver.log.
function C4:ErrorLog(strLogText) end

--- This method closes an established connection, or cancels a pending resolve or connection request. If a resolve or connection request is canceled, the OnError callback function will get called. This API should not be invoked during OnDriverInit. Once you call this method, no more data will be read from the socket and you can no longer write additional data to the socket. Also, the OnWrite callback will not be called anymore, even if the flush argument is set to true.
function C4:Close(flush) end

--- This method initiates a connection request to a host and service/port. If a connection request is already in progress, this function returns nil. This API should not be invoked during OnDriverInit.
function C4:Connect(host, service) end

--- This method returns a table with the IP address and port of the local endpoint.This API should not be invoked during OnDriverInit.
function C4:GetLocalAddress() end

--- This method returns a table with the IP address and port of the remote endpoint.This API should not be invoked during OnDriverInit.
function C4:GetRemoteAddress() end

--- This method sets a callback method that will be called once the endpoint has been chosen and the connection is successfully established.
function C4:OnConnect(func) end

--- This method sets a callback method that will be called when the client gets disconnected.
function C4:OnDisconnect(func) end

--- This method sets a callback method that will be called when an error happens during an asynchronous operation.
function C4:OnError(func) end

--- This method sets a callback method that will be called once data has been read on the socket. If you would like to keep reading more data, you should call one of the Read() methods prior to returning from this callback function.
function C4:OnRead(func) end

--- This method sets a callback method that is called once the host/service has been resolved. If implemented, it allows you to choose a particular endpoint to connect to, or to cancel the connection request.
function C4:OnResolve(func) end

--- This method sets a socket option. This API should not be invoked during OnDriverInit.
function C4:Option(name, value, ...) end

--- This method requests to read at least as many bytes as specified by the min argument.Once at least this amount of data is available, all available data is passed to the OnRead callback. This API should not be invoked during OnDriverInit.
function C4:ReadAtLeast(min) end

--- This method requests to read data until a specific condition is met. This API should not be invoked during OnDriverInit.
function C4:ReadUntil(arg) end

--- This method requests to read data until (and including) one of the bytes in the str argument is encountered. This API should not be invoked during OnDriverInit.
function C4:ReadUntilOneOf(str) end

--- This method requests to read data until (and including) any byte that is not in the str argument is encountered. This API should not be invoked during OnDriverInit.
function C4:ReadUntilOneNotOf(str) end

--- This method requests to read any available data up to (and including) the number of bytes specified by the max argument. Once data is available, the OnRead callback will be called with whatever data was available, but no more than the limit specified in the max argument. This API should not be invoked during OnDriverInit
function C4:ReadUpTo(max) end

--- This method starts a listen request to listen on a particular host/service. Once the host/service has been resolved and an endpoint has been chosen, the OnListen callback function will be called. This indicates that the server is now ready to accept incoming connections. If errors occur, the OnError callback function will be called instead. This API should not be invoked during OnDriverInit.
---@param host any
---@param service any
---@param backlog? any
function C4:Listen(host, service, backlog) end

--- This method sets a callback method that will be called whenever a new client connection has been accepted by the TCP server.
function C4:OnAccept(func) end

--- This method sets a callback method that will be called once the TCP server starts listening. This callback is called once the host/service has been resolved and the endpoints has been chosen. It is optional to implement this callback method.
function C4:OnListen(func) end

--- The examples used in the Albums section of this document will reference the following albums:
function C4:MediaAddAlbumInfo () end

--- This API should not be invoked during OnDriverInit.
function C4:MediaGetAlbumInfo() end

--- This API should not be invoked during OnDriverInit.
function C4:MediaGetAlbumLocations() end

--- This API should not be invoked during OnDriverInit.
function C4:MediaGetAllAlbums() end

--- This API should not be invoked during OnDriverInit.
function C4:MediaRemoveAlbum() end

--- This API should not be invoked during OnDriverInit.
function C4:MediaRemoveAllAlbums() end

--- This API should not be invoked during OnDriverInit.
function C4:MediaModifyAlbumInfo() end

--- This function is used to add a new broadcast video station media entry. This API should not be invoked during OnDriverInit. 
function C4:MediaAddBroadcastVideoInfo() end

--- This function is used to retrieve all the broadcast video stations associated with this device. This API should not be invoked during OnDriverInit.
function C4:MediaGetAllBroadcastVideo() end

--- This function is used to get information about an existing broadcast audio media entry. This API should not be invoked during OnDriverInit.
function C4:MediaGetBroadcastVideoInfo() end

--- Modifies a broadcast video channel. This API should not be invoked during OnDriverInit.
function C4:MediaModifyBroadcastVideoInfo() end

--- This function is used to remove a video station from the system. This API should not be invoked during OnDriverInit.
function C4:MediaRemoveBroadcastVideo() end

--- Function that returns the what the device context is currently set to. If â€œ0â€ then all media APIs are using the current driverâ€™s device id. This API should not be invoked during OnDriverInit.
function C4:MediaGetDeviceContext() end

--- Removes all albums songs and movies from the device. This API should not be invoked during OnDriverInit.
function C4:MediaRemoveAllMedia() end

--- Function that sets a device id to be used for media related call. If set to any value other than â€œ0â€ then adding, modifying, retrieving or removing functionality will use the supplied device id. Note that this API must be called in the OnDriverLateInit area of the device driver.
function C4:MediaSetDeviceContext() end

--- To enable a receiver to be capable of being the onscreen device, add the following to your &lt;connections&gt; section of your driver. This will then allow the room's onscreen input to be hooked up to the receiverâ€™s output. Note that for the sections to be valid, a video path must also exist (the room must also be able to select the receiver as the video endpoint).
function C4:MediaAddMovieInfo () end

--- This API should not be invoked during OnDriverInit.
function C4:MediaGetAllMovies() end

--- This API should not be invoked during OnDriverInit.
function C4:MediaGetMovieInfo() end

--- This API should not be invoked during OnDriverInit.
function C4:MediaGetMovieLocations() end

--- This API should not be invoked during OnDriverInit.
function C4:MediaRemoveMovie() end

--- This API should not be invoked during OnDriverInit.
function C4:MediaRemoveAllMovies() end

--- This API should not be invoked during OnDriverInit.
function C4:MediaModifyMovieInfo() end

--- This API should not be invoked during OnDriverInit.
function C4:MediaAddSongInfo() end

--- This API should not be invoked during OnDriverInit.
function C4:MediaGetSongLocation() end

--- This API should not be invoked during OnDriverInit.
function C4:MediaRemoveSong() end

--- This API should not be invoked during OnDriverInit.
function C4:MediaLinkSongToAlbum() end

--- This API should not be invoked during OnDriverInit.
function C4:MediaGetSongsforAlbum() end

--- This API should not be invoked during OnDriverInit.
function C4:MediaModifySongInfo() end

--- Function called by a DriverWorks driver to add a dynamic binding (a binding added at runtime). This is typically done by security panels or other devices whose number of bindings are unknown when the driver is created.
function C4:AddDynamicBinding(idBinding, strType, bIsProvider, strName, strClass, bHidden, bAutoBind) end

--- Beginning with OS release 2.6.0, default runtime editing of encrypted drivers has been deprecated. This has been done to better protect encrypted drivers from unwanted code review or hacking. The AllowExecute API allows for the runtime editing of encrypted drivers through its setting. The API defaults to a setting of False. When set to True, the lua command window will not support entry of any data and the lua output window cannot be used as a display. Use of this API allows driver developers to build into their driver the option to enable remote execution permanently or embed the function call within your own debugging functions to allow or disallow executing of commands in Composer. This API can be invoked during OnDriverInit.
function C4:AllowExecute() end

--- Function called in a DriverWorks driver to encode the specified string as a Base64-encoded string. This API can be invoked during OnDriverInit.
function C4:Base64Encode(strToEncode) end

--- Function called in a DriverWorks driver to decode the specified string from a Base64-encoded string. This API can be invoked during OnDriverInit.
function C4:Base64Decode(strToDecode) end

--- Function called from DriverWorks driver to get a capability from the driver. This API should not be invoked during OnDriverInit.
function C4:GetCapability(strName) end

--- This API returns data found in the driver's device data, &lt;devicedata&gt; XML. The Device ID of the driver value must be passed to return the XML content. An optional string value parameter can be passed to retrieve specific XML data.
function C4:GetDeviceData() end

--- Function used to obtain the Device ID and the Room ID assigned to a device in the project. This API should not be invoked during OnDriverInit.
function C4:GetDeviceByName(str) end

--- Function called from DriverWorks driver to get this driverâ€™s Device ID. This API should not be invoked during OnDriverInit.
function C4:GetDeviceID() end

--- Function used to obtain a Device's variables. This API should not be invoked during OnDriverInit.
function C4:GetDeviceVariables() end

--- Function that returns the XML contents of a driver's config.xml file. This API should not be invoked during OnDriverInit.
function C4:GetDriverConfigInfo() end

--- Function to get the current locale of the system. This API should not be invoked during OnDriverInit.
function C4:GetLocale() end

--- If no parameter is passed, this API returns the entire project as an .XML string. This string can then be parsed to retrieve variable IDs. The API supports several parameters (filters) that will return specific XML. This API should not be invoked during OnDriverInit.
function C4:GetProjectItems() end

--- Function that returns the controller type used as the primary controller in a project. Returns OS Info of Windows when called from a Virtual Director environment.
function C4:GetSystemType() end

--- Function to get a string translated into the current locale from a â€œCâ€ (English) input string. This will only return translated strings if there is a corresponding input -&gt; translation match in the current translated string for the set locale. If no translation is found the input string is returned. This API can be invoked during OnDriverInit.
function C4:GetText() end

--- Function to get the unique MAC address of the Director box. This API can be invoked during OnDriverInit.
function C4:GetUniqueMAC() end

--- Function called from DriverWorks driver to get a capability from the driverâ€™s .c4z file. This API should not be invoked during OnDriverInit.
function C4:ntoh_1() end

--- Converts the numeric value passed in to network byte order. This API can be invoked during OnDriverInit.
function C4:htoh_1() end

--- Parses a ISO 8601 date/time stamp to UTC (Coordinated Universal Time). This API can be invoked during OnDriverInit.
function C4:ParseIso8601DateTime(str, strict) end

--- Deletes all values. See PersistGetValue and PersistSetValue
function C4:PersistDeleteAll() end

--- Returns the value associated with the specified name. This API can be used before OnDriverLateInit.
function C4:PersistGetValue(name, encrypted) end

--- Persists a value associated with the specified name. This API can be used before OnDriverLateInit.
function C4:PersistSetValue(name, value, encrypted) end

--- Function called by a DriverWorks driver to remove a dynamically created binding. This API should not be invoked during OnDriverInit. No Events will be sent prior to OnDriverlateInit. If an event is required, this method must be invoked in OnDriverlateInit.
function C4:RemoveDynamicBinding(idBinding) end

--- The RenameDevice API supports the ability to rename a device that is currently in a Control4 project from a driver. This API can be also called from a driver other than that of the device's. This supports that ability to rename project devices externally. This API should not be invoked during OnDriverInit.
function C4:RenameDevice(proxyId, name) end

--- Function to get the ID value of the room containing the driver. This API should not be invoked during OnDriverInit.
function C4:RoomGetID() end

--- Function to force the selection of onscreen for the selected room. This API should not be invoked during OnDriverInit.
function C4:RoomSelectNav (int) end

--- Function to send data to subscribed navigators. This API should not be invoked during OnDriverInit.
function C4:SendDataToUI (xml) end

--- Function that sends a request to another driver. It uses the proxy or protocol ID value of the driver as a means to target the driver where the request will be sent. The driver receiving the SendUIRequest must have an a UIRequest function configured which will contain the return values requested by the SendUIRequest call.
function C4:SendUIRequest (int,string, tParams) end

--- Decrypt the input string with Corrected Block TEA (XXTEA) Algorithm, using the specified key. This API can be invoked during OnDriverInit.
function C4:TEADecrypt(strBuf, strKey) end

--- Encrypt the input string with Corrected Block TEA (XXTEA) Algorithm, using the specified key. This API can be invoked during OnDriverInit
function C4:TEAEncrypt(strBuf, strKey) end

--- GetProjectProperty takes a single string parameter from a list of property names. The API returns the value of that property, if it exists.
function C4:GetProjectProperty(propertyName) end

--- Function called from DriverWorks driver to display or hide Properties in Composer's Lua Properties page. This API should not be invoked during OnDriverInit.
function C4:SetPropertyAttribs(strName, int) end

--- Function called from DriverWorks driver to update driver properties. This API should not be invoked during OnDriverInit.
function C4:UpdateProperty(strName, strValue) end

--- Function called from DriverWorks driver to update driver properties. This API should not be invoked during OnDriverInit.
function C4:UpdatePropertyList (strName, strValueList, strValueDefault) end

--- Function that returns the all proxy devices by proxy name. For example, if passed light.c4i it will return a list of all lights in the project. This API should not be invoked during OnDriverInit.
function C4:GetProxyDevicesByName() end

--- Function that returns specific devices by .c4i (driver) name. For example, if passed light_ip_control4_ldz-102-w-c4iit will return a list of all Control4 Wireless dimmers in the project. This API should not be invoked during OnDriverInit.
function C4:GetDevicesByC4iName() end

--- Function called from DriverWorks driver to send a Control4 BindMessage to the proxy bound to the specified binding. This API should not be invoked during OnDriverInit. 
function C4:SendToProxy(idBinding, strCommand, tParams, strmessage) end

--- Sets the value of a Registry key/value pair. The value is updated if the specified key/value pair exists. A key/value pair is created by the API if it does not exist. 
function C4:RegistrySetValue(key, value) end

--- Function that defines a dynamic Network Connection so no Connection XML is required. Further (port-specific configuration) can be accomplished through the use of the NetPortOptions API. Connections are actually made using the NetConnect API. This API should not be invoked during OnDriverInit.
function C4:CreateNetworkConnection (idBinding, strAddress, strConnectionType) end

--- Returns a physical (IP) address of a network binding. This API should not be invoked during OnDriverInit
function C4:GetBindingAddress (idBinding) end

--- Call to retrieve the devices bound to (the consumers of) a binding provided (an output binding) by this device. This API should not be invoked during OnDriverInit.
function C4:GetBoundConsumerDevices () end

--- Call to retrieve what device is attached to an input binding of the specified device. This API should not be invoked during OnDriverInit.
function C4:GetBoundProviderDevices() end

--- Returns the name of the device as shown in Composer. This API should not be invoked during OnDriverInit
function C4:GetDeviceDisplayName () end

--- Returns the MAC Address associated with a device that has already been identified in the Control4 Project. The API uses address resolution protocol (ARP) queries to lookup MAC hardware addresses. It will return a value of nil if the MAC address is not found in the controller's ARP tables. Considerations when using GetDeviceMAC include:
function C4:GetDeviceMAC () end

--- Returns a table that contains the device's discovery information.
function C4:GetDiscoveryInfo(idBinding) end

--- API that returns the bound address of the \"device.\" For example, in the case of a single network binding, GetMyNetworkAddress returns the address of the device that's connected to the driver. This API should not be invoked during OnDriverInit.
function C4:GetMyNetworkAddress() end

--- Function that returns network binding information for a device. 
function C4:GetNetworkBindingsByDevice() end

--- Returns the Proxy ID value when passed a Device ID value. This API should not be invoked during OnDriverInit.
function C4:GetProxyDevicesbyID (idDevice) end

--- Returns the &lt;serialsettings&gt; string from the driver that is connected to the provided control binding. The control binding should be an RS232 provider binding. This API should not be invoked during OnDriverInit.
function C4:GetSerialSettings (idBinding) end

--- Function which dumps the data received from serial (hex format) for inspection via print. It then evaluates the response for specific delimiters and extracts the necessary components which are then used to do something. This API should not be invoked during OnDriverInit.
function C4:ReceivedFromSerial(idBinding, strData) end

--- Function which combines the data received from the network into a variable for processing when the connection status changes. This API should not be invoked during OnDriverInit.
function C4:ReceivedFromNetwork(idBinding, nPort, strData) end

--- Function that allows a TCP/IP device, with an existing connection, to use a different IP Address for connection purposes. This API can be used with both statically created connections (XML) as well as dynamically created ones. It is recommended that the NetConnect API is called after SetBindingAddress. This API should not be invoked during OnDriverInit.
function C4:SetBindingAddress(idBinding, strIPaddress) end

--- Function that enables a Lua driver to explicitly set the \"connected\" state for a connection binding. This can particularly useful for connection bindings that aren't persistent (i.e., always connected), such as HTTP. Such non-persistent connections are marked as Offline (yellow) in the Network Tools windows in Composer. The C4:SetBindingStatus function enables a driver to manage the \"connected\" state of a connection binding, effectively overriding the default behavior provided by Director
function C4:SetBindingStatus(idBinding, strStatus) end

--- Function that enables a Lua driver to send network broadcast messages. The function opens a UDP connection, sets the SO_BROADCAST socket option and then sends a specified payload to the directed broadcast address. For example, 192.168.1.255. If the directed broadcast address is unavailable for any reason then the limited broadcast address is used instead, for example: 255.255.255.255.
function C4:SendBroadcast(payload, port) end

--- Function called from DriverWorks driver to send a Control4 CommandMessage to the specified Control4 device driver. This API should not be invoked during OnDriverInit.
function C4:SendToDevice(idDevice, strCommand, tParams, AllowEmptyValues, logCommand) end

--- Function which sends an HTTP request to a network binding / port. This API should not be invoked during OnDriverInit.
function C4:SendToNetwork(idBinding, nPort, strData) end

--- Simple function which sends the command out serial port on binding 1 and adds the \\r terminator to the end of the command being sent. This API should not be invoked during OnDriverInit.
function C4:SendToSerial(idBinding, strData) end

--- Function that enables a Lua driver to broadcast a Wake-On-Lan magic packet. 
function C4:SendWOL(macAddress, port) end

--- Function used to tell the system to make a connection (static or dynamic). Connections are created using the CreateNetworkConnection API. Further, port-specific configuration can be configured for a connection through the NetPortOptions API. This API should not be invoked during OnDriverInit.
function C4:NetConnect(idBinding, nPort, strIPType) end

--- Function called from DriverWorks driver to disconnect from a specific idBinding and nPort. This API should not be invoked during OnDriverInit.
function C4:NetDisconnect(idBinding, nPort) end

--- Function to configure a connection's Port settings. The use of this API is contingent upon the use of the CreateNetworkConnection and NetConnect APIs. Connections are created using the CreateNetworkConnection API and Connections are made using the NetConnect API. This API should not be invoked during OnDriverInit.
function C4:NetPortOptions(idBinding, nPort, strIPType, tPortParams) end

--- Function called by Director when a network connection has been addressed (â€˜identifiedâ€™ on Network Connections Page) or unaddressed (â€˜disconnectâ€™).
function C4:OnNetworkBindingChanged(idBinding, bIsBound) end

--- Creates a Server Socket, that listens on port nPort, and sends messages to the driver upon receipt of the delimiter, strDelimiter (or upon timeout). This API should not be invoked during OnDriverInit.
function C4:CreateServer(nPort, strDelimiter, bUseUDP) end

--- Destroys any Server Sockets. This API should not be invoked during OnDriverInit.
function C4:DestroyServer(nPort) end

--- This function is used to send data over an open Server Socket connection. This API should not be invoked during OnDriverInit.
function C4:ServerSend(nHandle, strData) end

--- Close a previously open Server Socket connection. This API should not be invoked during OnDriverInit.
function C4:ServerCloseClient(nHandle) end

--- Creates and starts timer. This API should not be invoked during OnDriverInit.
function C4:SetTimer(nDelay, fCallback, bRepeat) end

--- Cancels a transfer that has been started by a call to the Get(), Post(), Put(), Delete(), or Custom() methods. The C4LuaUrl object cannot be re-used after canceling a transfer. A new instance will need to be created by a call to C4:url().
function C4:Cancel() end

--- Starts a HTTP transfer with a custom request method as specified by the method argument.
function C4:Custom(url, method, data, headers) end

--- Starts a HTTP DELETE transfer.
function C4:Delete(url, data, headers) end

--- Starts a HTTP GET transfer.
function C4:Get(url, headers) end

--- Sets a callback function that will be called each time a response body has finished transferring. This function is called after the callback functions set by OnHeaders() and OnBodyChunk() but before the callback function set by OnDone(). Note that this method can only be called before a transfer was started. 
function C4:OnBody(func) end

--- Sets a callback function that will be called each time a chunk of the response body has transferred. This does not necessarily correlate to chunks in the context of the HTTP \"chunked\" transfer encoding. This function may be called multiple times for each response, following the callback function set by OnHeaders() and before the callback function set by OnBody() and OnDone(). Note that this method can only be called before a transfer was started. This callback function is not needed for most use-cases.
function C4:OnBodyChunk(func) end

--- Sets a callback function that will be called when the entire transfer succeeded or failed. It is only called once at the end of the entire transfer regardless of how many responses have been received. Note that this method can only be called before a transfer was started.
function C4:OnDone(func) end

--- Sets a callback function that will be called each time all of the headers of a response have been received but, before the response body has been received. This function may be called multiple times, e.g. due to redirects. Note that this method can only be called before a transfer was started.
function C4:OnHeaders(func) end

--- Starts a HTTP POST transfer.
function C4:Post(url, data, headers) end

--- Starts a HTTP POST transfer.
function C4:Put(url, data, headers) end

--- Sets one option specified by name to value. Note that this method can only be called before a transfer was started. 
function C4:SetOption(name, value) end

--- This API is similar to the SetOption() method, but allows the driver to pass in a table of options and their values. Note that this method can only be called before a transfer was started.
function C4:SetOptions(options) end

--- Returns the Ticket ID (a number) of a running transfer. If the transfer is not running, the value 0 is returned.
function C4:TicketId() end

--- Function called from a DriverWorks driver to create a Control4 variable for the driver. This API should not be invoked during OnDriverInit.
---@param identifier any
---@param strValue any
---@param strVarType any
---@param bReadOnly? any
---@param bHidden? any
function C4:AddVariable(identifier, strValue, strVarType, bReadOnly, bHidden) end

--- Function called from a DriverWorks driver to delete a Control4 variable for the driver. This API should not be invoked during OnDriverInit
function C4:DeleteVariable(identifier) end

--- Function called by a DriverWorks driver to get the value of a variable. This API should not be invoked during OnDriverInit.
function C4:GetVariable(idDevice, idVariable) end

--- Function called by a DriverWorks driver to get the value of another device's variable. This API should not be invoked during OnDriverInit.
function C4:GetDeviceVariable(idDevice, idVariable) end

--- Function called from a DriverWorks driver to set the value of another driver or device's variable. This API should not be invoked during OnDriverInit.
function C4:SetDeviceVariable(DeviceID, variableID, strValue) end

--- Function called from a DriverWorks driver to set the value of the current driver's variable. This API should not be invoked during OnDriverInit
function C4:SetVariable(identifier, strValue) end

--- Function called from a DriverWorks driver to set a listener on a particular deviceâ€™s variable. When a listener is set on a variable, whenever the variable changes, the Lua OnWatchedVariableChanged call is called.
function C4:RegisterVariableListener(idDevice, idVariable) end

--- This API unregisters any/all previously registered variable listeners. It takes no arguments and returns nothing. 
function C4:UnregisterAllVariableListeners() end

--- Function called from DriverWorks driver to remove a listener on a particular device's variable. Variable changes for the particular Device's Variable will no longer be reported. This API will not work if a variable has not been registered, added or does not exist.
function C4:UnregisterVariableListener(idDevice, idVariable) end

--- Utilizes a more flexible callback-based object interface. A call to this function returns a C4LuaUrl object that can be set up with various callback functions and options. Once set up, a call to its methods: Get(), Post(), Put(), Delete(), or Custom() initiates the transfer.
--- @return C4LuaUrl
function C4:url() end

--- Function to cancel an ongoing transfer. Note that if a transfer is canceled, neither the ReceivedAsync() entry point nor the callback function specified in the C4:url call will be called. Also, the ticketId is only valid from the point the C4:url function is called until either the ReceivedAsync() entry point or the callback function was called. A call to C4:urlCancel() will also invalidate that ticketed. This API should not be invoked during OnDriverInit
function C4:urlCancel(ticketId) end

--- This method cancels all ongoing transfers and returns an array with the ticket ids of the transfers that were canceled. This API should not be invoked during OnDriverInit.
function C4:urlCancelAll() end

--- Function to clear all cookies from a driver's cookie jar.
function C4:urlClearCookies() end

--- Function to clear all session cookies from a driver's cookie jar.
function C4:urlClearSessionCookies() end

--- Function to retrieve cookies from the driver's cookie jar filtered by a specific domain.
function C4:urlGetCookies(domain) end

--- Function to retrieve cookies from the driver's cookie jar filtered by a specific domain.
function C4:urlGetCookiesForDomain(domain) end

--- Function to retrieve cookies from the driver's cookie jar filtered by a specific domain.
function C4:urlGetOption (option) end

--- This method returns an array with the ticket ids of all ongoing transfers. This API should not be invoked during OnDriverInit.
function C4:urlGetTickets() end

--- This function changes the option specified in the option argument to the value provided. The options and their respective value parameters can be one of the two defined in the signature section below. This API should not be invoked during OnDriverInit.NOTE: These options apply to both the 'legacy' C4:urlGet / C4:urlPut / C4:urlPost commands, as well as the newer C4:url() functionality.
function C4:urlSetOption(option, value) end

--- This function is to set server related security information that may be needed in future related url calls. This API should not be invoked during OnDriverInit.
function C4:urlSetProxy(strUrl, nPort, strUsername, strPassword) end

--- This function is to set a maximum time value (in seconds) for a transfer operation to take place before a server time out occurs. The value passed in this API is dependent on driver/Director performance. For example, setting this value too low could result in a timeout occurring too quickly resulting in messages missed. Setting it too high could result in lag time and poor user experience. Control4 recommends an initial setting of 20 seconds and adjusting as needed. This API should not be invoked during OnDriverInit.
function C4:urlSetTimeout(SECONDS) end

--- Returns the un-encoded string containing the firmware update data of the specified BLOB (Binary Large Object). This API should not be invoked during OnDriverInit.
---@param strName string Name of the Binary Large Object to retrieve from the .c4i file
---@return string result Binary data from the driver file.
function C4:GetBlobByName(strName) end

--- Lua function called to retrieve a Zigbee devices user ID. This API should not be invoked during OnDriverInit.
function C4:GetZigbeeEUID() end

--- If a driver takes longer than a minute to upload the firmware data to the device, it should call C4:KeepReflashLock. This request will maintain the reflash lock while updating. If a driver does not call KeepReflashLock, the Reflash Lock will be revoked after approximately one minute. This API should not be invoked during OnDriverInit.
function C4:KeepReflashLock() end

--- This function sends a raw Zigbee packet to a Zigbee Binding. This functionality supports both the current Control 4 (EmberNet) as well as ZigBee Pro 1.1 transports. This API should not be invoked during OnDriverInit.
function C4:SendZigbeePacket(strPacket,nProfileID, nClusterID, nGroupID, nSourceEndpoint, ndestinationEndpoint) end

--- Function to terminate the request for firmware data upon completion of update. This API should not be invoked during OnDriverInit.
function C4:ReleaseReflashLock() end