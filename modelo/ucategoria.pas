unit ucategoria;

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
  Tfrmcategoria  = class(TfrmBaseAutoForm)
    dspAutoForm: TDataSetProvider;
    cdsAutoForm: TClientDataSet;
    qryAutoForm: TFDQuery;
    lblInformeseunomeaqui: TLabel;
    edtnome: TDBEdit;
    procedure FormShow(Sender: TObject);
    procedure cdsAutoFormNewRecord(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure Ac_ConfirmarExecute(Sender: TObject);
   	function GetDisplayName:string;override;
  	function GetKeyField: string;override;
  end;

var  frmcategoria:Tfrmcategoria;

implementation
{$R *.dfm}

{ TfrmAutoForm }


function Tfrmcategoria.GetDisplayName: string;
begin
inherited;
Result:='categoria';
end;

procedure Tfrmcategoria.Ac_ConfirmarExecute(Sender: TObject);
begin
 //
 inherited;
end;

procedure Tfrmcategoria.cdsAutoFormNewRecord(DataSet: TDataSet);
begin
 //
 inherited;
end;

procedure Tfrmcategoria.FormCreate(Sender: TObject);
begin
 //
 inherited;
end;

procedure Tfrmcategoria.FormShow(Sender: TObject);
begin
inherited;
qryAutoForm.Active:=True;
end;

function Tfrmcategoria.GetKeyField: string;
begin
Result := 'codigo';
//
inherited;
end;


end.
