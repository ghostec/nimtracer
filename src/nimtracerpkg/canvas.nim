import strutils

type
  Pixel* = object
    r*: uint8
    g*: uint8
    b*: uint8

  Canvas* = object
    width: int
    height: int
    pixels*: seq[Pixel]

proc newCanvas*(width, height: int): Canvas =
  Canvas(width: width, height: height, pixels: newSeq[Pixel](width * height))

proc `[]`*(p: Pixel, i: int): uint8 =
  result = case i:
    of 0: p.r
    of 1: p.g
    of 2: p.b
    else: 0

proc `[]=`*(p: var Pixel, i: int, v: uint8) =
  case i:
    of 0: p.r = v
    of 1: p.g = v
    of 2: p.b = v
    else: discard

proc get*(c: Canvas, i, j: int): Pixel =
  # TODO: handle i > height and j > width
  result = c.pixels[i * c.width + j]

proc set*(c: var Canvas, i, j: int, p: Pixel) =
  c.pixels[i * c.width + j] = p

# Pixel's PPM format
proc `$`*(p: Pixel): string =
  result = "$1\t$2\t$3\t" % [$p.r, $p.g, $p.b]

# Canvas' PPM format
proc `$`*(c: Canvas): string =
  result = "P3\n$1 $2\n255\n" % [$c.width, $c.height]
  for row in 0..c.height-1:
    for col in 0..c.width-1:
      result &= $c.get(row, col)
    result &= "\n"
