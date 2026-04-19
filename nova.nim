import std/[
  os,
  osproc,
  strformat,
  strutils
]

import submodules/[
  core,
  colors,
  remote,
  docs
]

let args = commandLineParams()
let FILENAME = paramStr(0)

if args.len < 1 or args[0].isEmptyorWhitespace():
  error fmt"""Missing operand
  {CYAN}[➜]{RESET} Try '{FILENAME} --help' for more information""".unindent()

case args[0]
of "login", "l":
  discard execCmd("gh auth login")
  
of "sync", "s":
  discard runcmd("gh repo sync")
  
of "current-branch", "cb":
  print fmt"Current branch: {BRANCH}"

of "--help", "help":
  showHelpN()

of "-v","--version":
  showVersion()
  
else:
  error fmt"""Invalid operand {args[0]}
  {CYAN}[➜]{RESET} Try '{FILENAME} --help' for more information""".unindent()
