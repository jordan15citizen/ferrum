REALPATH=$(realpath .)
export PATH="$PATH:$REALPATH/bin/"
nim c -d:Danger --opt:speed --passL:-s --panics:on -o:bin/ ferrum
nim c -d:Danger --opt:speed --passL:-s --panics:on -o:bin/ nova
