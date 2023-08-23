---@meta

---@class C4LuaUrl
local class = {}

---Sets a callback function that will be called when the entire transfer succeeded or failed. It is only called once at the end of the entire transfer regardless of how many responses have been received. Note that this method can only be called before a transfer was started.
---@param callback fun(self: C4LuaUrl, responses: UrlResponse[], errorCode: number, errorMessage: string)
---@return C4LuaUrl
function class:OnDone(callback) end

---Sets a callback function that will be called each time a response body has finished transferring. This function is called after the callback functions set by OnHeaders() and OnBodyChunk() but before the callback function set by OnDone(). Note that this method can only be called before a transfer was started.
---@param callback fun(self: C4LuaUrl, response: UrlResponse)
---@return C4LuaUrl
function class:OnBody(callback) end

---Sets a callback function that will be called each time a chunk of the response body has transferred. This does not necessarily correlate to chunks in the context of the HTTP "chunked" transfer encoding. This function may be called multiple times for each response, following the callback function set by OnHeaders() and before the callback function set by OnBody() and OnDone(). Note that this method can only be called before a transfer was started. This callback function is not needed for most use-cases.
---@param callback fun(self: C4LuaUrl, response: UrlResponse)
---@return C4LuaUrl
function class:OnBodyChunk(callback) end

---Sets a callback function that will be called each time all of the headers of a response have been received but, before the response body has been received. This function may be called multiple times, e.g. due to redirects. Note that this method can only be called before a transfer was started.
---@param callback fun(self: C4LuaUrl, response: UrlResponse)
---@return C4LuaUrl
function class:OnHeaders(callback) end

---This API is similar to the SetOption() method, but allows the driver to pass in a table of options and their values. Note that this method can only be called before a transfer was started.
---@param options C4LuaUrlOptions
---@return C4LuaUrl
function class:SetOptions(options) end

---Sets one option specified by name to value. Note that this method can only be called before a transfer was started. 
---@param name string
---@param value any
---@return C4LuaUrl
function class:SetOption(name, value) end

---Function that causes a file to be downloaded from a URL to a specified location on the file system.
---@param url string
---@param filename string
---@param subdir? Directory
---@param headers? table<string, any>
function class:DownloadFile(url, filename, subdir, headers) end

---Starts a HTTP GET transfer.
---@param url string
---@param headers table<string, any>
function class:Get(url, headers) end

---Starts a HTTP POST transfer.
---@param url string
---@param body string
---@param headers table
function class:Post(url, body, headers) end

---Starts a HTTP PUT transfer.
---@param url string
---@param body string
---@param headers table
function class:Put(url, body, headers) end

---Starts a HTTP DELETE transfer.
---@param url string
---@param body string
---@param headers table
---@return C4LuaUrl
function class:Delete(url, body, headers) end

---Starts a CUSTOM HTTP transfer.
---@param url string
---@param method string
---@param body string
---@param headers table
---@return C4LuaUrl
function class:Custom(url, method, body, headers) end

---Cancels a transfer that has been started by a call to the Get(), Post(), Put(), Delete(), or Custom() methods.
---@return C4LuaUrl
function class:Cancel() end

---@return number
function class:TicketId() end

---@class UrlResponse
---@field code number Status Code
---@field headers table A table of all received headers and their value(s)
---@field body string The entire response body as a string. This key is absent if a callback was set with OnBodyChunk().

---@class C4LuaUrlOptions
---@field fail_on_error? boolean
---@field timeout number? In seconds. Defaults to 300 or whatever value was set through C4:urlSetTimeout(). This is how many seconds, total, the entire transfer is allowed to take.
---@field connect_timeout? number In seconds. Defaults to 5. This is how many seconds it is allowed to take to establish the connection to the host.
---@field ssl_verify_host? boolean Defaults to true. Verify the host against the system's CA bundle when using the https protocol.
---@field ssl_verify_peer? boolean Defaults to true. Verify the peer against the system's CA bundle when using the https protocol.
---@field ssl_cabundle? string A filename relative to the .c4z that specifies a CA bundle to use instead of the system's. It is not recommended to use this option except for very special use cases because CA bundles require regular updates.
---@field ssl_cert? string A filename relative to the .c4z that specifies a SSL client certificate to use for authentication to the host.
---@field ssl_cert_type? string # Defaults to 'PEM'. The format of the SSL certificate that the file specified by the 'ssl_cert' option is in. Valid values are: 'PEM' (default), 'DER', 'P12'.
---| "PEM"
---| "DER"
---| "P12"
---@field ssl_key? string A filename relative to the .c4z that specifies the private key for the client certificate specified by the "ssl_cert" option.
---@field ssl_passwd? string If the private key specified by the "ssl_key" option is encrypted, this option specifies the password.
---@field ssl_cacerts? table A table of filenames relative to the .c4z that specify additional certificates to be added to the CA bundle used to verify the host and/or peer. This allows e.g. extending the CA bundle to be able to verify against self-signed or company-signed certificates.
---@field response_headers_duplicates? boolean If set to true and duplicate response headers are received, the tHeader table will have an array of string values for this header. If set to false (default) and duplicate response headers are received, only the last header received will be saved to the tHeader table. This option defaults to false.
---@field cookies_enable? boolean If set to true, enables the use of cookies.  If the cookies_use_jar option is set to true, this causes cookies to be stored in the driver's cookie jar. If set to false (default) and a Set-Cookie header is received, the cookie will neither be stored in the driver's cookie jar, nor will it be used with any redirect request that may automatically be performed. This option defaults to false.
---@field cookies_use_jar? boolean If set to true (default), uses cookies in the driver's cookie jar. If set to false, this transfer does not use any cookies that may be stored in the driver's cookie jar. This option defaults to true.
---@field cookies_save_to_jar? boolean If set to true (default), saves any new cookies to the driver's cookie jar. This may also delete expired cookies from the cookie jar. If set to false, any cookies received from this transfer will not be saved to the jar. This option defaults to true.
---@field cookies_clear_session? boolean If set to true, clears any "session" cookies (cookies with no expiration time) from this transfer prior to making the request.  This does not remove them from the driver's cookie jar, but if the cookies_save_to_jar"option is set to true, it will remove them from the cookie jar once the transfer completes. If set to false (default), session cookies are used for this transfer. This option defaults to false.

local url = C4:url()