//Создать список из десяти элементов и вывести его на экран. Затем вывести только четные элементы списка.
//f/t nub (obudno :_( )
program LR152;

var
  I: byte;
  Mas: array[1..10] of integer;
  F: text;
  FileName, S: string;

begin
  FileName := 'nub.txt';

  assign(F, FileName);
  reset(F);
  try
    for I := 1 to 10 do begin
      try
        Readln(F, S);
        Mas[I] := StrToInt(S);
      except
        Writeln('Ошибка чтения или преобразования значения в строке ', I);
        Halt(1);
      end;
    end;
  except
    Writeln('Ошибка открытия файла');
    Halt(1);
  end;
  closeFile(F);
  writeln('Список четных элементов массива:');
  for I := 1 to 10 do
  begin
    if Mas[I] mod 2 = 0 then
      writeln(Mas[I]);
  end;
  readln;
end.