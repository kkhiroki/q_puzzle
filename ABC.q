
// Input
blocks:string`BO`XK`DQ`CP`NA`GT`RE`TG`QD`FS`JW`HU`VI`AN`OB`ER`FS`LY`PC`ZM;
words:string`A`BARK`BOOK`TREAT`COMMON`SQUAD`CONFUSE;


// A solution in the text (recursive way to search all path)
cmw:{[s;b]                                                  / [string; blocks]
  $[0=count s; 1b;                                          /   empty string
    not any found:any each b=s 0; 0b;                       /   cannot proceed
    any(1_s).z.s/:b(til count b)except/:where found] };


// Expected result
expectedRes: cmw[;blocks] each words;



////////////////////////////////////////////////////////////
/ * 全体としてやりたいことは、
/ 　文字の先頭がブロックのいずれかに含まれているか走査。
/   含まれている場合、そのブロックを使用済みにして除外し、先頭１文字を削除した文字でもう一度同様に探索。
/   含まれていない場合、0bを返して終了。
/ 　再帰的にこの手順を繰り返す。重複ないブロックで所与の文字を作成出来たら1bを返す。そうでなければ0bを返す。
/ 
/ 
/ * B: 各blockの文字サイズ(上記では2)
/   N: the length of blocks
/   W: a length of a word
/ 
/ 
/ * not any found: any each b=s 0;
/   s 0 -> sの先頭文字
/   b=s 0 -> 各ブロックの各charがsの先頭文字に一致しているかのbool list (BxN)
/   found: any each b = s 0 -> 各ブロックの中にwordの先頭文字が含まれているか(長さNのbool list)
/   not any found: any each b=s 0 -> どの配列にもwordの先頭文字が含まれていない場合、falseを返す(early return)
/ 
/ 
/ * any(1_s).z.s/:b(til count b)except/:where found
/   where found -> 1bが立っているインデックスのリスト
/   /:where found -> /:はright eachでwhere foundで帰ってくるリストを走査
/   (til count b) except/:where found -> (til count b)で長さcount bのindex listを作成し、その中で既に使用したインデックスを除外したもの(except)を作成, (W-1)x(count found where found = 1)
/   (1_s).z.s/: -> .z.sがその関数自体を指す。1_sは先頭1文字を取り除いた文字。/:でright eachして、どのブロックを使用するかを全探索。
/ 




