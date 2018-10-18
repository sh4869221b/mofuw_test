import httpclient, strutils
import mofuw

proc handler(ctx: MofuwCtx) {.async.} =
  if ctx.getPath == "/":
    mofuwOK("Hello","plain/txt")
  elif ctx.getPath == "/api":
    mofuwOK("api")
  elif ctx.getPath == "/list":
    let urls = @["https://280blocker.net/files/280blocker_adblock.txt", "https://raw.githubusercontent.com/nanj-adguard/nanj-filter/master/nanj-filter.txt", "https://blog-imgs-116-origin.fc2.com/b/t/o/btonews/5ch_matome_filter.txt"]
    var response: string
    var client = newHttpClient()
    for a in urls:
      response = response & client.getContent(a)
    mofuwOK(response)
  else:
    mofuwResp(mofuw.mofuhttputils.HTTP404, "tet/plain","Not Found")

when isMainModule:
  newServeCtx(
    port = 8080,
    handler = handler
  ).serve()
