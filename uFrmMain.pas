unit uFrmMain;

interface

uses
   SysUtils, Variants,
  Classes, Graphics,
  Controls, Forms, Dialogs, StdCtrls, Model.FactoryForm;

type
  TForm11 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    mmo1: TMemo;
    Button4: TButton;
    btn1: TButton;
    btn2: TButton;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form11: TForm11;

implementation

uses
  uFrmAutoForm,udump;

{$R *.dfm}

procedure TForm11.btn1Click(Sender: TObject);
begin
   TFactoryForm.GetInstance.GetForm(tfLancamento).ShowModal;
end;

procedure TForm11.btn2Click(Sender: TObject);
begin
{  if not Assigned(frmAutoFormModelo1) then
    frmAutoFormModelo1:=TfrmAutoFormModelo1.Create(Self);

  frmAutoFormModelo1.ShowModal;
  FreeAndNil(frmAutoFormModelo1);}
end;

procedure TForm11.Button1Click(Sender: TObject);
var form:TfrmAutoForm;
begin
  form:=TFactoryForm.GetInstance.GetForm(tfGrupo);
mmo1.Lines.Add(  DumpTypeDefinition(form.ClassInfo));
  form.ShowModal;
end;

procedure TForm11.Button2Click(Sender: TObject);
begin
  TFactoryForm.GetInstance.GetForm(tfProduto).ShowModal;
end;

procedure TForm11.Button3Click(Sender: TObject);
begin
  TFactoryForm.GetInstance.GetForm(tfCategoria).ShowModal;
end;

procedure TForm11.Button(Sender: TObject);
begin  TFactoryForm.GetInstance.GetForm(tfPessoa).ShowModal;
end;

end.
