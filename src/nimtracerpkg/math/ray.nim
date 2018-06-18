import ./vec3, ./point3

type
  Ray* = object
    origin: Point3[float64]
    direction: Vec3[float64]

proc newRay*(origin: Point3[float64], direction: Vec3[float64]): Ray {.inline.} =
  result = Ray(origin: origin, direction: direction.unit)

proc origin*(r: Ray): Point3[float64] {.inline.} = r.origin
proc direction*(r: Ray): Vec3[float64] {.inline.} = r.direction
proc at*[T](r: Ray, t: T): Point3[float64] {.inline.} = r.origin + t * r.direction
