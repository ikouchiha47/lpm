package = "lpm"
version = "dev-1"
source = {
   url = "*** please add URL for source tarball, zip or repository here ***"
}
description = {
   summary="package manager for lua based on lua rocks",
   homepage = "",
   license = "MIT",
   maintainer = "Alex"
}
build = {
   type = "builtin",
   install = {
      bin = {
         "lpm.lua"
      }
   },
   modules = {
      lpm = "lpm.lua"
   }
}
dependencies = {
  "json-lua >= 0.1-3"
}
