import canvas, math/vec3

type
  Renderer* = object

proc render*(r: Renderer, c: var Canvas) =
  for j in 0..c.height-1:
    for i in 0..c.width-1:
      let v = newVec3(
        float64(i / c.width),
        float64((c.height - 1 - j) / c.height),
        0.2
      )
      let p = newPixel(
        uint8(255.99 * v.x),
        uint8(255.99 * v.y),
        uint8(255.99 * v.z)
      )
      c.set(j, i, p)
  discard
