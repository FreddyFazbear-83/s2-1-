unit Unit1;

{$mode objfpc}{$H+}

interface

uses
Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

{ TMain }

TMain = class(TForm)
  Button7: TButton;
  Button8: TButton;
  Button9: TButton;
Buttonback: TButton;
Button4: TButton;
Button5: TButton;
Button6: TButton;
ButtonMultiplication: TButton;
ButtonDelX: TButton;
Button1: TButton;
Button2: TButton;
Button3: TButton;
ButtonMinus: TButton;
Button0: TButton;
ButtonCEclick: TButton;
ButtonComma: TButton;
Buttonplus: TButton;
ButtonRavno: TButton;
ButtonKopclick: TButton;
ButtonCclick: TButton;
ButtonDividion: TButton;
Buttonsquare: TButton;
Editfield: TEdit;
procedure ButtonDelXClick(Sender: TObject);
procedure ButtonRavnoClick(Sender: TObject);
procedure ButtonbackClick(Sender: TObject);
procedure ButtonCEclickClick(Sender: TObject);
procedure ButtonKopclickClick(Sender: TObject);
procedure ButtonCclickClick(Sender: TObject);
procedure ButtonsquareClick(Sender: TObject);
procedure ClickButton(Sender: TObject);
procedure ClickZnak(Sender: TObject);
private

public

end;

var
Main: TMain;
a, b: Double;
Zallow: boolean  = True;
znak: string;
firstNumberEntered: boolean = false;

implementation

{$R *.lfm}

{ TMain }

procedure TMain.ClickZnak(Sender: TObject);
begin
if (Editfield.Text <> '') then
begin
if not firstNumberEntered then
begin
a := StrToFloat(Editfield.Text);
firstNumberEntered := true;
end
else
begin
b := StrToFloat(Editfield.Text);
case znak of
'+': a := a + b;
'-': a := a - b;
'*': a := a * b;
'/': begin
  if b <> 0 then
     a := a / b
  else
     ShowMessage('Нельзя делить на ноль');
  end;
end;
end;
Editfield.Clear;
znak := (Sender as TButton).Caption;
end;
end;

procedure TMain.ClickButton(Sender: TObject);
begin
  if (Sender as TButton).Caption = '-' then begin
    if Editfield.Text = '' then
      Editfield.Text := '-'
    end
  else
  begin
    if Editfield.Text = '0' then
      if (Sender as TButton).Caption <> ',' then
        Editfield.Text:= '';
    if ((Sender as TButton).Caption = ',') then begin
       if Pos(',', Editfield.Text) > 0 then
       ShowMessage('Нельзя!')
       else
       Editfield.Text := Editfield.Text + (Sender as TButton).Caption;
    end
    else
       Editfield.Text := Editfield.Text + (Sender as TButton).Caption;
end;
end;

procedure TMain.ButtonbackClick(Sender: TObject);
var
  str: string;
begin
  str := Editfield.Text;
  if str <> '' then
  begin
    if str[1] = '-' then
      Delete(str, 1, 1)
    else
      Delete(str, Length(str), 1);
      if str = '' then
         str:='0';
  end;


  Editfield.Text := str;
end;

procedure TMain.ButtonRavnoClick(Sender: TObject);
begin
if (Editfield.Text <> '') and (firstNumberEntered) then
begin
b := StrToFloat(Editfield.Text);
case znak of
'+': a := a + b;
'-': a := a - b;
'*': a := a * b;
'/': begin
  if b <> 0 then
     a := a / b
  else
     ShowMessage('Нельзя делить на ноль');
  end;
end;
Editfield.Text := FloatToStr(a);
firstNumberEntered := false;
znak := '';
end;
end;

procedure TMain.ButtonDelXClick(Sender: TObject);
begin
if (Editfield.Text <> '') then
begin
if a <> 0 then begin
a := StrToFloat(Editfield.Text);
a := 1 / a;
Editfield.Text := FloatToStr(a);
end
else
   ShowMessage('Нельзя делить на ноль');
end;
end;

procedure TMain.ButtonCclickClick(Sender: TObject);
begin
Editfield.Text:='0';
end;


procedure TMain.ButtonCEclickClick(Sender: TObject);
begin
Editfield.Text:= '0';
a := 0;
b := 0;
znak := '';
firstNumberEntered := false;
end;

procedure TMain.ButtonKopclickClick(Sender: TObject);
begin
if (Editfield.Text <> '') then
begin
a := StrToFloat(Editfield.Text);
if a >= 0 then
a := Sqrt(a)
else
ShowMessage('Недопустимое значение для корня');
Editfield.Text := FloatToStr(a);
end;
end;

procedure TMain.ButtonsquareClick(Sender: TObject);
begin
if (Editfield.Text <> '') then
begin
a := StrToFloat(Editfield.Text);
a := Sqr(a);
Editfield.Text := FloatToStr(a);
end;
end;

end.
