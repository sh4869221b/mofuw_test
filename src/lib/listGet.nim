import httpclient, strutils
import mofuw

proc listGet* (ctx: MofuwCtx) =
  let urls = @["https://280blocker.net/files/280blocker_adblock.txt", "https://raw.githubusercontent.com/nanj-adguard/nanj-filter/master/nanj-filter.txt", "https://blog-imgs-116-origin.fc2.com/b/t/o/btonews/5ch_matome_filter.txt"]
  var response: string
  var client = newHttpClient()
  for a in urls:
    response = response & client.getContent(a)
  mofuwOK(response)