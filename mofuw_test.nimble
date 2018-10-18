# Package

version       = "0.1.0"
author        = "sh4869221"
description   = "A new awesome nimble package"
license       = "MIT"
srcDir        = "src"
binDir        = "bin"
bin           = @["mofuw_test"]


# Dependencies

requires "nim >= 0.19.0"
requires "mofuw"

task server, "start server":
  rmDir "bin"
  exec "nimble build --threads:on -d:ssl -d:release"
  exec "bin/mofuw_test"
