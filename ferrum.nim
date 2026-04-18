import std/[
  os,
  osproc,
  strformat,
  strutils
]

import submodules/[
  core,
  colors,
  docs,
  remote
]

var answer = "placeholder"
const VERSION = staticRead("version.conf").strip()

let args = commandLineParams()

if args.len < 1 or args[0].isEmptyOrWhitespace():
  error fmt"""Missing operand
  {CYAN}[➜]{RESET} Try 'ferrum --help' for more information""".unindent()

case args[0]
of "push", "p":
  if args.len < 2 or args[1].isEmptyOrWhitespace():
    error fmt"""Missing operand
    {CYAN}[➜]{RESET} Try 'ferrum --help' for more information""".unindent()
    
  gitPush(args[1])

of "init", "i":
  gitInit()

of "--help", "help":
  showHelp()

of "pull", "pl":
  gitPull()

of "repo", "r":
  if args.len < 2 or args[1].isEmptyorWhitespace():
    error fmt"""Missing operand
    {CYAN}[➜]{RESET} Try 'ferrum --help' for more information"""

  case args[1]
  of "new", "n":
    discard execCmd("gh repo new")
    
  of "delete", "del":
    answer = read("Repository name")
    
    if answer.isEmptyorWhitespace():
      error "Repository name not given"

    discard runcmd(fmt"gh repo delete {answer}")

  of "clone", "c":
    answer = read("Repository name from you")

    if answer.isEmptyorWhitespace():
     error "Respository name not given"
    
    discard runcmd(fmt"gh repo clone {answer}")

of "-v", "--version":
  print fmt"Ferrum v{VERSION}"

of "status", "s":
  discard execCmd("git status")

else:
  error fmt"""Invalid operand {args[0]}
  {CYAN}[➜]{RESET} Try 'ferrum --help' for more information""".unindent()
