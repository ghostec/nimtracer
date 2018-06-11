import canvas

proc render*(): string =
  var c = newCanvas(10, 10)
  for i in 0..9:
    for j in 0..9:
      let p = Pixel(r: cast[uint8](255), g: 0, b: 0)
      c.set(i, j, p)
  result = $c
