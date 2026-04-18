import std/[
  strformat,
  strutils,
  osproc,
]

import colors

proc print*(TEXT: string) =
  echo fmt"{CYAN}[*]{RESET} {TEXT}"

proc error*(ERRTEXT: string) =
  stderr.writeline fmt"{RED}[!]{RESET} {ERRTEXT}"
  quit(1)

proc warn*(WARNTEXT: string) =
  stderr.writeline fmt"{YELLOW}[-]{RESET} {WARNTEXT}"

proc success*(SCSTEXT: string) =
  echo fmt"{GREEN}[✓]{RESET} {SCSTEXT}"

proc runcmd*(COMMAND: string): string =
  let SCOMMAND = COMMAND.strip()
  let (output, exitcode) = execCmdEx(SCOMMAND)

  if exitcode != 0:
    error fmt"Command '{SCOMMAND}' failed"
  else:
    return output

proc read*(QUESTION: string): string =
  stdout.write fmt"{CYAN}[?]{RESET} {QUESTION}: "
  let readOut = stdin.readline()

  return readOut
