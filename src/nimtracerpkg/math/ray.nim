import ./vec3, ./point3

type
  Ray*[T] = object
    origin: Point3[T]
    direction: Vec3[T]

proc newRay*[T](origin: Point3[T], direction: Vec3[T]): Ray[T] {.inline.} =
  result = Ray[T](origin: origin, direction: direction.unit)

proc origin*[T](r: Ray[T]): Point3[T] {.inline.} = r.origin
proc direction*[T](r: Ray[T]): Vec3[T] {.inline.} = r.direction
proc at*[T](r: Ray[T], t: T): Point3[T] {.inline.} = r.origin + t * r.direction
