---@meta

C4 = {}

---The AddDevice API provides the ability for a driver to add a device driver to a project. The ability to specify the location of the driver within the project as well as naming the device is also supported by the API.
---@param strDriverName string Driver Name - Required. String of the driver name including the driver extension of .c4i or.c4z.
---@param nRoomId? number ID value of the room where the driver will reside.
---@param strNewName? string String of the new name of the driver.
---@param fnCallback function A callback function must be passed as the last parameter. The callback function can be any valid function name. In the example below, a function named OnDeviceAdded has been created. In order to receive data from the AddDevice API, this function must reside in the driver. The callback function takes two parameters: deviceId and, in the case of a Proxy Device, a table to contain all of the IDs of the Proxy devices and the Protocol Driver's ID. See the example to the right.
function C4:AddDevice(strDriverName, nRoomId, strNewName, fnCallback) end

---Function called by a DriverWorks driver to add a dynamic binding (a binding added at runtime). This is typically done by security panels or other devices whose number of bindings are unknown when the driver is created.
---@param idBinding number ID of the dynamic binding.
---@param strType string Type of dynamic binding. Valid types include: CONTROL, PROXY
---@param bIsProvider boolean Provider: Whether the binding is a Provider or a Consumer binding.
---@param strName string Name of binding that will appear in Composerâ€™s connections page.
---@param strClass string Class of dynamic binding that is being created.
---@param bHidden boolean Hidden: Whether the dynamic binding is hidden. Should typically be false.
---@param bAutoBind boolean AutoBind: Whether the dynamic binding should be auto-bound. Should typically be false
function C4:AddDynamicBinding(idBinding, strType, bIsProvider, strName, strClass, bHidden, bAutoBind) end

---Function called from DriverWorks driver to add a new Event. This API should not be invoked during OnDriverInit.
---@param id number ID value of the Event
---@param name string Event Name
---@param description string Event Description where NAME is replaced by the driver name. See Event Description example below.
---@return boolean return True on successful addition of the Event
function C4:AddEvent(id, name, description) end

---The AddLocation API provides the ability for a driver to add a location to a project. The locations that can be added are those available in a Control4 project. This includes:
---@param parentId number ParentID Number - This parameter is the device id of the location (Site, Building, Floor) where the new location is to be added. For example, if adding a new building to a project, this parameter would be the Site ID. If adding a new room to a project, this parameter would be the Floor ID.
---@param name string Name of Location - This parameter is a string value representing the name that will be used for the newly added location. For example: "New Main Floor" or "Master Bathroom". The string passed in this parameter will be displayed in the ComposerPro project tree.
---@param type string Type of Location - This parameter is a string value that defines the type of location being added. Acceptable values include: SITE, BUILDING, FLOOR or ROOM.
---@param image? string Image - This is an optional parameter that provides the ability to use a different image for the location. Valid images are based on the Type of Location. Available images are those images visible in ComposerPro. See Example 4. below for more information.
function C4:AddLocation(parentId, name, type, image) end

--- Adds a C4 Timer
---@deprecated
---@param interval number The interval in unit
---@param unit string
---| 'SECONDS'
---| 'MILLISECONDS'
---@param bRepeat boolean True to repeat, false otherwise
---@return number id The timer identifier
function C4:AddTimer(interval, unit, bRepeat) end

---Function called from a DriverWorks driver to create a Control4 variable for the driver. This API should not be invoked during OnDriverInit.
---@param identifier string | number A string or number that uniquely identifies the variable to be added. If a number it must be greater than zero.
---@param strValue string Initial value of Control4 variable
---@param strVarType VariableType String specifying the Variable Type.
---@param bReadOnly boolean ReadOnly: Optional, defaults to FALSE
---@param bHidden boolean Hidden: Optional, defaults to FALSE. A flag indicating whether the variable is hidden.
---@return boolean result True Indicates that the variable was added successfully.
---@return number id ID of the variable that was added.
function C4:AddVariable(identifier, strValue, strVarType, bReadOnly, bHidden) end

---Beginning with OS release 2.6.0, default runtime editing of encrypted drivers has been deprecated. This has been done to better protect encrypted drivers from unwanted code review or hacking. The AllowExecute API allows for the runtime editing of encrypted drivers through its setting. The API defaults to a setting of False. When set to True, the lua command window will not support entry of any data and the lua output window cannot be used as a display. Use of this API allows driver developers to build into their driver the option to enable remote execution permanently or embed the function call within your own debugging functions to allow or disallow executing of commands in Composer. This API can be invoked during OnDriverInit.
---@param allow boolean True / False
function C4:AllowExecute(allow) end

---Function called in a DriverWorks driver to encode the specified string as a Base64-encoded string. This API can be invoked during OnDriverInit.
---@param strToEncode string String to be encoded in Base64 encoding
---@return string string String encoded in Base64 encoding.
function C4:Base64Encode(strToEncode) end

---Function called in a DriverWorks driver to decode the specified string from a Base64-encoded string. This API can be invoked during OnDriverInit.
---@param strToDecode string String to be decoded from Base64 encoding
---@return string string Decoded from Base64 encoding.
function C4:Base64Decode(strToDecode) end

---Note the order of the parameters passed in the Bind API. Each has a "Provider" and "Consumer" designation. The Provider designation represents the Device ID value of the device providing the data within the binding. To verify if a device driver is a Provider, go to the driver's &lt;Connections&gt; XML.This API provides the ability to create a binding between two devices: a "Provider Device" and a "Consumer Device." The binding creation through this API is the same as manually creating a binding in ComposerPro's The &lt;consumer&gt; XML tag for this device's driver will be False or: &lt;consumer&gt;False&lt;/consumer&gt;. Subsequently, the Provider Binding ID value is the Provider device's binding value.
---@param deviceIdProvider number ID value of the device providing data.
---@param idBindingProvider number Binding ID value of the binding for the Provider Device
---@param deviceIdConsumer number ID value of the device consuming data.
---@param idBindingConsumer number
---@param strClass string The binding connection class.
function C4:Bind(deviceIdProvider, idBindingProvider, deviceIdConsumer, idBindingConsumer, strClass) end

---Creates a 32 bit checksum
---@param strBuf string The buffer to checksum
function C4:CRC32(strBuf) end

---Checks for a license
---@param strName string Name of the resource
---@return boolean result true if valid, false otherwise
function C4:CheckLicense(strName) end

---API that makes calling functions asynchronously much easier. This API should not be invoked during OnDriverInit.
---@param fn function Function to be called asynchronously.
---@return boolean result True or False
function C4:CallAsync(fn) end

---Removes a key/value pair from the Registry.
---@param key string The key to be removed from the Registry
function C4:RegistryDeleteValue(key) end

---Retrieves a value from the Registry.
---@param key string The key for the value to be retrieved from the Registry
---@return number | string | boolean | table
function C4:RegistryGetValue(key) end

---Sets the value of a Registry key/value pair. The value is updated if the specified key/value pair exists. A key/value pair is created by the API if it does not exist. 
---@param key string The name of the key to which the specified value is associated.
---@param value number | string | boolean | table The value to be stored
function C4:RegistrySetValue(key, value) end

---Function that returns the version of Director that is currently running. This API can be invoked during OnDriverInit.
---@return GetVersionInfoResult
function C4:GetVersionInfo() end

---Function to notify director that data from this driver has been modified and needs to be persisted. This API should not be invoked during OnDriverInit.
function C4:InvalidateState() end

---Encodes a given string with the specified data encoding.
---@param data string
---@param data_encoding DataEncoding
---@return string result
---@return string error
function C4:Encode(data, data_encoding) end

---Encrypts a given string with the specified cipher, using the specified key and IV.
---@param cipher Cipher cipher: Valid cipher (see GetSupportedCiphers).     
---@param key string Valid key for specified cipher. Short keys will be padded, long keys will be rejected.
---@param iv string Valid IV for specified cipher. Short IVs will be padded (including empty/nil IVs), long IVs will be rejected
---@param data string Data to encrypt.
---@param options? EncryptOptions Options to specify encoding of inputs and outputs
---@return string result
---@return string | nil error
function C4:Encrypt(cipher, key, iv, data, options) end

---Decodes a given string that was previously encoded with the specified data encoding.
---@param data string Data to decode
---@param data_encoding string data_encoding: string: 'NONE' / 'HEX' / 'BASE64â€™
---@return string result
---@return string|nil err
function C4:Decode(data, data_encoding) end

---Decrypt a given string with the specified cipher, using the specified key and IV.
---@param cipher Cipher cipher: Valid cipher (see GetSupportedCiphers).     
---@param key string Valid key for specified cipher. Short keys will be padded, long keys will be rejected.
---@param iv string Valid IV for specified cipher. Short IVs will be padded (including empty/nil IVs), long IVs will be rejected
---@param data string Data to decrypt.
---@param options? EncryptOptions Options to specify encoding of inputs and outputs
---@return string result
---@return string|nil err
---@see C4.GetSupportedCiphers
function C4:Decrypt(cipher, key, iv, data, options) end

---This API will generate a certificate signing request (CSR) which, when sent to a certificate authority, will return a digital identity certificate that meets the encryption criteria defined by Elliptic-curve cryptography (ECC) standard. The use of this API assumes a thorough knowledge of public-key cryptosystems and the ECC cryptosystem definition.
---@param digest Digest The algorithm used by the certificate. For example, SHA256. See the C4:GetSupportedDigests()API for information on retrieving digests.
---@param curve string The elliptical curve encoding format for the certificate.
---@param subject string The person, organization or device required by the certificate. For example: "/C=US/ST=Utah/L=SLC/O=Foo/OU=Controller Certificates/CN=foo.bar.com
---@param tx509_exts? table Optional table of key/value pairs. Used in the event that the desired certificate contains X.509 encryption data.
---@see C4.GetSupportedDigests
---@return CertificateSigningRequest
function C4:GenerateCSR_ECC(digest, curve, subject, tx509_exts) end

---This API will generate a certificate signing request (CSR) which, when sent to a certificate authority, will return a digital identity certificate that meets the encryption criteria defined by the Rivestâ€“Shamirâ€“Adleman (RSA) standard. The use of this API assumes a thorough knowledge of public-key cryptosystems and the RSA cryptosystem definition.
---@param digest Digest The algorithm used by the certificate. For example, SHA256. See the C4:GetSupportedDigests()API for information on retrieving digests.
---@param sizeCert number The Key size of the certificate. For example, 2048.
---@param subject string The person, organization or device required by the certificate.
---@param tx509_exts? table Optional table of key/value pairs. Used in the event that the desired certificate contains X.509 encryption data.
---@see C4.GetSupportedDigests
function C4:GenerateCSR_RSA(digest, sizeCert, subject, tx509_exts) end

---Returns the list of ciphers supported by the Encrypt and Decrypt functions.
---@return table ciphers Table of supported ciphers. Each element is a key/value pair, where the key is the cipher name and the value is the list of parameters for that cipher.
function C4:GetSupportedCiphers() end

---Returns the list of digests supported by the Hash, HMAC and PBKDF2 functions.
---@return table digests Table of supported digests. Each element is a key/value pair, where the key is the digest name and the value is the list of parameters for that digest.
function C4:GetSupportedDigests() end

---Hashes a given string with the specified digest.
---@param digest Digest Valid digest
---@param data string Data to hash
---@param options? {return_encoding?: DataEncoding, data_encoding?: DataEncoding} Options to specify encoding of inputs and outputs:
---@return string result Encrypted data
---@return string | nil error Description of any error that occurred
---@see C4.GetSupportedDigests
function C4:Hash(digest, data, options) end

---Computes a hash-based message authentication code (HMAC) for a given string using the specified key.
---@param digest Digest Valid digest
---@param key string Key to use for computing HMAC
---@param data string Data to compute HMAC for
---@param options? {return_encoding?: DataEncoding, data_encoding?: DataEncoding, ey_encoding?: DataEncoding }Options to specify encoding of inputs and outputs:
---@return string result Encrypted data
---@return string | nil error Description of any error that occurred
---@see C4.GetSupportedDigests
function C4:HMAC(digest, key, data, options) end

---Load a certificate and private key from a #PKCS12 file.The Lua PKCS #12 interface enables drivers to manage certificates and private keys using the PKCS #12file format. These files are encrypted and protected by a password. This ensures that cryptographic assets are secure and are not easily recovered.
---@param filename string Path to the #PKCS12 file to load
---@param password string The password for unlocking the file.
---@return boolean result Indicates that the load operation was successful
---@return nil | string certificateOrErr The PEM-encoded certificate or error message
---@return string key The PEM-encoded private key
function C4:LoadPKCS12(filename, password) end

---Performs a Password-Based Key Derivation Function 2 (PKCS#5) (PBKDF2) for a given password using the specified digest, salt, number of iterations and desired output key length.
---@param digest string digest: Valid digest (see GetSupportedDigests).     
---@param password string password: Input password to generate PBKDF2 output for
---@param salt string salt: Cryptographic salt to use
---@param iterations number iterations: Number of iterations to run
---@param key_length number key_length: Number of bytes to generate as output
---@param options table options: (Optional) Options to specify encoding of inputs and outputs:
---@return string result Computed HMAC value
---@return string | nil err description of the error that occurred.
function C4:PBKDF2(digest, password, salt, iterations, key_length, options) end

---Sign enables drivers to crypto-graphically sign an arbitrary payload using a specified key. The API currently supports both HMAC &amp; RSA signing. Control4 strongly recommends thatdriver developers implement this new API beginning with OS Release 3.1.0. This API is the best solution to cryptographically sign a payload. Control4 recommends its use rather than other Lua libraries.
---@param operation string Specifies which signing operation to perform. Valid values are: HMAC: Use the HMAC (hash-based message authentication code) signing algorithm. RSA: Use the RSA (Rivest-Shamir-Adleman) signing algorithm.
---| "HMAC"
---| "RSA"
---@param digest string Identifies which digest to use when signing. This can be one of the following values: HMAC: Any supported hashing digest can be used. RSA: Must be one of SHA1, SHA224, SHA256, SHA384, SHA512, MD5, MD5_SHA1, MD2, MD4, MDC2, or RIPEMD160.
---| "SHA1"
---| "SHA224"
---| "SHA256"
---| "SHA384"
---| "SHA512"
---| "MD5"
---| "MD5_SHA1"
---| "MD2"
---| "MD4"
---| "MDC2"
---| "RIPEMD160"
---@param key string The key to use for signing. The key_encoding option identifies the format of the key (see options below). HMAC: The key can be of any length, but cannot be empty. Control4 recommends that the size of the key be the same as the digest. For example, a 256-bit key for SHA256 or a 160-bit key for RIPEMD160. RSA: The key must be an RSA key that is valid for signing. Note that RSA public keys are typically not valid for signing.
---@param data string The data to be signed. The data_encoding option identifies the format of the data (see options below).
---@param options {key_encoding: KeyEncoding, data_encoding: DataEncoding, return_encoding: ReturnEncoding}
---@return string | nil result  Returns a string containing the signature or a value of nil indicates that an error occurred.
---@return string | nil err Description of the error that occurred.
function C4:Sign(operation, digest, key, data, options) end

---Verifies a signature
---@param key string The private key
---@param signature string The signature
---@param data any
---@param options any
function C4:PKEYVerify(key, signature, data, options) end

---Writes a certificate and private key to a specified #PKCS12 file.The Lua PKCS #12 interface enables drivers to manage certificates and private keys using the PKCS #12file format. These files are encrypted and protected by a password. This ensures that cryptographic assets are secure and are not easily recovered.
---@param filename string Path to the #PKCS12 file that will be created
---@param password string The password for securing the file.
---@param certificate string The PEM-encoded certificate to be stored in the file.
---@param key string The PEM-encoded private key to be stored in the file.
---@param label string An optional string containing the label, or "friendly name".
---@param options table 
---@return boolean result Indicates that the write operation failed
---@return string | nil err Description of the error that occurred.
function C4:WritePKCS12(filename, password, certificate, key, label, options) end

---Function called from DriverWorks driver to delete an Event. This API should not be invoked during OnDriverInit.
---@param id number ID value of the Event
function C4:DeleteEvent(id) end

---Function called from DriverWorks driver to Fire a static or Dynamic Event on the driver. This API should not be invoked during OnDriverInit.
---@param strEvent string ID value of the Event Name
function C4:FireEvent(strEvent) end

---Function called from DriverWorks driver to Fire a static or Dynamic Event (using the Event's ID Value) on the driver. This API should not be invoked during OnDriverInit.
---@param num number Event ID value of the Event
function C4:FireEventByID(num) end

---This API allows for a driver to register for another driver's event. The device ID passed is the ID of the device that is firing the event of interest. This is followed by the event ID.
---@param deviceId number Device ID value of the device firing the event
---@param eventId number ID value of the Event
function C4:RegisterDeviceEvent(deviceId, eventId) end

---Creates a registration for a notification when a system event fires.
---@param eventID number ID value of the event. See System Event Table
---@param deviceID number ID value of the device.
function C4:RegisterSystemEvent(eventID, deviceID) end

---This API unregisters all prior event registrations created by the RegisterDeviceEvent API. 
function C4:UnregisterAllDeviceEvents() end

---Un-registers from all notification of all system events.
function C4:UnregisterAllSystemEvents() end

---Un-registers a notification when a system event fires.
---@param eventId number ID value of the event. See list below.
---@param deviceId number ID value of the device.
function C4:UnregisterSystemEvent(eventId, deviceId) end

---This API unregisters prior event registration created by the RegisterDeviceEvent API. The device ID passed is the ID of the device that is firing the registered event. This is followed by the event ID.
---@param deviceId number Device ID value of the device firing the registered event.
---@param eventId number ID value of the Event
function C4:UnregisterDeviceEvent(deviceId, eventId) end

---Used to close an opened file handle. This API can be invoked during OnDriverInit.
---@param nFileHandle number File handle
---@return boolean result True/False
function C4:FileClose(nFileHandle) end

---Used to delete a file on the file system. This call will fail if there is a opened handle to the file. This function takes a file name to delete and returns a boolean if the delete succeeded. This API can be invoked during OnDriverInit.
---@param alias Directory Path representation/alias to an allowed location as to where a file may deleted.
---@param subpath string A path relative to alias and the file name for the file to delete.
---@return boolean result True/False 
function C4:FileDelete(alias, subpath) end

---Used to see if a file exists on the file system. This function takes a file name and returns a boolean if the file exists. This API can be invoked during OnDriverInit.
---@param strFileName string File name
---@return boolean result True/False
function C4:FileExists(strFileName) end

---Used to see how much free space exists on the file system in bytes. This API can be invoked during OnDriverInit.
---@return number amount Free file space in bytes
function C4:FileFreeSpace() end

---Used to see if a file is still valid to be written or read from.This is useful to check before or after reading to see if an end of file condition has been reached.This function returns a boolean of the file status. This API can be invoked during OnDriverInit.
---@param nFileHandle number File handle
---@return boolean result True or false
function C4:FileIsValid(nFileHandle) end

---Used to get the name of an opened file handle. This function takes a file handle and returns a string of the file name.An empty string is returned if the file handle is not valid. This API can be invoked during OnDriverInit.
---@param nFileHandle number File handle
---@return string result Filename
function C4:FileGetName(nFileHandle) end

---Used to get the current read or write position for the file. This function takes a file handle and returns the current position. This API can be invoked during OnDriverInit.
---@param nFileHandle number File handle
---@return number result Position
function C4:FileGetPos(nFileHandle) end

---File to get the current size of an opened file handle. This API can be invoked during OnDriverInit.
---@param nFileHandle number File handle
---@return number result File size in bytes
function C4:FileGetSize(nFileHandle) end

---Used to open (if file exists) or create a new file. This function takes a file name, returns a handle. A value of -1 is returned if an error. This API can be invoked during OnDriverInit.
---@param strFilename string File name
---@return number result File handle
function C4:FileOpen(strFilename) end

---Used to retrieve a table of all the opened file handles in your sandbox or nil if none are opened.The table is index = file handle and value=file name. This API can be invoked during OnDriverInit.
---@return table result Key value pairs where the index is the file handle, and the value is the file name
function C4:FileGetOpenedHandles() end

---Used to retrieve a table of all the files that are present or nil if none exist. This API can be invoked during OnDriverInit.
---@param int number File handle
---@param number number Number of bytes to be read.
---@return string string Read data or empty string
function C4:FileList(int, number) end

---Used to read data from a file. Returns an empty string if no bytes are read. This function takes a file handle and number of bytes to be read. If an end of file is reached with this read operation, a string of what data was read is returned and any subsequent calls to FileRead will return an empty string. Use the FileIsValid call to see if and end of file condition has been reached. This API can be invoked during OnDriverInit.
---@param int number File handle
---@param number number Number of bytes to be read.
---@return string string Read data or empty string
function C4:FileRead(int, number) end

---Used to set the position within the file to read or write from.This function takes a file handle and number for the new position. This API can be invoked during OnDriverInit.
---@param int number File handle
---@param number number Number of position.
---@return number number Number of bytes written or -1 if file is not valid.
function C4:FileSetPos(int, number) end

---Used to write data to a file. This function returns the number of bytes written or -1 if file is not valid (example file has been closed).This function takes a file handle, the number of bytes of the string to be written, and a string of data to be written. This API can be invoked during OnDriverInit.
---@param int number File handle
---@param number number Number of bytes to be written.
---@param string string Data to be written
---@return number number Number of bytes written or -1 if file is not valid.
function C4:FileWrite(int, number, string) end

---Function to write a string to an opened file handle.
---@param int number File handle
---@param string string String to be written
---@return number int Number of bytes written or -1 if there is an error.
function C4:FileWriteString(int, string) end

---Function to decrypt using Blowfish in ECB mode. ECB mode operates on exactly 64 bits (8 bytes) of data. This API can be invoked during OnDriverInit.
---@param data string Encrypted data
---@return string string De-encrypted data.
function C4:blowfishEcbDecrypt(data) end

---Function to encrypt using Blowfish in ECB mode. ECB mode operates on exactly 64 bits (8 bytes) of data. This API can be invoked during OnDriverInit.
---@param data string De-encrypted data.
---@return string string Encrypted data.
function C4:blowfishEcbEncrypt(data) end

---EvaluateConditional evaluates the expression and returns a Boolean result.
---@param logic LogicType Operator used in the conditionals. The following strings are accepted: EQUAL, NOT_EQUAL, LESS_THAN, GREATER_THAN, GREATER_THAN_OR_EQUAL
---@param left any Left operand of the expression
---@param right any Right operand of the expression
---@return boolean result True or False
function C4:EvaluateExpression(logic, left, right) end

---Function that will return the directory path on the controller where driver.c4i files reside.
---@return string path Directory path.
function C4:GetC4iDir() end

---Function that will return the directory path on the controller where driver.c4z files reside.
---@return string path Directory path.
function C4:GetC4zDir() end

---Function that will return the directory path on the controller where log files reside.
---@return string path Directory path.
function C4:GetLogDir() end

---Returns the directory where the LUA driver will store its files.
---@return string path Directory path.
function C4:GetSandboxDir() end

---Returns the Project's current Time Zone in the form of a LUA string. If there is no Time Zone set for the project, such as in the case of an unidentified controller, an empty string is returned.
---@return string result string Time Zone in a string format.
function C4:GetTimeZone() end

---Helper function which turns a XML document into a .lua table of parsed XML data. This API can be invoked during OnDriverInit.
---@param xml string XML in string format
---@return table result Table Lua Table.
function C4:ParseXML(xml) end

---Helper Function that writes history events to the History Agent database. 
---@param severity string Severity: Valid parameters include: Critical, Warning, Info
---| "Critical"
---| "Warning"
---| "Info"
---@param eventType string Describes the type of event within a category. Each category would define specific types of history event. For example, the Security category could define the following event types: Arm, Disarm, Open, Close, Alarm, etc.
---@param category string Represents the high level logical group that the device or source belongs to. These categories may correlate to Navigator categories, but could include additional categories. For example: Security, Lighting, Comfort, System etc.
---@param subcategory? string An optional subcategory can be included. The sub category provides additional event criteria that may be used to query for events.
---@param description string Brief description.
function C4:RecordHistory(severity, eventType, category, subcategory, description) end

---String helper function to convert a number to a string using the â€˜Câ€™ locale regardless of the locale setting of the Control4 Operating System. Some countries use commas instead of decimal points for floating point numbers. Lua â€˜tostringâ€™ command and string concatenation (..) with a number variable will convert the decimal value from a decimal point to a comma in some countries (locales). There may be instances where you do not want this conversion to take place and want the floating-point number to always be represented using a decimal point as opposed to a comma. In these cases, the C4:ToStringLocaleC(num) command can be used to convert the number to a string using decimal points.
---@param num number The number to convert (may be a floating-point number)
function C4:ToStringLocaleC(num) end

---This API provides the ability to unbind bound devices. The unbinding of the devices binding through this API is the same as manually unbinding two devices in ComposerPro's Connections area. Note the parameters passed in the API. Both have "Consumer" designation. These parameters represent the device that consumes data from the Provider device. To verify if a device driver is a Consumer, go to the driver's &lt;Connections&gt; XML. The &lt;consumer&gt; XML tag for this device's driver will be True or: &lt;consumer&gt;True&lt;/consumer&gt;. Subsequently, the Consumer Binding ID value is the Consumer device's binding value.
---@param deviceIdConsumer number deviceIdConsumer - ID value of the device consuming data.
---@param idBindingConsumer number idBindingConsumer - Binding ID value of the binding for the Consumer Device
function C4:Unbind(deviceIdConsumer, idBindingConsumer) end

---"Escapes" the passed in string rendering any XML characters (only &amp;, &lt;, and &gt;) in the string as characters that are valid in an XML value. This API should not be invoked during OnDriverInit.
---@param strRawInput string Raw input string, with possibly invalid characters for an XML value.
---@return string result The passed in string, with all XML characters properly escaped.
function C4:XmlEscapeString(strRawInput) end

---Function called from DriverWorks driver to send an IR Code. This API should not be invoked during OnDriverInit.
---@param idBinding number idBinding: IR Binding ID to send the IR Code.
---@param idIRCode number idIRCode: ID of the IR Code to send from .c4i
---@param number number idBinding:Proxy Binding ID. (optional)
function C4:SendIR(idBinding, idIRCode, number) end

---Causes Director to start sending the specified IR Code out the specified binding. This is typically used on button press events. This API should not be invoked during OnDriverInit.
---@param proxyId number Proxy Binding ID.
---@param bindingId number Binding ID to send the IR Code.
---@param idIRCode number Id of the IR Code to start sending from the driver.
function C4:SendIRStart(proxyId, bindingId, idIRCode) end

---Causes Director to stop sending the specified IR Code out the specified binding. This is typically used on button release events. This API can be invoked during OnDriverInit.
---@param proxyId number Proxy Binding ID.
---@param bindingId number Binding ID to send the IR Code.
---@param idIRCode number idIRCode: Id of the IR Code to start sending from the driver file.
function C4:SendIRStop(proxyId, bindingId, idIRCode) end

---JSON function that takes the data in the Lua tCommand table and encodes it into a JSON formatted command string representing a Lua object. On success, this function returns a single value which is as designed. On failure, the function returns two values:
---@param value any The Lua object to be encoded. Must be one of the following types: number, string, boolean, table. Tables can contain any combination of types (including nested tables) provided that all items are one of the following types: number string, boolean. Note that c4:JsonEncode will fail if any table (or nested table) contains any of the following types: lightuserdata, userdata, function, thread.
---@param formatted? boolean A boolean flag value indicating whether the resulting JSPN string is formatted using newlines and indentations. The default value is False when omitted.
---@param encodeArrays? boolean A boolean flag value indicating whether the tables are encoded as JSON arrays. The default value is False when omitted.
---@param symmetric? boolean A boolean flag value indicating whether the resulting JSON objects consist of name/value pairs in which the name must be a string (i.e, double quotes).
---@return string result
function C4:JsonEncode(value, formatted, encodeArrays, symmetric) end

---JSON function that takes data from the JSON formatted string message and decodes it into the Lua table. On success, this function returns a single value which is as designed. On failure, the function returns two values:
---@param json string A string containing the JSON to be decoded.An error will be raised if the string contains invalid JSON. The actual value returned depends on the value of the json parameter and can be any of the following: Number, String, Boolean, Table
---@param decodeNull? boolean Boolean flag value indicating how null values are decoded. By default (false), null values are converted to an empty table. A value of true specifies that null values are decoded as a lightuserdata object with a value of null.
---@return string result
---@return string error
function C4:JsonDecode(json, decodeNull) end

---Function called from DriverWorks driver to send messages to the following log files: director.log and driver.log.
---@param strLogText boolean flush: Value that indicates whether any queued-up write requests should be sent out prior to closing the connection.
function C4:ErrorLog(strLogText) end

---Generally, the class cleans up any resources associated with it. For example, when the object is no longer referenced, it will cleans it up. However, there are a few exceptions: When the class is performing an asynchronous operation, e.g. a connect request, it will remain alive until the appropriate event callback function is called. For instance, if you call the Connect() method, the class will remain alive until it either called the OnConnect (and OnResolve) callback function, or the OnError callback function, even if your lua code does not have any reference to the class during that time period. The same applies to the time period between calling one of the Read() methods and the corresponding OnRead() or OnError() callback, and in between calling the Write() method and the OnWrite() or OnError() callback. This API should not be invoked during OnDriverInit.
---@param flush boolean flush: Value that indicates whether any queued-up write requests should be sent out prior to closing the connection.
function C4:CreateTCPClient(flush) end

---Creates an instance of a C4Ping object that can be used to ping a specified endpoint.
---@return C4Ping
function C4:CreatePingClient() end

---This API should not be invoked during OnDriverInit.
---@param location string location
---@param title string title
---@param album Album Songs information is required. Table must contain the songs you want added to the album.
---@return number mediaID The new Media ID for the movie
function C4:MediaAddAlbumInfo(location, title, album) end

---This API should not be invoked during OnDriverInit.
---@param number number This is the Media ID of the album.
function C4:MediaGetAlbumInfo(number) end

---This API should not be invoked during OnDriverInit.
---@param number number The Media ID of the album.
function C4:MediaGetAlbumLocation(number) end

---This API should not be invoked during OnDriverInit.
---@return table<number, string> result containing Media IDs and locations.
function C4:MediaGetAllAlbums() end

---This API should not be invoked during OnDriverInit.
---@param number number The Media ID of the album. Note, all songs associated with this album will be removed as well.
function C4:MediaRemoveAlbum(number) end

---This API should not be invoked during OnDriverInit.
function C4:MediaRemoveAllAlbums() end

---This API should not be invoked during OnDriverInit.
---@param mediaID number media ID
---@param location string location
---@param name string name
---@param songInfo table Song information is required. Table must contain the songs you want added to the album.
function C4:MediaModifyAlbumInfo(mediaID, location, name, songInfo) end

---This function is used to add a new broadcast video station media entry. This API should not be invoked during OnDriverInit. 
---@param location string location
---@param title string title
---@param media BroadcastMedia The table will have key of the media id and the stations locations as the values
---@return number number The new Media ID for the station
function C4:MediaAddBroadcastVideoInfo(location, title, media) end

---This function is used to retrieve all the broadcast video stations associated with this device. This API should not be invoked during OnDriverInit.
---@return table<number, string> result containing Media IDs and locations.
function C4:MediaGetAllBroadcastVideo() end

---This function is used to get information about an existing broadcast audio media entry. This API should not be invoked during OnDriverInit.
---@param mediaId number media ID of the station
---@return BroadcastMedia result
function C4:MediaGetBroadcastVideoInfo(mediaId) end

---Modifies a broadcast video channel. This API should not be invoked during OnDriverInit.
---@param location string location
---@param name string name
---@param media BroadcastMedia The table will have key of location, name, description and genre of the broadcast video channel modifications.
function C4:MediaModifyBroadcastVideoInfo(location, name, media) end

---This function is used to remove a video station from the system. This API should not be invoked during OnDriverInit.
---@param number number The Media ID of the station to remove.
function C4:MediaRemoveBroadcastVideo(number) end

---Function that returns the what the device context is currently set to. If â€œ0â€ then all media APIs are using the current driverâ€™s device id. This API should not be invoked during OnDriverInit.
---@return number number Driver Device ID
function C4:MediaGetDeviceContext() end

---Removes all albums songs and movies from the device. This API should not be invoked during OnDriverInit.
---@param number number New device id to be associated with media related apiâ€™s.
---@return number number The new Media ID for the movie
function C4:MediaRemoveAllMedia(number) end

---Function that sets a device id to be used for media related call. If set to any value other than â€œ0â€ then adding, modifying, retrieving or removing functionality will use the supplied device id. Note that this API must be called in the OnDriverLateInit area of the device driver.
---@param number number New device id to be associated with media related apiâ€™s.
---@return number number The new Media ID for the movie
function C4:MediaSetDeviceContext(number) end

---This API should not be invoked during OnDriverInit.
---@param location string location
---@param title string title
---@param movieInformation MovieInformation Table information.
---@return number number The new Media ID for the movie
function C4:MediaAddMovieInfo(location, title, movieInformation) end

---This API should not be invoked during OnDriverInit.
---@return table<number, string> result containing Media IDs and locations.
function C4:MediaGetAllMovies(Table) end

---This API should not be invoked during OnDriverInit.
---@param mediaId number This is the Media ID of the movie.
---@return MovieInformation result
function C4:MediaGetMovieInfo(mediaId) end

---This API should not be invoked during OnDriverInit.
---@param mediaId number The Media ID of the movie.
---@return string result The location of this media as stored in the database.
function C4:MediaGetMovieLocation(mediaId) end

---This API should not be invoked during OnDriverInit.
---@param mediaId number The Media ID of the movie.
function C4:MediaRemoveMovie(mediaId) end

---This API should not be invoked during OnDriverInit.
function C4:MediaRemoveAllMovies() end

---This API should not be invoked during OnDriverInit.
---@param mediaId number media ID
---@param location string location
---@param name string name
---@param movieInformation MovieInformation Table information. The table may have entries for:
function C4:MediaModifyMovieInfo(mediaId, location, name, movieInformation) end

---This API should not be invoked during OnDriverInit.
---@return table table Information for location and title.
function C4:MediaAddSongInfo() end

---This API should not be invoked during OnDriverInit.
---@param mediaId number The Media ID of the song.
function C4:MediaGetSongLocation(mediaId) end

---This API should not be invoked during OnDriverInit.
---@param mediaId number The Media ID of the song.
function C4:MediaRemoveSong(mediaId) end

---This API should not be invoked during OnDriverInit.
---@param mediaId number The Media ID of the album
---@param songId number The Media ID of the song
---@param number number Track-based sequence that this song belongs within the album
function C4:MediaLinkSongToAlbum(mediaId, songId, number) end

---This API should not be invoked during OnDriverInit.
---@param number number The Media ID of the album containing songs
---@return table table Values including Media ID and location for each song.
function C4:MediaGetSongsforAlbum(number) end

---This API should not be invoked during OnDriverInit.
---@param mediaId number media ID
---@param location string location
---@param name string name
function C4:MediaModifySongInfo(mediaId, location, name) end

---Function called from DriverWorks driver to get a capability from the driver. This API should not be invoked during OnDriverInit.
---@param strName string The name of the capability to retrieve
---@return string string The value of the capability retrieved from the driver file
function C4:GetCapability(strName) end

---This API returns data found in the driver's device data, &lt;devicedata&gt; XML. The Device ID of the driver value must be passed to return the XML content. An optional string value parameter can be passed to retrieve specific XML data.
---@param deviceId number Device ID of the driver.
---@param tagName? string tagName is an optional parameter that can be passed to return specific devicedata.
---@return string result Device Data in XML format
function C4:GetDeviceData(deviceId, tagName) end

---@param tFilter? DeviceFilter A table of key/value pairs that specify the filters used within the search. The search can be filtered by .c4i or .c4z driver names and/or device id values. To filter by driver names, add an entry in the table called C4iNames. The value is a string consisting of a comma delimited list of .c4i or .c4z names.
---@param locationFilter? string A comma delimited list of project location IDs. Only devices matching the filter criteria used in the first parameter and belonging to one of the locations in the list will be included when the function is executed. Locations IDs include Sites, Buildings, Floors and Rooms
---@return DeviceDefinition[] result A table of devices
function C4:GetDevices(tFilter, locationFilter) end

---Function used to obtain the Device ID and the Room ID assigned to a device in the project. This API should not be invoked during OnDriverInit.
---@param name string Name of the Device in the project.
---@param room? string Name of the Room where the Device resides.
---@return table<number, string> result A table where the key is the device ID and the value is the room name
function C4:GetDevicesByName(name, room) end

---Function called from DriverWorks driver to get this drivers Device ID. This API should not be invoked during OnDriverInit.
---@return number result The device ID
function C4:GetDeviceID() end

---Function used to obtain a Device's variables. This API should not be invoked during OnDriverInit.
---@param proxyId number This is the Proxy ID or the Protocol ID assigned to the Device in the project.
---@return table result Table of all of the proxy variables or protocol variables for the Device (depending on the parameter passed) as well as all of the information for each of the variables.
function C4:GetDeviceVariables(proxyId) end

---Function that returns the XML contents of a driver's config.xml file. This API should not be invoked during OnDriverInit.
---@param tag string XML tag for the inner XML that is being requested. This is passed in a string format without the XML brackets.
---@return string xml XML of the tag that is passed as a parameter.
function C4:GetDriverConfigInfo(tag) end

---Function to get the current locale of the system. This API should not be invoked during OnDriverInit.
---@return string result The locale of the system
function C4:GetLocale() end

---If no parameter is passed, this API returns the entire project as an .XML string. This string can then be parsed to retrieve variable IDs. The API supports several parameters (filters) that will return specific XML. This API should not be invoked during OnDriverInit.
---@param ... string Filter. Optional, Filters can be applied to GetProjectItems(). Each filter is a separate string parameter to the function. The list of filters include: ALL, LOCATIONS, PROXIES, DEVICES, AGENTS, LIMIT_DEVICE_DATA, JUST_CAPABILITIES and NO_ROOT_TAGS
---| "ALL"
---| "LOCATIONS"
---| "PROXIES"
---| "DEVICES"
---| "AGENTS"
---| "LIMIT_DEVICE_DATA"
---| "JUST_CAPABILITIES"
---| "NO_ROOT_TAGS"
---@return string string Project data in XML format
function C4:GetProjectItems(...) end

---Function that returns the controller type used as the primary controller in a project. Returns OS Info of Windows when called from a Virtual Director environment.
---@return string type The system type
function C4:GetSystemType(string) end

---Function to get a string translated into the current locale from a english input string. This will only return translated strings if there is a corresponding input -&gt; translation match in the current translated string for the set locale. If no translation is found the input string is returned. This API can be invoked during OnDriverInit.
---@param str string String to be translated
---@return string result Translated string
function C4:GetText(str) end

---Function to get the unique MAC address of the Director box. This API can be invoked during OnDriverInit.
---@return string result MAC Address of the controller
function C4:GetUniqueMAC() end

---Parses a ISO 8601 date/time stamp to UTC (Coordinated Universal Time). This API can be invoked during OnDriverInit.
---@param str string The string to be parsed.
---@param strict boolean Optional. Strict parsing type,. Defaults to false. If enabled, leading or trailing whitespace will cause the function to fail.
---@return table table similar to what a os.date("t") call would return, except that the isdst field will be missing due to it being UTC.
---@return number number The Number of the second epoch in UTC.
---@return number number The fraction of a second, expressed in microseconds.
function C4:ParseIso8601DateTime(str, strict) end

---Deletes all values. See PersistGetValue and PersistSetValue
function C4:PersistDeleteAll() end

---Removes a value from the database.
---@param name string  The name of the key for which the value is to be removed.
function C4:PersistDeleteValue(name) end

---Returns the value associated with the specified name. This API can be used before OnDriverLateInit.
---@param name string A string containing the name of the value.
---@param encrypted boolean Boolean indicating whether the value is encrypted. If true, the value is decrypted before it is returned
---@return number | string | boolean | table | nil value The value associated with the specified name, or nil if no value was found.
function C4:PersistGetValue(name, encrypted) end

---Persists a value associated with the specified name. This API can be used before OnDriverLateInit.
---@param name string A string containing the name of the value.
---@param value number | string | boolean | table The value to be persisted.
---@param encrypted boolean Boolean indicating whether the value is encrypted before persisting.
function C4:PersistSetValue(name, value, encrypted) end

---Function called by a DriverWorks driver to remove a dynamically created binding. This API should not be invoked during OnDriverInit. No Events will be sent prior to OnDriverlateInit. If an event is required, this method must be invoked in OnDriverlateInit.
---@param idBinding number ID of the dynamic binding to remove.
function C4:RemoveDynamicBinding(idBinding) end

---The RenameDevice API supports the ability to rename a device that is currently in a Control4 project from a driver. This API can be also called from a driver other than that of the device's. This supports that ability to rename project devices externally. This API should not be invoked during OnDriverInit.
---@param id number The Proxy ID or Device ID of the device being renamed
---@param name string New device name.
function C4:RenameDevice(id, name) end

---Function to get the ID value of the room containing the driver. This API should not be invoked during OnDriverInit.
---@return number int Device ID of the room containing the driver
function C4:RoomGetId() end

---Function to force the selection of onscreen for the selected room. This API should not be invoked during OnDriverInit.
---@param deviceId number Device ID of the room to force onscreen selection
function C4:RoomSelectNav(deviceId) end

---Function to send data to subscribed navigators. This API should not be invoked during OnDriverInit.
---@param xml string xml string to send
function C4:SendDataToUI(xml) end

---Function that sends a request to another driver. It uses the proxy or protocol ID value of the driver as a means to target the driver where the request will be sent. The driver receiving the SendUIRequest must have an a UIRequest function configured which will contain the return values requested by the SendUIRequest call.
---@param id number Proxy or protocol ID value of the driver receiving the SendUIRequest
---@param request string Request to send in string format
---@param tParams table Table containing values sent with the request. If no values are needed an empty table must be sent.
---@return string result Data is returned to the driver sending the SendUIRequest in XML format.
function C4:SendUIRequest(id, request, tParams) end

---Function to modify the visibility of properties as viewed from Composer. This API should not be invoked during OnDriverInit.
---@param name string Name of property to modify
---@param show number 0 (to show) or 1 (to hide)
---| 0 # Show
---| 1 # Hide
function C4:SetPropertyAttribs(name, show) end

---Decrypt the input string with Corrected Block TEA (XXTEA) Algorithm, using the specified key. This API can be invoked during OnDriverInit.
---@param strBuf string String to be decrypted
---@param strKey string Key to use for decryption. Keys are 32 hex digits, encoded as a string (128-bit).
---@return string string Decrypted version of input string.
function C4:TEADecrypt(strBuf, strKey) end

---Encrypt the input string with Corrected Block TEA (XXTEA) Algorithm, using the specified key. This API can be invoked during OnDriverInit
---@param strBuf string String to be encrypted
---@param strKey string Key to use for encryption. Keys are 32 hex digits, encoded as a string (128-bit).
---@return string string TEA Encrypted version of input string
function C4:TEAEncrypt(strBuf, strKey) end

---GetProjectProperty takes a single string parameter from a list of property names. The API returns the value of that property, if it exists.
---@param propertyName string Name of Property. Includes the following:
function C4:GetProjectProperty(propertyName) end

---Function called from DriverWorks driver to update driver properties. This API should not be invoked during OnDriverInit.
---@param strName string Name of Property to update.
---@param strValue string New value of Property.
function C4:UpdateProperty(strName, strValue) end

---Function called from DriverWorks driver to update driver properties. This API should not be invoked during OnDriverInit.
---@param strName string Name of Property to update.
---@param strValueList string New list for the property. This list needs to be a comma delimited list.
---@param strValueDefault? string Optional but Recommended New Value of the property. This value needs to be included in the list.
function C4:UpdatePropertyList(strName, strValueList, strValueDefault) end

---Function that returns the all proxy devices by proxy name. For example, if passed light.c4i it will return a list of all lights in the project. This API should not be invoked during OnDriverInit.
---@param name string Driver name
---@return string name Proxy name
function C4:GetProxyDevicesByName(name) end

---Function that returns specific devices by .c4i (driver) name. For example, if passed light_ip_control4_ldz-102-w-c4iit will return a list of all Control4 Wireless dimmers in the project. This API should not be invoked during OnDriverInit.
---@param string string Driver name
---@return table table Table of device IDs.
function C4:GetDevicesByC4iName(string) end

---Function called from DriverWorks driver to send a Control4 BindMessage to the proxy bound to the specified binding. This API should not be invoked during OnDriverInit. 
---@param idBinding number Binding ID for the proxy you wish to send to
---@param strCommand string Command to send to the proxy
---@param tParams table Lua table containing parameters to the command.
---@param strMessage? string COMMAND or NOTIFY - Overrides the default message for SendToProxy. See Note below.
---| "COMMAND" Acts as a command send to a protocol driver.
---| "NOTIFY" Acts as a notification to a proxy.
---@param allowEmptyValues? boolean When set to TRUE will allow for an empty string to be sent as a parameter value.
function C4:SendToProxy(idBinding, strCommand, tParams, strMessage, allowEmptyValues) end

---Function that defines a dynamic Network Connection so no Connection XML is required. Further (port-specific configuration) can be accomplished through the use of the NetPortOptions API. Connections are actually made using the NetConnect API. This API should not be invoked during OnDriverInit.
---@param idBinding number id of the Network Binding to create.
---@param strAddress string Network address or hostname that this network connection will use.
---@param strConnectionType string Optional string designating connection type
function C4:CreateNetworkConnection(idBinding, strAddress, strConnectionType) end

---Returns a physical (IP) address of a network binding. This API should not be invoked during OnDriverInit
---@param idBinding number Binding value.
---@return string hostname Network address or hostname that this network connection will use.
---@return number address IP address of a network binding
function C4:GetBindingAddress(idBinding) end

---Returns a list of connections for a device
---@param idDevice number The ID of the device
---@return {bindings: DeviceBinding[]} bindings
function C4:GetBindingsByDevice(idDevice) end

---Call to retrieve the devices bound to (the consumers of) a binding provided (an output binding) by this device. This API should not be invoked during OnDriverInit.
---@param deviceId number Device ID
---@param idBinding number Binding ID
---@return table devices Table of device ID/name pairs of bound devices
function C4:GetBoundConsumerDevices(deviceId, idBinding) end

---Call to retrieve what device is attached to an input binding of the specified device. This API should not be invoked during OnDriverInit.
---@param deviceId number Device ID
---@param idBinding number Binding ID
---@return nil | number devices Device ID
function C4:GetBoundProviderDevice(deviceId, idBinding) end

---Function that returns the address of the master controller in a project. This API should not be invoked during OnDriverInit.
---@return string address Network address of the master controller in IP format
function C4:GetControllerNetworkAddress() end

---Returns the name of the device as shown in Composer. This API should not be invoked during OnDriverInit
---@param deviceId? number ID Value of a device
---@return string name Name of device.
function C4:GetDeviceDisplayName(deviceId) end

---Returns the MAC Address associated with a device that has already been identified in the Control4 Project. The API uses address resolution protocol (ARP) queries to lookup MAC hardware addresses. It will return a value of nil if the MAC address is not found in the controller's ARP tables. Considerations when using GetDeviceMAC include:
---@param bindingId number Network Binding ID value for the identified device
function C4:GetDeviceMAC(bindingId) end

---Returns a table that contains the device's discovery information.
---@param idBinding number Network Binding ID value for the identified device
function C4:GetDiscoveryInfo(idBinding) end

---API that returns the bound address of the "device." For example, in the case of a single network binding, GetMyNetworkAddress returns the address of the device that's connected to the driver. This API should not be invoked during OnDriverInit.
---@param deviceId? number The id of the device returning network binding information.
function C4:GetMyNetworkAddress(deviceId) end

---Function that returns network binding information for a device. 
---@param deviceId number The id of the device returning network binding information.
---@return {networkbindings: C4Connection[]}
function C4:GetNetworkBindingsByDevice(deviceId) end

---Function that returns a table containing all of the device connections as well as data for each individual connection.
---@return {connections: C4Connection[]}
function C4:GetNetworkConnections() end

---Returns the Proxy ID value when passed a Device ID value. This API should not be invoked during OnDriverInit.
---@param deviceId number ID value of a device
---@return number number Proxy ID value
function C4:GetProxyDevicesById(deviceId) end

---Returns the <serialsettings> string from the driver that is connected to the provided control binding. The control binding should be an RS232 provider binding. This API should not be invoked during OnDriverInit.
---@param idBinding number Control Binding Value
---@return string string Serial Settings Data in string format.
function C4:GetSerialSettings(idBinding) end

---Function that allows a TCP/IP device, with an existing connection, to use a different IP Address for connection purposes. This API can be used with both statically created connections (XML) as well as dynamically created ones. It is recommended that the NetConnect API is called after SetBindingAddress. This API should not be invoked during OnDriverInit.
---@param idBinding number Binding ID of the existing network binding
---@param strIPaddress string New IP address for the connection
function C4:SetBindingAddress(idBinding, strIPaddress) end

---Function that enables a Lua driver to explicitly set the "connected" state for a connection binding. This can particularly useful for connection bindings that aren't persistent (i.e., always connected), such as HTTP. Such non-persistent connections are marked as Offline (yellow) in the Network Tools windows in Composer. The C4:SetBindingStatus function enables a driver to manage the "connected" state of a connection binding, effectively overriding the default behavior provided by Director
---@param idBinding number Binding ID of the existing network binding
---@param strStatus string String that specifies the status to set
---| "online"
---| "offline"
function C4:SetBindingStatus(idBinding, strStatus) end

---Function that enables a Lua driver to send network broadcast messages. The function opens a UDP connection, sets the SO_BROADCAST socket option and then sends a specified payload to the directed broadcast address. For example, 192.168.1.255. If the directed broadcast address is unavailable for any reason then the limited broadcast address is used instead, for example: 255.255.255.255.
---@param payload string Payload of the message to be broadcast
---@param port number Port identifying the port to which the payload is broadcast.
function C4:SendBroadcast(payload, port) end

---Function called from DriverWorks driver to send a Control4 CommandMessage to the specified Control4 device driver. This API should not be invoked during OnDriverInit.
---@param deviceId number Device ID of the driver you wish to send the command to.
---@param strCommand string Command to be sent
---@param tParams table Lua table of parameters for the command.
---@param allowEmptyValues? boolean Defaults to False. True will allow for an empty string to be sent as a parameter value.
---@param logCommand? boolean Defaults to True. False prevents this APIs content from being logged.
function C4:SendToDevice(deviceId, strCommand, tParams, allowEmptyValues, logCommand) end

---Function which sends an HTTP request to a network binding / port. This API should not be invoked during OnDriverInit.
---@param idBinding number Binding ID of the network interface to send on
---@param nPort number Network port to send on
---@param strData string Data to send out the specified network interface
function C4:SendToNetwork(idBinding, nPort, strData) end

---Simple function which sends the command out serial port on binding 1 and adds the \r terminator to the end of the command being sent. This API should not be invoked during OnDriverInit.
---@param idBinding number Binding ID of the network interface to send on
---@param strData string Data to send out the specified network interface
function C4:SendToSerial(idBinding, strData) end

---Function that enables a Lua driver to broadcast a Wake-On-Lan magic packet. 
---@param macAddress string MAC address of the device.
---@param port number ID of the port the WOL magic packet is broadcast. If omitted, the WOL default port 9 is used.     
function C4:SendWOL(macAddress, port) end

---Function used to tell the system to make a connection (static or dynamic). Connections are created using the CreateNetworkConnection API. Further, port-specific configuration can be configured for a connection through the NetPortOptions API. This API should not be invoked during OnDriverInit.
---@param idBinding number Binding ID of the network interface
---@param nPort number Network port to connect to. If NetPortOptions API is used with NetConnect, the remaining parameters are ignored.
---@param strIPType string IP Type. Optional. TCP is assumed or UDP or MULTICAST
---| "TCP"
---| "UDP"
---| "SSL"
---| "MULTICAST"
function C4:NetConnect(idBinding, nPort, strIPType) end

---Function called from DriverWorks driver to disconnect from a specific idBinding and nPort. This API should not be invoked during OnDriverInit.
---@param idBinding number Binding ID of the network interface to disconnect from
---@param nPort number Network port.
function C4:NetDisconnect(idBinding, nPort) end

---Function to configure a connection's Port settings. The use of this API is contingent upon the use of the CreateNetworkConnection and NetConnect APIs. Connections are created using the CreateNetworkConnection API and Connections are made using the NetConnect API. This API should not be invoked during OnDriverInit.
---@param idBinding number Binding ID of the network interface to disconnect from
---@param nPort number Network port.
---@param strIPType string Network Connection type. For example, TCP/SSL or UDP.
---@param tPortParams table lua table of Key/Value pairs that contain all of the parameters for the specific Port. These parameters include:
function C4:NetPortOptions(idBinding, nPort, strIPType, tPortParams) end

---Function called by Director when a network connection has been addressed (â€˜identifiedâ€™ on Network Connections Page) or unaddressed (â€˜disconnectâ€™).
---@param idBinding number ID of the network binding whose status has changed
---@param bIsBound boolean Whether the network binding has a bound address
function C4:OnNetworkBindingChanged(idBinding, bIsBound) end

---Creates a Server Socket, that listens on port nPort, and sends messages to the driver upon receipt of the delimiter, strDelimiter (or upon timeout). This API should not be invoked during OnDriverInit.
---@param port number The port number to which the server is to be bound. If this value is zero (0), then an ephemeral port will be assigned automatically.
---@param delimeter? string The delimiter to use when reading the socket. This can be any combination of characters. When specified, the server will automatically deliver complete payloads to the driver up to, and including, the delimiter. When empty or not otherwise specified, the server will deliver packets to the driver as they arrive.
---@param useUDP? boolean A boolean flag indicating whether the server should be established using the UDP protocol. When false, or not otherwise specified, the server is established using the TCP stream protocol.
---@param identifier? string A string that is associated with the instance of the server that is created. This identifier is passed as an argument to the various callbacks.
---@return boolean result True if the server was created, false otherwise
---@return string | nil err A string describing the error that occurred
function C4:CreateServer(port, delimeter, useUDP, identifier) end

---Destroys any Server Sockets. This API should not be invoked during OnDriverInit.
---@param nPort number TCP Port to stop listening on (Should be the same as initially given)
function C4:DestroyServer(nPort) end

---This function is used to send data over an open Server Socket connection. This API should not be invoked during OnDriverInit.
---@param nHandle number Server Socket handle received in OnServerConnectionStatusChanged. Replies to or disconnects this same Server Socket.
---@param strData string Data to be sent over the open Server Socket connection.
function C4:ServerSend(nHandle, strData) end

---Close a previously open Server Socket connection. This API should not be invoked during OnDriverInit.
---@param nHandle number Server Socket handle received in OnServerConnectionStatusChanged.     
function C4:ServerCloseClient(nHandle) end

---Creates and starts timer. This API should not be invoked during OnDriverInit.
---@param nDelay number Numeric value in milliseconds which is the desired timer delay. This value must be greater than 0.
---@param fCallback fun(self: C4LuaTimer, skips: number) The function to be called when the timer fires. The function signature for non-repeating timers is: function(timer)
---@param bRepeat? boolean bRepeat Optional parameter that, if provided and set to true, the timer will fire repeatedly until canceled.
---@return C4LuaTimer timer
function C4:SetTimer(nDelay, fCallback, bRepeat) end

---Function called from a DriverWorks driver to delete a Control4 variable for the driver. This API should not be invoked during OnDriverInit
---@param identifier string | number A string or number that uniquely identifies the variable to be deleted.
function C4:DeleteVariable(identifier) end

---Function called by a DriverWorks driver to get the value of a variable. This API should not be invoked during OnDriverInit.
---@param deviceId number Device ID of the device that owns the specified variable
---@param idVariable number Variable ID of the specified variable
---@return string string String Value of the requested variable, nil if not found.
function C4:GetVariable(deviceId, idVariable) end

---Function called by a DriverWorks driver to get the value of another device's variable. This API should not be invoked during OnDriverInit.
---@param deviceId number Device ID of the device that owns the specified variable
---@param idVariable number Variable ID of the specified variable
---@return string string String Value of the requested variable, nil if not found.
function C4:GetDeviceVariable(deviceId, idVariable) end

---Function called from a DriverWorks driver to set the value of another driver or device's variable. This API should not be invoked during OnDriverInit.
---@param deviceId number ID value of the device
---@param variableID number ID of variable to set
---@param value any Value to set variable
function C4:SetDeviceVariable(deviceId, variableID, value) end

---Function called from a DriverWorks driver to set the value of the current driver's variable. This API should not be invoked during OnDriverInit
---@param identifier string | number A string or number that uniquely identifies the variable to be set.
---@param value any Value to set variable
function C4:SetVariable(identifier, value) end

---Function called from a DriverWorks driver to set a listener on a particular deviceâ€™s variable. When a listener is set on a variable, whenever the variable changes, the Lua OnWatchedVariableChanged call is called.
---@param deviceId number Device ID of the device that owns the changed variable
---@param idVariable number Variable ID of the changed variable
function C4:RegisterVariableListener(deviceId, idVariable) end

---This API unregisters any/all previously registered variable listeners. It takes no arguments and returns nothing. 
function C4:UnRegisterAllVariableListeners() end

---Function called from DriverWorks driver to remove a listener on a particular device's variable. Variable changes for the particular Device's Variable will no longer be reported. This API will not work if a variable has not been registered, added or does not exist.
---@param deviceId number Device ID of the device that owns the requested variable
---@param idVariable number Variable ID of the requested variable
function C4:UnregisterVariableListener(deviceId, idVariable) end

---Utilizes a more flexible callback-based object interface. A call to this function returns a C4LuaUrl object that can be set up with various callback functions and options. Once set up, a call to its methods: Get(), Post(), Put(), Delete(), or Custom() initiates the transfer.
---@return C4LuaUrl 
function C4:url() end

---Function to cancel an ongoing transfer. Note that if a transfer is canceled, neither the ReceivedAsync() entry point nor the callback function specified in the C4:url call will be called. Also, the ticketId is only valid from the point the C4:url function is called until either the ReceivedAsync() entry point or the callback function was called. A call to C4:urlCancel() will also invalidate that ticketed. This API should not be invoked during OnDriverInit
---@param ticketId number Number representing the ticket ID value.
---@return boolean boolean True if the specified transfer was canceled.
function C4:urlCancel(ticketId) end

---This method cancels all ongoing transfers and returns an array with the ticket ids of the transfers that were canceled. This API should not be invoked during OnDriverInit.
function C4:urlCancelAll() end

---Function to clear all cookies from a driver's cookie jar.
---@return number number The number of cookies that were removed.
function C4:urlClearCookies() end

---Function to clear all session cookies from a driver's cookie jar.
---@return number number The number of session cookies (cookies with no expiration time) that were removed
function C4:urlClearSessionCookies() end

---Function to retrieve cookies from the driver's cookie jar filtered by a specific domain.
---@param domain string Optional. A specific domain.
---@return table table Table of a map of domain names to a map of cookie names to cookie table objects.
function C4:urlGetCookies(domain) end

---Function to retrieve cookies from the driver's cookie jar filtered by a specific domain.
---@param domain string Optional. A specific domain.
---@return table<string, Cookie> result of a map of domain names to a map of cookie names to cookie table objects.
function C4:urlGetCookiesForDomain(domain) end

---Function to retrieve cookies from the driver's cookie jar filtered by a specific domain.
---@param option number Returns the number of concurrent transfers allowed per hostbool
---@return string | boolean result (boolean) Returns whether HTTP pipelining is enabled (number) Returns the number of concurrent transfers allowed per hostbool
function C4:urlGetOption(option) end

---This method returns an array with the ticket ids of all ongoing transfers. This API should not be invoked during OnDriverInit.
---@return table
function C4:urlGetTickets() end

---This function changes the option specified in the option argument to the value provided. The options and their respective value parameters can be one of the two defined in the signature section below. This API should not be invoked during OnDriverInit.NOTE: These options apply to both the 'legacy' C4:urlGet / C4:urlPut / C4:urlPost commands, as well as the newer C4:url() functionality.
---@param option string 'max_host_connections' or 'pipelining'.
---@param value any The number of concurrent transfers allowed per host. NOTE: This must be a number from 1-5. Any numbers outside of this range will not be honored, and the current value will be kept.
function C4:urlSetOption(option, value) end

---This function is to set server related security information that may be needed in future related url calls. This API should not be invoked during OnDriverInit.
---@param strUrl string url to be used for supplied credentials bool
---@param nPort number port corresponding to the url
---@param strUsername string username to be used for the url
---@param strPassword string password to be used for the urlfailOnHttpError (boolean) - True/False. Defaults to True.
function C4:urlSetProxy(strUrl, nPort, strUsername, strPassword) end

---This function is to set a maximum time value (in seconds) for a transfer operation to take place before a server time out occurs. The value passed in this API is dependent on driver/Director performance. For example, setting this value too low could result in a timeout occurring too quickly resulting in messages missed. Setting it too high could result in lag time and poor user experience. Control4 recommends an initial setting of 20 seconds and adjusting as needed. This API should not be invoked during OnDriverInit.
---@param seconds number number of seconds allowed
function C4:urlSetTimeout(seconds) end

---Returns the un-encoded string containing the firmware update data of the specified BLOB (Binary Large Object). This API should not be invoked during OnDriverInit.
---@param strName string Name of the Binary Large Object to retrieve from the .c4i file.
function C4:GetBlobByName(strName) end

---Lua function called to retrieve a Zigbee devices user ID. This API should not be invoked during OnDriverInit.
---@return string EUID String representing the EUID value
function C4:GetZigbeeEUID() end

---If a driver takes longer than a minute to upload the firmware data to the device, it should call C4:KeepReflashLock. This request will maintain the reflash lock while updating. If a driver does not call KeepReflashLock, the Reflash Lock will be revoked after approximately one minute. This API should not be invoked during OnDriverInit.
function C4:KeepReflashLock() end

---This function sends a raw Zigbee packet to a Zigbee Binding. This functionality supports both the current Control 4 (EmberNet) as well as ZigBee Pro 1.1 transports. This API should not be invoked during OnDriverInit.
---@param strPacket string ZigBee supported command packet containing user data.
---@param nProfileID number Profile ID associated with the data packet
---@param nClusterID number Source Cluster library ID included within the Profile
---@param nGroupID number Zigbee device group ID
---@param nSourceEndpoint number Endpoint designated as the source of the data packet delivery.
---@param ndestinationEndpoint number Endpoint designated as the recipient of the data packet delivery.
function C4:SendZigbeePacket(strPacket, nProfileID, nClusterID, nGroupID, nSourceEndpoint, ndestinationEndpoint) end

---Function to terminate the request for firmware data upon completion of update. This API should not be invoked during OnDriverInit.
function C4:ReleaseReflashLock() end

---The C4:GetHostname function returns the host name of the controller.
---@return string hostname Returns a string containing the host name of the controller.
function C4:GetHostname() end

---This function returns a value indicating whether a specified network port is currently in use.
---@param port number
---@return boolean result A boolean indicating whether the specified network port is currently in use
function C4:PortInUse(port) end

---Function to create a new directory. As part of Control4’s plan to tighten driver security, the io.popen() call has bee removed. In doing this, driver developers need to use C4:File commands to accomplish what they previously did with io.popen (). This API provides the ability to create anew directory as previously done with io.popen. 
---@param alias Directory Path alias to an allowed location where a directory may be created.
---@param directory string A path relative to alias and the directory name for the directory to create.
function C4:FileCreateDir(alias, directory) end

---Function for or moving files within certain restrictions. As part of Control4’s plan to tighten driver security, the io.popen() call has been removed. In doing this, driver developers need to use C4:File commands to accomplish what they previously did with io.popen () This API provides the ability to move files as previously done with io.popen. 
---@param aliasFrom Directory A path representation/alias to an allowed location as to where a file may be moved from.
---@param relativeFrom string A path relative to PATH_ALIAS_FROM and the file name to be moved.
---@param aliasTo Directory A path representation/alias to an allowed location as to where it will be moved to. The following table is a list of allowed aliases
---@param relativeTo string A path relative to PATH_ALIAS_TO and the file name for the destination of the file. If the file name is the same then the file name does not need to be included.
function C4:FileMove(aliasFrom, relativeFrom, aliasTo, relativeTo) end

---In conjunction with O.S. release 3.3.0, this function is being restricted to allowed locations whereas previously it had full root access. As part of Control4’s plan to tighten driver security, the io.popen() call has been removed. In doing this, driver developers need to use C4:File commands to accomplish what they previously did with io.popen (). Prior to O.S. release 3.3.0, C4:FileSetDir had root access which would allow driver developers to modify anything on the file system. 
---@param pathOrAlias string | Directory Path representation/alias to an allowed location
---@param subDir string A path relative to alias and the directory
function C4:FileSetDir(pathOrAlias, subDir) end

---Function for extracting files from a .zip archive. This API enables Lua drivers to extract one, or more, files from a .zip archive. 
---@param file string A string containing the file path to the ZIP archive to be extracted.
---@param spec string A string containing a file specification that identifies the file, or files, to be extracted. For example, the file specification "" matches all files in the archive. The file specification ".lua" indicates that only Lua files are extracted.
---@param destination string A string containing the path (directory) into which the archive is extracted. Directories within the archive are created relative to the specified destination.
---@return boolean status Boolean indicating whether all files were successfully extracted. true: All files were successfully extracted and no errors occurred. false: One, or more, errors occurred during extraction.
---@return table fileset An array containing a list of files that were successfully extracted. The path for each file is relative to the archive.
---@return table errors A two-dimensional table containing a list of files that failed to be extracted. Each file is associated with a string describing the error that occurred.
function C4:Unzip(file, spec, destination) end

---This function returns Code Items for a specified device and event.
---@param deviceId number
---@param eventId number
---@return {codeitems: CodeItem[]}
function C4:GetCodeItems(deviceId, eventId) end

---This function returns all Code Items within the project.
---@return table result LUA table with all of the code items that exist in the active project. Table contents will vary based on the code items stored in the system.
function C4:GetAllCodeItems() end

---This function returns a string that contains an ID which is unique for the current kernel instance. When the controller is re-booted, the ID will change.
---@return string id Current kernel instance.
function C4:GetBootID() end

---This API generates a UUID (Universally Unique Identifier) as described in RFC 4122. The type of UUID that is generated depends on the arguments passed into the function.
---@param type string
---| "Nil"
---| "Random"
---| "Name"
---| "String"
---@param hash? string
---| "MD5"
---| "SHA1"
---@param namespace? string
---| "DNS"
---| "URL"
---| "OID"
---| "X500DN"
---@param name string
function C4:UUID(type, hash, namespace, name) end

---This function enables a Lua driver to create a secure SSL/TLS server that listens for incoming connections on a specified port. The driver needs to provide its own cert/key/CA. This step is left up to the driver writer. This API was modified in conjunction with O.S. 3.3.1 to accommodate the addition of an identifier that is associated with an instance of a server. This identifier enables a Lua driver to determine which instance of a server is active.
---@param port number The network port to which the new server is bound.
---@param delimiter string A sequence of one or more characters that specify the boundary between network payloads. When specified, the server socket will read from the network until it encounters the delimiter. The entire payload, including the delimiter, is then delivered to the driver. If the value of the delimiter argument is empty (no delimiter specified), then incoming network traffic is delivered to the driver as it is read from the network.
---@param options number A numeric value that specifies the TLS options to be applied to the server. The various bits in the number identify the options that are set for the server. This number can be constructed by bitwise ORing values together. The BitOp library (which is available to drivers) can perform these operations. Alternatively, if the options are known beforehand, then this value can be computed ahead of time and hardcoded.
---@param verifyMode number A numeric value that specifies the peer verification mode. The various bits in the number identify options that are set for the server. This number can be constructed by bitwise ORing values together. The BitOp library (which is available to drivers) can perform these operations. Alternatively, if the options are known beforehand, then this value can be computed ahead of time and hardcoded. The following table identifies the options that can be set:
---@param cipherList string A string that specifies the list of available ciphers. The format of this string is described here: Ciphers. If this string is empty, then the following default string is used: HIGH:!EXPORT:!DES:!RC4:!3DES:!MD5:!PSK
---@param certificate string A string containing the certificate to use for server connections.
---@param privateKey string A PEM-encoded private key. The password argument must specify the password (if needed).
---@param password string The password used to unlock either a PEM-encoded private key or a #PKCS12 file. Note that the password is encrypted and stored in memory in its encrypted form. It is decrypted at the moment that it is needed. Thereafter, all buffers containing the password are scrubbed from memory.
---@param chain string A string containing the certificate chain to use for server connections. This can be one of the following:
---@param identifier string A string that is associated with the instance of the server that is created. This identifier is passed as an argument to the various callbacks.
---@return boolean result
---@return string err
function C4:CreateTLSServer(port, delimiter, options, verifyMode, cipherList, certificate, privateKey, password, chain, identifier) end

---This API enables Lua drivers to retrieve the number of milliseconds since the epoch (1 January 1970 00:00:00 UT). See: https://en.wikipedia.org/wiki/Epoch_(computing)
---@return number
function C4:GetTime() end

---Returns a string containing basic information about the system. The response is equivalent to running the uname command from the command line.
---@return string
function C4:GetUname() end

---Returns a number specifying the total number of seconds for which the system has been running. The response is equivalent to the contents of the /proc/uptime system file.
---@return number
function C4:GetUptime() end

---Lua function that enables a Lua driver to retrieve the geo location that was retrieved from webservices. For more information
---@return string country_code
---@return string country_name
function C4:GetGeoSettings() end

---Returns the number of milliseconds that have elapsed since the Operating System was started.
---@return number milliseconds
function C4:GetTickCount() end

---Creates a new C4LuaMQTT client
---@return C4LuaMQTT
function C4:MQTT() end

---Creates a new SSH client
---@return C4LuaSSH
function C4:CreateSSHClient() end