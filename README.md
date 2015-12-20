# cointoss
A simple pseudorandom cointoss shell script, it's for those who (like me) don't bother with keeping spare change lying around anywhere near their desk.

## Installation
The script is easy enough to install. It's a single shell script file. Just put it wherever you want (either in your home directory or another directory where you keep all of your user scripts) and add an alias to your .bashrc:
```
alias cointoss='bash ~/path/to/script/cointoss.sh'
```
Default perms for the script are 0644 (-rw-r--r--) and require the use of bash in the alias to properly invoke the script, but can be easily chmod'ed to 0755 (-rwxr-xr-x) if desired to directly invoke the script without passing it as input to bash.

## Usage
The script is invoked quite simply, either by providing no input or a single input value as an integer:
```
calyodelphi@dragonpad:~ $ cointoss
Tossing a coin!
Heads!	
calyodelphi@dragonpad:~ $ cointoss 5
Best 3 out of 5?
Heads!	Heads!	Heads!	Tails!	Tails!	
Heads wins!
```

Cointoss is able to announce a tied toss if an even number is provided as the input. If the input value is greater than 10, cointoss will also echo a tally of heads and tails results so that the user does not have to manually count them:
```
calyodelphi@dragonpad:~ $ cointoss 20
Best 11 out of 20?
Heads!	Tails!	Heads!	Heads!	Tails!	
Tails!	Tails!	Tails!	Tails!	Tails!	
Tails!	Heads!	Heads!	Tails!	Tails!	
Tails!	Tails!	Heads!	Tails!	Tails!	

Heads:	6
Tails:	14
Tails wins!
```
