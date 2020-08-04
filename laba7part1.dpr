program laba7part1;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils,
  windows;

TYPE
  Arr = array [1 .. 255] of string;

var
  s, temp: string;
  ArrOfString: Arr;
  i: integer;
  lastWord: string;
  j, k: integer;
  NumberOfWords: integer;

procedure restouration(var s: string);     // удаление лишних пробелов между словами
begin

  i := 1;
  while i <= Length(s) do       //простой с предусловием
  begin
    if (s[i] = ' ') and (s[i + 1] = ' ') then
      delete(s, i + 1, 1)
    else
      Inc(i);
  end;
end;

procedure getArrayOfString(var s: string; var arrOfStr: Arr);      // заполнение строкового массива
var
  counter, j, k: integer;
  temp: string;
  lastWord: string;
begin
  j := 0;
  counter := Length(s) - 1;
  while s[counter] <> ' ' do    // простой с предусловием
    dec(counter);

  Inc(counter);
  lastWord := copy(s, counter, Length(s) - counter + 1);

  while Length(s) > 0 do   // сложный внешний с предусловием
  begin

    counter := 0;
    while s[counter] <> ' ' do    // простой внутренний с предусловием
      Inc(counter);

    temp := copy(s, 0, counter - 1);
    delete(s, 1, counter);
    if temp <> lastWord then
    begin
      Inc(j);
      arrOfStr[j] := temp;

    end;

  end;
  for k := 1 to j do     // простой внутренний с предусловием
    NumberOfWords := j;

end;

procedure p1(var arrOfStr: Arr);    // поиск и вывод слов, в которые последняя буква входит еще раз
var
  i: integer;
  lastSymbol: string;
  word: string;
begin

  for i := 1 to NumberOfWords do      // простой с предусловием
  begin
    lastSymbol := arrOfStr[i][Length(arrOfStr[i])];  // поиск последнего символа в слове
    delete(arrOfStr[i], Length(arrOfStr[i]), 1);       //удаляем

    if pos(lastSymbol, arrOfStr[i]) > 0 then         //если есть вхождение,то делаем
    begin
      write(concat(arrOfStr[i], lastSymbol), ' ');  //вывод слова с последним символом - конкатинация
      arrOfStr[i] := arrOfStr[i] + lastSymbol;      // возвращаем последний символ в слово
    end
    else
      arrOfStr[i] := arrOfStr[i] + lastSymbol;  // возвращаем последний символ в слово

  end;

end;

procedure p2(var ArrOfString: Arr);   //  добавление после каждой q буквы  u
  var counter: integer;
begin

  j := 1;
  i := 1;
  while i <= Length(ArrOfString) do              //сложный внешний с предусловием
  begin
    counter := 0;
    for j := 1 to Length(ArrOfString[i]) do       //простой внутренний с предусловием
    begin

      if ArrOfString[i][j + counter] = 'q' then
      begin
        insert('u', ArrOfString[i], j + counter + 1);
        Inc(counter);
      end
      else if (ArrOfString[i][j + counter] = 'q') and
        (j = Length(ArrOfString[i])) then
        ArrOfString[i] := ArrOfString[i] + 'u';
    end;

    Inc(i);
  end;

  for i := 1 to NumberOfWords do      //простой  с предусловием
    write(ArrOfString[i], ' ');

end;

begin
  SetConsoleCP(1251);
  SetConsoleOutPutCP(1251);
  writeln('Введиту строку на латинском:');
  readln(s);
  restouration(s);

  if s = ' ' then
    writeln('Строка оказалась пустой, попробуйте еще раз!', s);

  restouration(s);
  getArrayOfString(s, ArrOfString);    //заполнение строкового массива

  writeln;
  writeln('строка, отвечающая требованиям первого условия:');
  p1(ArrOfString);

  if ArrOfString[1] = ' ' then
    writeln('Строка оказалась пустой, попробуйте еще раз!');

  writeln;
  writeln;

  writeln('строка, отвечающая требованиям второго условия:');
  p2(ArrOfString);

  if ArrOfString[1] = ' ' then
    writeln('Строка оказалась пустой, попробуйте еще раз!');

  readln;
end.

