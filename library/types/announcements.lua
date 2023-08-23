---@meta

---@class AudioAttributes
---@field isurl string
---| "True"
---| "False"
---@field file string
---@field delay string number
---@field delayStop string number

---@class VideoAttributes  
---@field text string
---| "True"
---| "False"
---@field file string
---@field delay string number
---@field timeout string number
---@field displayID string number
---@field variableID string number
---@field variableName string number
---@field OKButton string boolean
---| "True"
---| "False"

---@class AnnouncementAttributes
---@field id string
---@field name string
---@field dynamic string
---| "True"
---| "False"
---@field advanced string
---| "True"
---| "False"

---@class Announcement
---@field Attributes AnnouncementAttributes
---@field video {Attributes: VideoAttributes}
---@field audio {Attributes: AudioAttributes}
---@field rooms unknown
---@field navigators unknown
---@field touchscreens unknown

---@class AddAnnouncementParams
---@field announcement string