# Package

version       = "0.1.0"
author        = "Yuri Brito"
description   = "A new awesome nimble package"
license       = "MIT"
srcDir        = "src"
binDir        = "bin"
bin           = @["nimtracer"]

task test, "Runs the test suite":
  exec "nim c -r tests/tmath.nim"

# Dependencies

requires "nim >= 0.18.0", "websocket >= 0.3.1"
