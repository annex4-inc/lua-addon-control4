---@meta

---@alias StringBoolean
---| "True"
---| "False"

---@class GetVersionInfoResult
---@field buildtime string
---@field builddate string
---@field buildtype string
---@field version string

---@alias ZigbeeStatus
---| "OFFLINE"
---| "ONLINE"
---| "REBOOT"
---| "UNKNOWN"

---@alias Status
---| "ONLINE"
---| "OFFLINE"

---@alias DataEncoding
---| "NONE"
---| "HEX"
---| "BASE64"

---@alias KeyEncoding
---| "NONE"
---| "HEX"
---| "BASE64"
---| "PEM"

---@alias ReturnEncoding
---| "NONE"
---| "HEX"
---| "HEX_UPPER"
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
---@field DeviceIds? string | number CSV value of Device IDs or a number

---@class DeviceDefinition
---@field driverFileName string
---@field deviceName string
---@field roomId string
---@field roomName string
---@field protocol? table<number, ProtocolDefinition>

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

---@class C4Connection
---@field deviceid number
---@field type number
---@field bindingid number
---@field state number
---@field port number
---@field name string 
---@field address string
---@field gateway string
---@field firmware string

---@class C4NetworkBinding
---@field deviceid number
---@field networkbindingid number
---@field uuid string
---@field addr string
---@field addresstype number
---@field status string
---| 'online'
---| 'offline'
---@field ssdptype string

---@alias CodeItemType
---| 0 # Container
---| 1 # Command
---| 2 # Condition
---| 3 # Loop
---| 4 # Else
---| 5 # Comment
---| 6 # Operator

---@class CodeItem
---@field id number
---@field cmdcond {xml: string}
---@field subitems CodeItem[]
---@field enabled boolean
---@field creator number
---@field device number
---@field type CodeItemType
---@field display string
---@field creatorstate string

---@class DeviceBindingClass
---@field excludeids string[]
---@field autobind boolean
---@field class string
---@field rank number

---@class DeviceBindingBound
---@field boundclasses string[]
---@field deviceid number
---@field name string
---@field bindingid number

---@class DeviceBinding
---@field bindingclasses DeviceBindingClass[]
---@field boundprovider? {bound: DeviceBindingBound}
---@field boundconsumers? DeviceBindingBound[]
---@field deviceid number
---@field type number
---@field bindingid number
---@field binding_info string
---@field flags number
---@field isbound boolean
---@field name string
---@field provider boolean

---@alias ConnectionType
---| "TCP"
---| "UDP"
---| "SSL"
---| "MULTICAST"