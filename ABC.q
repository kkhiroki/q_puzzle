
// Input
blocks:string`BO`XK`DQ`CP`NA`GT`RE`TG`QD`FS`JW`HU`VI`AN`OB`ER`FS`LY`PC`ZM;
words:string`A`BARK`BOOK`TREAT`COMMON`SQUAD`CONFUSE;


// A solution in the text
cmw:{[s;b]                                                  / [string; blocks]
  $[0=count s; 1b;                                          /   empty string
    not any found:any each b=s 0; 0b;                       /   cannot proceed
    any(1_s).z.s/:b(til count b)except/:where found] };


// Expected result
expectedRes: cmw[;blocks] each words;



