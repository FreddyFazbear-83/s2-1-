//text file input
program LR151;

const
  Delimiters = ' ,.!?;:';

var
  text: string;
  words: array of string;
  i, count, wordsCount, textLength: Integer;
  wordStart, wordEnd: Integer;

begin
  AssignFile(input, 'input.txt');
  Reset(input);
  try
    ReadLn(input, text);
  except
    Writeln('Ошибка чтения файла');
    Halt(1);
  end;
  CloseFile(input);

  textLength := Length(text);
  SetLength(words, 0);

  wordStart := 1;
  for i := 1 to textLength do
  begin
    if (i = textLength) or (Pos(text[i], Delimiters) > 0) then
    begin
      wordEnd := i - 1;
      SetLength(words, Length(words) + 1);
      words[Length(words) - 1] := Copy(text, wordStart, wordEnd - wordStart + 1);
      wordStart := i + 1;
    end;
  end;

  wordsCount := Length(words);
  count := 0;
  for i := 0 to wordsCount - 1 do
  begin
    if (i = 0) or (CompareStr(words[i], words[i - 1]) <> 0) then
      Inc(count);
  end;

  Writeln('Number bukv from spiska: ', count);
end.