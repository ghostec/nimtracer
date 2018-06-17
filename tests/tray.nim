import unittest, strutils
import nimtracerpkg/math/ray, nimtracerpkg/math/point3, nimtracerpkg/math/vec3

suite "Ray":
  test "newRay":
    const r = newRay(
      Point3[float64](x: 1, y: 2, z: 3),
      Vec3[float64](x: 3, y:3, z: 5)
    )
    check(r.origin.x == 1)
    check(r.origin.y == 2)
    check(r.origin.z == 3)
    check(r.direction.x.formatFloat(ffDecimal, 4) == "0.4575")
    check(r.direction.y.formatFloat(ffDecimal, 4) == "0.4575")
    check(r.direction.z.formatFloat(ffDecimal, 4) == "0.7625")

  test "at":
    const r = newRay(
      Point3[float64](x: 1, y: 2, z: 3),
      Vec3[float64](x: 3, y:3, z: 5)
    )
    check(r.at(5).x.formatFloat(ffDecimal, 4) == "3.2875")
    check(r.at(5).y.formatFloat(ffDecimal, 4) == "4.2875")
    check(r.at(5).z.formatFloat(ffDecimal, 4) == "6.8125")
