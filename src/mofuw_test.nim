import httpclient, strutils
import mofuw
import lib/listGet

proc handler(ctx: MofuwCtx) {.async.} =
  if ctx.getPath == "/":
    mofuwOK("Hello","plain/txt")
  elif ctx.getPath == "/api":
    mofuwOK("api")
  elif ctx.getPath == "/list":
    listGet(ctx)
  else:
    mofuwResp(mofuw.mofuhttputils.HTTP404, "tet/plain","Not Found")

when isMainModule:
  newServeCtx(
    port = 8080,
    handler = handler
  ).serve()
