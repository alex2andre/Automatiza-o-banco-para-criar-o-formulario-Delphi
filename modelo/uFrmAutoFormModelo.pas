unit <NomeUnit> ;

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
  <NomeForm>  = class(TfrmBaseAutoForm)
    dspAutoForm: TDataSetProvider;
    cdsAutoForm: TClientDataSet;
    qryAutoForm: TFDQuery;
    procedure FormShow(Sender: TObject);
    procedure cdsAutoFormNewRecord(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure Ac_ConfirmarExecute(Sender: TObject);
   	function GetDisplayName:string;override;
  	function GetKeyField: string;override;
  end;

var  <VarNomeForm>:<NomeForm>;

implementation
{$R *.dfm}

{ TfrmAutoForm }


function <NomeForm>.GetDisplayName: string;
begin
inherited;
Result:=<TableDisplayName>;
end;

procedure <NomeForm>.Ac_ConfirmarExecute(Sender: TObject);
begin
 //
 inherited;
end;

procedure <NomeForm>.cdsAutoFormNewRecord(DataSet: TDataSet);
begin
 //
 inherited;
end;

procedure <NomeForm>.FormCreate(Sender: TObject);
begin
 //
 inherited;
end;

procedure <NomeForm>.FormShow(Sender: TObject);
begin
inherited;
qryAutoForm.Active:=True;
end;

function <NomeForm>.GetKeyField: string;
begin
Result := <KeyField>;
//
inherited;
end;


end.
