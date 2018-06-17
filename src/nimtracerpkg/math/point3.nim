import ./vec3.nim

type
  Point3*[T] = object
    x*, y*, z*:  T

proc newPoint3*[T](x, y, z: T): Point3[T] =
  result = Point3[T](x: x, y: y, z: z)

proc `+`*[T](p: Point3[T], v: Vec3[T]): Point3[T] {.inline.} =
  result = Point3[T](x: p.x + v.x, y: p.y + v.y, z: p.z + v.z)

proc `-`*[T](p: Point3[T], v: Vec3[T]): Point3[T] {.inline.} =
  result = p + -v

proc `-`*[T](p1, p2: Point3[T]): Vec3[T] {.inline.} =
  result = Vec3[T](x: p1.x - p2.x, y: p1.y - p2.y, z: p1.z - p2.z)

proc `*`*[T](p: Point3[T], a: T): Point3[T] {.inline.} =
  result = Point3[T](x: a * p.x, y: a * p.y, z: a * p.z)

proc `*`*[T](a: T, p: Point3[T]): Point3[T] {.inline.} =
  result = p * a

proc `*=`*[T](p: var Point3[T], a: T) {.inline.} =
  p.x *= a
  p.y *= a
  p.z *= a
  discard
