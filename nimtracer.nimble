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
  exec "nim c -r tests/tpoint3.nim"
  exec "nim c -r tests/tray.nim"

# Dependencies

requires "nim >= 0.18.0"
requires "rosencrantz >= 0.3.4"
