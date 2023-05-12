# Description
This repository is an in development addon for the lua-language-server: https://github.com/LuaLS/lua-language-server/wiki/Addons

# Features
* Definitions for Control4 APIs
* Hooks defined for the the global scope
* Type defintions for C4LuaURL, C4LuaMQTT, C4LuaTimer, and C4Ping
* Various types defined for parameter values & results

# Installation

1. Clone or download the repository somewhere on your local machine
2. Update your workplace settings in vscode:

```json
  "Lua.workspace.library": [ "C:/PATH_TO_REPOSITORY/lua-addon-control4/library"],
  "Lua.workspace.userThirdParty": ["C:/PATH_TO_REPOSITORY"]
```