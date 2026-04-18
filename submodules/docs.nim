import colors
import std/[strformat]

proc showHelp*() =
  echo fmt"{BRIGHT}USAGE{RESET}"
  echo "  ferrum <command> [args]"
  echo ""

  echo fmt"{BRIGHT}COMMANDS{RESET}"
  echo "  push <msg>     Push changes to remote"
  echo "  help           Show this information"
