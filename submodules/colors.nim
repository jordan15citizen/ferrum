import std/[terminal]

const 
    BRIGHT* = ansiStyleCode(styleBright)
    RED* = BRIGHT & ansiForegroundColorCode(fgRed)
    YELLOW* = BRIGHT & ansiForegroundColorCode(fgYellow)
    CYAN* = BRIGHT & ansiForegroundColorCode(fgCyan)
    GREEN* = BRIGHT & ansiForegroundColorCode(fgGreen)
    RESET* = ansiResetCode