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
  let (output, exitcode) = execCmdEx(COMMAND)

  if exitcode != 0:
    error fmt"Command '{COMMAND}' failed".unindent()
  else:
    return output
