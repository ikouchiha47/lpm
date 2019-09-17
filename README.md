# lpm

lua package manager

This is based on `luarocks`.

### Requirements

- lua 5.1+
- luarocks
- luarocks install json-lua
- bash

### Installation

- clone the repo
- cd lpm
- ./install.sh
- add `$HOME/.local/bin` to your $PATH

### Usage

Given a project, create a `package.json` with

- name
- dependencies

an example file looks like

```
{
  "name": "test-proj",
  "dependencies": {
    "luash": {
      "version": "0.1",
      "url": "http://luarocks.org/dev"
    },
    "otp": {
      "version": "0.1-3"
    },
    "json-lua": ""
  }
}
```

and then run `lpm`

### Todo

- improve distribution, make it standalone
- add cli commands like `install`, `remove`
- support non-unix platform
