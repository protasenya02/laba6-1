program laba7part2;

{$APPTYPE CONSOLE}
{$R *.res}

uses System.SysUtils, windows;

var
  s, temp: string;

begin
  SetConsoleCP(1251);
  SetConsoleOutPutCP(1251);

  write('Введите исходный текст: ');
  writeln;
  readln(s);
  if s = '' then
  writeln('Строка оказалась пустой, попробуйте еще раз!')
  else
  begin
    writeln('Сжатый текст:');
    s := s + ')';
    while length(s) > 0 do
    begin
      temp := temp + s[1];
      delete(s, 1, 1);
      if length(temp) > 1 then
      begin
        if temp[length(temp) - 1]<> temp[length(temp)]
        then
        begin
          if length(temp) <= 4 then
            write(copy(temp, 1, (length(temp) - 1)))
          else
          write('(', (length(temp) - 1), ')', temp[1]);
          delete(temp, 1, (length(temp) - 1));
        end;
      end;
    end;

  end;

  readln;

end.

