import canvas, math, math/point3, math/vec3, math/ray

type
  Hitable* = concept h
    h.hit(Ray) is HitRecord

  Renderer* = object

  Sphere* = ref object
    center: Point3[float64]
    radius: float64

  HitRecord* = object
    t: float64
    point: Point3[float64]
    normal: Vec3[float64]
    hit: bool

proc newSphere*(c: Point3[float64], r: float64): Sphere =
  var s: Sphere
  new(s)
  s.center = c
  s.radius = r
  result = s

const tmin = 0.0
const tmax = MaxFloat64Precision

proc hit(s: Sphere, r: Ray): HitRecord =
  let oc = r.origin - s.center
  let a = dot(r.direction, r.direction)
  let b = 2.0 * dot(oc, r.direction)
  let c = dot(oc, oc) - s.radius * s.radius
  let discriminant = b * b - 4.0 * a * c
  if discriminant < 0:
    return HitRecord(hit: false)
  let sqrtDisc = sqrt(discriminant)
  var temp = (-b - sqrtDisc) / a
  if (temp < tmax and temp > tmin):
    let p = r.at(temp)
    return HitRecord(
      t: temp, point: p, normal: (p - s.center) / s.radius, hit: true
    )
  temp = (-b + sqrtDisc) / a
  if (temp < tmax and temp > tmin):
    let p = r.at(temp)
    return HitRecord(
      t: temp, point: p, normal: (p - s.center) / s.radius, hit: true
    )
  result = HitRecord(hit: false)

proc hit(r: Ray, h: Hitable): HitRecord {.inline.} =
  result = h.hit(r)

proc color(r: Ray): Vec3[float64] =
  let s = newSphere(newPoint3[float64](0, 0, -1), 0.5)
  if r.hit(s).hit:
    return newVec3[float64](1, 0, 0)
  let t = 0.5 * (r.direction.y + 1)
  return (1.0 - t) * newVec3(1.0, 1.0, 1.0) + t * newVec3(0.5, 0.7, 1.0)

proc render*(r: Renderer, c: var Canvas) =
  const origin = newPoint3[float64](0, 0, 0)
  const lowerLeftCorner = newVec3[float64](-2, -1, -1)
  const horizontal = newVec3[float64](4, 0, 0)
  const vertical = newVec3[float64](0, 2, 0)
  for j in 0..c.height-1:
    for i in 0..c.width-1:
      let u = i / c.width
      let v = (c.height - 1 - j) / c.height
      let r = newRay(origin, lowerLeftCorner + u * horizontal + v * vertical)
      let col = color(r)
      let p = newPixel(
        uint8(255.99 * col.x),
        uint8(255.99 * col.y),
        uint8(255.99 * col.z)
      )
      c.set(j, i, p)
  discard
