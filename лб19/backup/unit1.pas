unit Unit1;

{$mode objfpc}{$H+}

interface

uses
Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

{ TMain }

TMain = class(TForm)
Button1: TButton;
Button10: TButton;
Button11: TButton;
Button12: TButton;
Button13: TButton;
Button14: TButton;
Button15: TButton;
Button16: TButton;
Button17: TButton;
Button18: TButton;
Button19: TButton;
Button2: TButton;
Button20: TButton;
Button21: TButton;
Button22: TButton;
Button3: TButton;
Button4: TButton;
Button9: TButton;
Edit1: TEdit;
procedure Button14Click(Sender: TObject);
procedure Button22Click(Sender: TObject);
procedure Button1Click(Sender: TObject);
procedure Button2Click(Sender: TObject);
procedure Button3Click(Sender: TObject);
procedure Button4Click(Sender: TObject);
procedure Button8Click(Sender: TObject);
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
if (Edit1.Text <> '') then
begin
if not firstNumberEntered then
begin
a := StrToFloat(Edit1.Text);
firstNumberEntered := true;
end
else
begin
b := StrToFloat(Edit1.Text);
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
Edit1.Clear;
znak := (Sender as TButton).Caption;
end;
end;

procedure TMain.ClickButton(Sender: TObject);
begin
  if (Sender as TButton).Caption = '-' then begin
    if Edit1.Text = '' then
      Edit1.Text := '-'
    end
  else
  begin
    if Edit1.Text = '0' then
      if (Sender as TButton).Caption <> ',' then
        Edit1.Text:= '';
    if ((Sender as TButton).Caption = ',') then begin
       if Pos(',', Edit1.Text) > 0 then
       ShowMessage('Нельзя!')
       else
       Edit1.Text := Edit1.Text + (Sender as TButton).Caption;
    end
    else
       Edit1.Text := Edit1.Text + (Sender as TButton).Caption;
end;
end;

procedure TMain.Button1Click(Sender: TObject);
var
  str: string;
begin
  str := Edit1.Text;
  if str <> '' then
  begin
    if str[1] = '-' then
      Delete(str, 1, 1)
    else
      Delete(str, Length(str), 1);
      if str = '' then
         str:='0';
  end;


  Edit1.Text := str;
end;

procedure TMain.Button22Click(Sender: TObject);
begin
if (Edit1.Text <> '') and (firstNumberEntered) then
begin
b := StrToFloat(Edit1.Text);
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
Edit1.Text := FloatToStr(a);
firstNumberEntered := false;
znak := '';
end;
end;

procedure TMain.Button14Click(Sender: TObject);
begin
if (Edit1.Text <> '') then
begin
if a <> 0 then begin
a := StrToFloat(Edit1.Text);
a := 1 / a;
Edit1.Text := FloatToStr(a);
end
else
   ShowMessage('Нельзя делить на ноль');
end;
end;

procedure TMain.Button4Click(Sender: TObject);
begin
Edit1.Text:='0';
end;


procedure TMain.Button2Click(Sender: TObject);
begin
Edit1.Text:= '0';
a := 0;
b := 0;
znak := '';
firstNumberEntered := false;
end;

procedure TMain.Button3Click(Sender: TObject);
begin
if (Edit1.Text <> '') then
begin
a := StrToFloat(Edit1.Text);
if a >= 0 then
a := Sqrt(a)
else
ShowMessage('Недопустимое значение для корня');
Edit1.Text := FloatToStr(a);
end;
end;

procedure TMain.Button8Click(Sender: TObject);
begin
if (Edit1.Text <> '') then
begin
a := StrToFloat(Edit1.Text);
a := Sqr(a);
Edit1.Text := FloatToStr(a);
end;
end;

end.
