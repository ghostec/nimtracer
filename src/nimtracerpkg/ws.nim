import websocket, asynchttpserver, asyncnet, asyncdispatch
import render

var server = newAsyncHttpServer()

proc cb(req: Request) {.async.} =
  let (ws, error) = await(verifyWebsocketRequest(req, ""))
  if ws.isNil:
    echo "WS negotiation failed: ", error
    await req.respond(Http400, "Websocket negotiation failed: " & error)
    req.client.close()
  
  else:
    echo "New websocket customer arrived!"
    while true:
      try:
        var f = await ws.readData()
        echo "(opcode: ", f.opcode, ", data: ", f.data.len, ")"
        
        if f.opcode == Opcode.Text:
          waitFor ws.sendText(render(), masked = false)
        else:
          waitFor ws.sendBinary(f.data, masked = false)
      
      except:
        echo getCurrentExceptionMsg()
        break
    
    discard ws.close()
    echo ".. socket went away."

proc serve*() {.async.} = waitFor server.serve(Port(8080), cb)
