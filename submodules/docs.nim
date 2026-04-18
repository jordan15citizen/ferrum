import colors
import std/[strformat]

proc showHelp*() =
  echo fmt"{BRIGHT}USAGE{RESET}"
  echo "  ferrum <command> [args]"
  echo ""

  echo fmt"{BRIGHT}COMMANDS{RESET}"
  echo "  push <msg>         Push changes to remote"
  echo "  init               Initialize git"
  echo "  status             Check uncommitted chnages"
  echo "  pull               Pull data from remote"
  echo "  help               Show this information"
  echo "  repo <args>        Repository actions"
  echo "  --version          Show app version"
  echo ""

  echo fmt"{BRIGHT}ARGUMENTS{RESET}"
  echo "  push <msg>         The commit message"
  echo "  repo <args>        The action [ new | clone | delete ]"
  echo ""

  echo fmt"{BRIGHT}SHORTCUTS{RESET}"
  echo "  push | p           Push shortcut"
  echo "  repo | r           Repository shortcut [ n | c | del ]"
  echo "  pull | pl          Pull shortcut"
  echo "  init | i           Init shortcut"
  echo "  status | s         Status shortcut"
  echo "  --version | -v     Version shortcut"
