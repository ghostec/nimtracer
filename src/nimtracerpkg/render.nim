import canvas, math/point3, math/vec3, math/ray

type
  Renderer* = object

proc color[T](r: Ray[T]): Vec3[T] =
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
