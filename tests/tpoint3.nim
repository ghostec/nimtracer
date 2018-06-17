import unittest, strutils, nimtracerpkg/math/vec3, nimtracerpkg/math/point3

suite "Point":
  test "+":
    const p1 = Point3[int](x: 1, y: 2, z: 3)
    const v = Vec3[int](x: 5, y: 7, z: 3)
    check((p1 + v).x == 6)
    check((p1 + v).y == 9)
    check((p1 + v).z == 6)

  test "- Vec3":
    const p1 = Point3[int](x: 1, y: 2, z: 3)
    const v = Vec3[int](x: 5, y: 7, z: 3)
    check((p1 - v).x == -4)
    check((p1 - v).y == -5)
    check((p1 - v).z == 0)

  test "- Point3":
    const p1 = Point3[int](x: 1, y: 2, z: 3)
    const p2 = Point3[int](x: 5, y: 7, z: 3)
    const v = p1 - p2
    check(v.x == -4)
    check(v.y == -5)
    check(v.z == 0)

  test "*":
    const p1 = Point3[int](x: 1, y: 2, z: 3)
    check(3*p1.x == 3)
    check(3*p1.y == 6)
    check(3*p1.z == 9)
    check(p1.x*3 == 3)
    check(p1.y*3 == 6)
    check(p1.z*3 == 9)

  test "*=":
    var p1 = Point3[int](x: 1, y: 2, z: 3)
    p1 *= 5
    check(p1.x == 5)
    check(p1.y == 10)
    check(p1.z == 15)
