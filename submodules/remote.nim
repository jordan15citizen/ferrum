import core
import std/[strformat]

let BRANCH = runcmd("git branch --show-current")

proc gitPush*(COMMITMSG: string) =
  print "Committing changes [1/2]"
  discard runcmd("git add .")
  discard runcmd(fmt"""git commit -m "{COMMITMSG}" """)

  print "Pushing to remote [2/2]"
  discard runcmd(fmt"git push origin {BRANCH}")

proc gitPull*() =
  print "Pulling from remote"
  discard runcmd(fmt"git pull origin {BRANCH}")

proc gitInit*() =
  print "Initializing git"
  discard runcmd("git init")
  discard runcmd("git branch -m main")
  discard runcmd("git add .")
