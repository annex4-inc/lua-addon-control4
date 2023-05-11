---@meta

---@class GetVersionInfoResult
---@field buildtime string
---@field builddate string
---@field buildtype string
---@field version string

---@alias DataEncoding
---| "NONE"
---| "HEX"
---| "BASE64"

---@class EncryptOptions
---@field return_encoding? DataEncoding
---@field key_encoding? DataEncoding
---@field iv_encoding? DataEncoding
---@field data_encoding? DataEncoding
---@field padding? boolean

---@class CertificateSigningRequest
---@field CSR string String of the CSR
---@field pubkey string The public key
---@field privkey string The private key

---@alias LocationType
---| "SITE"
---| "BUILDING"
---| "FLOOR"
---| "ROOM"

---@alias LogicType
---| "EQUAL"
---| "NOT_EQUAL"
---| "LESS_THAN"
---| "GREATER_THAN"
---| "GREATER_THAN_OR_EQUAL"

---@alias DestructionMethod
---| "DIT_UPDATING" Called as a result of the driver being updated.
---| "DIT_LOADED" Called manually after the driver has already been loaded.

---@alias InitializationMethod
---| "DIT_ADDING" Called as a result of the driver being added to a project.
---| "DIT_STARTUP" Called as a result of Director starting or a new project being loaded.
---| "DIT_UPDATING" Called as a result of the driver being updated.

---@alias Directory
---| "SANDBOX"
---| "MEDIA"
---| "C4Z"
---| "LOGGING"

---@alias VariableType
---| "BOOL"
---| "DEVICE"
---| "FLOAT"
---| "INT"
---| "MEDIA"
---| "NUMBER"
---| "ROOM"
---| "STRING"
---| "STATE"
---| "TIME"
---| "ULONG"
---| "XML"
---| "LEVEL"
---| "LIST"

---@class MovieInformation
---@field location string
---@field title string
---@field directors string Comma separated
---@field description string
---@field cast string Comma separated
---@field rating string
---@field rating_reason string
---@field reviews string
---@field genre string
---@field aspect_ratio string
---@field release_date string
---@field release_company string
---@field length string Time span in minutes
---@field cover_art string This is a base64 encoded JPEG file of the cover art

---@class DeviceFilter 
---@field C4iNames? string CSV value of c4i names
---@field DeviceIds? string CSV value of Device IDs

---@class DeviceDefinition
---@field driverFileName string
---@field deviceName string
---@field roomId string
---@field roomName string
---@field protocol table<number, ProtocolDefinition>

---@class ProtocolDefinition
---@field driverFileName string
---@field deviceName string

---@class Song
---@field title string
---@field location string
---@field track_no string
---@field name? string
---@field artist? string
---@field record_label? string
---@field release_date? string

---@class Album
---@field artist string
---@field description string
---@field genre string
---@field release_date string
---@field release_label string
---@field songs Song[]

---@class BroadcastMedia
---@field name string
---@field location string
---@field genre string
---@field description string
---@field image string Base64 encoded JPEG file of the cover art

---@class Cookie
---@field domain string The domain that this cookie belongs to
---@field path string The path that this cookie belongs to
---@field name string The name of this cookie
---@field value string The value of this cookie
---@field secure boolean If set to true, this cookie is only used for https requests
---@field wildcard boolean If set to true, this cookie is used for any subdomains
---@field expires number Expiration date/time in number of seconds since the Epoch.  If this value is 0, this is session cookie.