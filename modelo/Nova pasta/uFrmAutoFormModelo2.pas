unit uFrmAutoFormModelo;

interface

uses
  SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmBaseAutoForm, FMTBcd, DB, DBClient, Provider, SqlExpr,
  StdCtrls, Buttons, DBCtrls, Grids, DBGrids, ExtCtrls, SimpleDS, ComCtrls,
  ToolWin, ImgList, ActnList, WideStrings,
  uDM, System.ImageList, System.Actions, Vcl.Mask;

type
  TfrmAutoForm = class(TfrmBaseAutoForm)
    sdsMetaData: TSimpleDataSet;
    sqAutoForm: TSQLDataSet;
    dspAutoForm: TDataSetProvider;
    cdsAutoForm: TClientDataSet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    DBLookupComboBox15: TDBLookupComboBox;
    DBLookupComboBox16: TDBLookupComboBox;
    procedure FormShow(Sender: TObject);
    procedure cdsAutoFormNewRecord(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure Ac_ConfirmarExecute(Sender: TObject);
  end;
implementation
{$R *.dfm}

{ TfrmAutoForm }

procedure TfrmAutoForm.Ac_ConfirmarExecute(Sender: TObject);
begin

end;

procedure TfrmAutoForm.cdsAutoFormNewRecord(DataSet: TDataSet);
begin

end;

procedure TfrmAutoForm.FormCreate(Sender: TObject);
begin

end;

procedure TfrmAutoForm.FormShow(Sender: TObject);
begin

end;

end.
