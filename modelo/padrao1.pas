unit uLANCAMENTO;

interface

uses
  SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmBaseAutoForm, FMTBcd, DB, DBClient, Provider, SqlExpr,
  StdCtrls, Buttons, DBCtrls, Grids, DBGrids, ExtCtrls, SimpleDS, ComCtrls,
  ToolWin, ImgList, ActnList, WideStrings,
  uDM, System.ImageList, System.Actions, Vcl.Mask, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmLANCAMENTO  = class(TfrmBaseAutoForm)
    dspAutoForm: TDataSetProvider;
    cdsAutoForm: TClientDataSet;
    qryAutoForm: TFDQuery;
    lblDescricao: TLabel;
    lblTIPO: TLabel;
    lblDATA_VENCIMENTO: TLabel;
    lblDATA_PAGAMENTO: TLabel;
    lblVALOR: TLabel;
    lblOBSERVACAO: TLabel;
    lblCATEGORIA: TLabel;
    lblPESSOA: TLabel;
    edtDESCRICAO: TDBEdit;
    edtTIPO: TDBEdit;
    edtDATA_VENCIMENTO: TDBEdit;
    edtDATA_PAGAMENTO: TDBEdit;
    edtVALOR: TDBEdit;
    edtOBSERVACAO: TDBEdit;
    sdsCATEGORIA: TFDQuery;
    dsCATEGORIA: TDataSource;
    lkcbCODIGO_CATEGORIA: TDBLookupComboBox;
    sdsPESSOA: TFDQuery;
    dsPESSOA: TDataSource;
    lkcbCODIGO_PESSOA: TDBLookupComboBox;
    procedure FormShow(Sender: TObject);
    procedure cdsAutoFormNewRecord(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure Ac_ConfirmarExecute(Sender: TObject);
   	function GetDisplayName:string;override;
  	function GetKeyField: string;override;
  end;

var  frmLANCAMENTO:TfrmLANCAMENTO;

implementation
{$R *.dfm}

{ TfrmAutoForm }


function TfrmLANCAMENTO.GetDisplayName: string;
begin
inherited;
Result:='Cadastro de Lanšamento';
end;

procedure TfrmLANCAMENTO.Ac_ConfirmarExecute(Sender: TObject);
begin
 //
 inherited;
end;

procedure TfrmLANCAMENTO.cdsAutoFormNewRecord(DataSet: TDataSet);
begin
 //
 inherited;
end;

procedure TfrmLANCAMENTO.FormCreate(Sender: TObject);
begin
 //
 inherited;
end;

procedure TfrmLANCAMENTO.FormShow(Sender: TObject);
begin
inherited;
qryAutoForm.Active:=True;
end;

function TfrmLANCAMENTO.GetKeyField: string;
begin
Result := 'codigo';
//
inherited;
end;


end.
