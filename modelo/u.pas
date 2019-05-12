unit u;

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
  Tfrm  = class(TfrmBaseAutoForm)
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
    sdsCATEGORIA: TSimpleDataSet;
    dsCATEGORIA: TDataSource;
    lkcbCODIGO_CATEGORIA: TDBLookupComboBox;
    sdsPESSOA: TSimpleDataSet;
    dsPESSOA: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure cdsAutoFormNewRecord(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure Ac_ConfirmarExecute(Sender: TObject);
   	function GetDisplayName:string;override;
  	function GetKeyField: string;override;
  end;

var  frm:Tfrm;

implementation
{$R *.dfm}

{ TfrmAutoForm }


function Tfrm.GetDisplayName: string;
begin
inherited;
Result:='Cadastro de Lançamento';
end;

procedure Tfrm.Ac_ConfirmarExecute(Sender: TObject);
begin
 //
 inherited;
end;

procedure Tfrm.cdsAutoFormNewRecord(DataSet: TDataSet);
begin
 //
 inherited;
end;

procedure Tfrm.FormCreate(Sender: TObject);
begin
 //
 inherited;
end;

procedure Tfrm.FormShow(Sender: TObject);
begin
inherited;
qryAutoForm.Active:=True;
end;

function Tfrm.GetKeyField: string;
begin
Result := 'codigo';
//
inherited;
end;


end.
