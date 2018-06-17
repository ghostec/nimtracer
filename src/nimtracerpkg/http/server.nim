import asynchttpserver, asyncdispatch, rosencrantz, ../render, ../canvas

var server = newAsyncHttpServer()

let handler = get[
  path("/")[
    accessControlAllowAllOrigins[
      getRequest(proc(req: ref Request): auto =
        const r = Renderer()
        var c = newCanvas(640, 320)
        r.render(c)
        return ok($c)
      )
    ]
  ]
]

proc serve*() {.async.} = waitFor server.serve(Port(8080), handler)
