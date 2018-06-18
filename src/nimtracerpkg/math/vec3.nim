import math

type
  Vec3*[T] = object
    x*, y*, z*: T

proc newVec3*[T](x, y, z: T): Vec3[T] =
  result = Vec3[T](x: x, y: y, z: z)

proc `+`*[T](v1, v2: Vec3[T]): Vec3[T] {.inline.} =
  result = Vec3[T](x: v1.x + v2.x, y: v1.y + v2.y, z: v1.z + v2.z)

proc `-`*[T](v1: Vec3[T]): Vec3[T] {.inline.} =
  result = Vec3[T](x: -v1.x, y: -v1.y, z: -v1.z)

proc `-`*[T](v1, v2: Vec3[T]): Vec3[T] {.inline.} =
  result = v1 + -v2

proc `+=`*[T](v1: var Vec3[T], v2: Vec3[T]) {.inline.} =
  v1.x += v2.x
  v1.y += v2.y
  v1.z += v2.z
  discard

proc `-=`*[T](v1: var Vec3[T], v2: Vec3[T]) {.inline.} =
  v1 += -v2
  discard

proc `*`*[T](v1: Vec3[T], v: T): Vec3[T] {.inline.} =
  result = Vec3[T](x: v * v1.x, y: v * v1.y, z: v * v1.z)
proc `*`*[T](v: T, v1: Vec3[T]): Vec3[T] {.inline.} =
  result = v1 * v

proc `/`*[T](v1: Vec3[T], v: T): Vec3[T] {.inline.} =
  result = Vec3[T](x: v1.x / v, y: v1.y / v, z: v1.z / v)

proc `*=`*[T](v1: var Vec3[T], v: T) {.inline.} =
  v1.x *= v
  v1.y *= v
  v1.z *= v
  discard

proc `/=`*[T](v1: var Vec3[T], v: T) {.inline.} =
  v1.x /= v
  v1.y /= v
  v1.z /= v
  discard

proc `dot`*[T](v1, v2: Vec3[T]): T {.inline.} =
  result = v1.x * v2.x + v1.y * v2.y + v1.z * v2.z

proc `cross`*[T](v1, v2: Vec3[T]): Vec3[T] {.inline.} =
  result = Vec3[T](
    x: v1.y * v2.z - v1.z * v2.y,
    y: v1.z * v2.x - v1.x * v2.z,
    z: v1.x * v2.y - v1.y * v2.x
  )

proc `squaredLength`*[T](v1: Vec3[T]): T {.inline.} =
  result = v1.x * v1.x + v1.y * v1.y + v1.z * v1.z
proc `length`*[T](v1: Vec3[T]): T {.inline.} =
  result = sqrt(v1.squaredLength)

proc unit*[T](v1: Vec3[T]): Vec3[T] {.inline.} =
  result = v1 / v1.length

proc toUnit*[T](v1: var Vec3[T]) {.inline.} =
  v1 /= v1.length
  discard
