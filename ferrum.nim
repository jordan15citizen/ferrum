import std/[
  os,
  strformat,
  strutils
]

import submodules/[
  core,
  colors,
  docs,
  remote
]

let args = commandLineParams()

if args.len < 1 or args[0].isEmptyOrWhitespace():
  error fmt"""Missing operand
  {CYAN}[➜]{RESET} Try 'ferrum --help' for more information""".unindent()

case args[0]
of "push":
  if args.len < 2 or args[1].isEmptyOrWhitespace():
    error fmt"""Missing operand
    {CYAN}[➜]{RESET} Try 'ferrum --help' for more information""".unindent()
    
  gitPush(args[1])

of "--help", "help":
  showHelp()

of "pull":
  gitPull()

else:
  error fmt"""Invalid operand {args[0]}
  {CYAN}[➜]{RESET} Try 'ferrum --help' for more information""".unindent()
