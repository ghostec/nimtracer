import unittest, strutils, nimtracerpkg/canvas, nimtracerpkg/math/vec3

suite "canvas types":
  echo "suite setup: run once before the tests"
  
  setup:
    echo "run before each test"
  
  teardown:
    echo "run after each test"
  
  test "Pixel accessor operator":
    var p = Pixel(r: 255, g: 128, b: 0)
    check(p.r == p[0])
    check(p.g == p[1])
    check(p.b == p[2])
    p[2] = cast[uint8](77)
    check(p.b == 77)
  
  echo "suite teardown: run once after the tests"

suite "Vec3":
  test "+":
    const v1 = Vec3[int](x: 2, y: 1, z: 0)
    const v2 = Vec3[int](x: 3, y: 2, z: 4)
    const v3 = v1 + v2
    check(v3.x == 5)
    check(v3.y == 3)
    check(v3.z == 4)

  test "+=":
    var v1 = Vec3[int](x: 2, y: 1, z: 0)
    const v2 = Vec3[int](x: 3, y: 2, z: 4)
    v1 += v2
    check(v1.x == 5)
    check(v1.y == 3)
    check(v1.z == 4)

  test "unary -":
    const v1 = Vec3[int](x: 2, y: 1, z: 0)
    const v2 = -v1
    check(v2.x == -2)
    check(v2.y == -1)
    check(v2.z == 0)

  test "-=":
    var v1 = Vec3[int](x: 2, y: 1, z: 0)
    const v2 = Vec3[int](x: 3, y: 2, z: 4)
    v1 -= v2
    check(v1.x == -1)
    check(v1.y == -1)
    check(v1.z == -4)

  test "dot":
    var v1 = Vec3[int](x: 2, y: 1, z: 0)
    const v2 = Vec3[int](x: 3, y: 2, z: 4)
    check(dot(v1, v2) == 6 + 3 + 0)
    check(v1.dot(v2) == 6 + 3 + 0)

  test "cross":
    const v1 = Vec3[int](x: 2, y: 1, z: 3)
    const v2 = Vec3[int](x: 3, y: 2, z: 4)
    const v3 = cross(v1, v2)
    check(v3.x == -2)
    check(v3.y == 1)
    check(v3.z == 1)

  test "*":
    const v1 = Vec3[int](x: 2, y: 1, z: 3)
    const v2 = 7 * v1
    const v3 = v1 * 7
    check(v2.x == 14)
    check(v2.y == 7)
    check(v2.z == 21)
    check(v3.x == 14)
    check(v3.y == 7)
    check(v3.z == 21)

  test "*=":
    var v1 = Vec3[int](x: 2, y: 1, z: 3)
    v1 *= 7
    check(v1.x == 14)
    check(v1.y == 7)
    check(v1.z == 21)

  test "/":
    const v1 = Vec3[float64](x: 9, y: 3, z: 6)
    const v2 = v1 / 3
    check(v2.x == 3)
    check(v2.y == 1)
    check(v2.z == 2)

  test "/=":
    var v1 = Vec3[float64](x: 6, y: 3, z: 9)
    v1 /= 3
    check(v1.x == 2)
    check(v1.y == 1)
    check(v1.z == 3)

  test "toUnit":
    var v1 = Vec3[float64](x: 6, y: 3, z: 9)
    v1.toUnit
    check(v1.x.formatFloat(ffDecimal, 4) == "0.5345")
    check(v1.y.formatFloat(ffDecimal, 4) == "0.2673")
    check(v1.z.formatFloat(ffDecimal, 4) == "0.8018")

  test "unit":
    const v1 = Vec3[float64](x: 6, y: 3, z: 9)
    const v2 = v1.unit
    check(v1.x == 6)
    check(v1.y == 3)
    check(v1.z == 9)
    check(v2.x.formatFloat(ffDecimal, 4) == "0.5345")
    check(v2.y.formatFloat(ffDecimal, 4) == "0.2673")
    check(v2.z.formatFloat(ffDecimal, 4) == "0.8018")

  test "squaredLength":
    const v1 = Vec3[float64](x: 6, y: 3, z: 9)
    check(v1.squaredLength == 126)

  test "length":
    const v1 = Vec3[float64](x: 6, y: 3, z: 9)
    check(v1.length.formatFloat(ffDecimal, 4) == "11.2250")
