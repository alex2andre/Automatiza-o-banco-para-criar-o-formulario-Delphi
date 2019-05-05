program PrjTeste;

uses
  Forms,
  uFrmMain in 'uFrmMain.pas' {Form11},
  uFrmBaseForm in 'uFrmBaseForm.pas' {FrmBaseForm},
  uFrmBaseAutoForm in 'uFrmBaseAutoForm.pas' {frmBaseAutoForm},
  uFrmAutoForm in 'uFrmAutoForm.pas' {frmAutoForm},
  uFrmAutoFormModelo in 'modelo\uFrmAutoFormModelo.pas' {frmAutoFormModelo},
  padrao1 in 'modelo\padrao1.pas' {frmAutoFormModelo1},
  uDM in 'uDM.pas' {DM: TDataModule},
  Model.FactoryForm in 'Model.FactoryForm.pas',
  udump in 'udump.pas',
  uSalvaForm in 'uSalvaForm.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TForm11, Form11);
  Application.Run;
end.
