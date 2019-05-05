unit <NomeUnit>;

interface

uses
  SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmBaseAutoForm, FMTBcd, DB, DBClient, Provider, SqlExpr,
  StdCtrls, Buttons, DBCtrls, Grids, DBGrids, ExtCtrls, SimpleDS, ComCtrls,
  ToolWin, ImgList, ActnList, WideStrings,
  uDM, System.ImageList, System.Actions, Vcl.Mask;

type
  <NomeForm> = class(TfrmBaseAutoForm)
    sdsMetaData: TSimpleDataSet;
    sqAutoForm: TSQLDataSet;
    dspAutoForm: TDataSetProvider;
    cdsAutoForm: TClientDataSet;
    procedure FormShow(Sender: TObject);
    procedure cdsAutoFormNewRecord(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure Ac_ConfirmarExecute(Sender: TObject);
	function GetDisplayName:string;override;
  end;

var <VarNomeForm>:<NomeForm>;

implementation
{$R *.dfm}

{ TfrmAutoForm }


function <NomeForm>.GetDisplayName: string;
begin
inherited;
Result:='';
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
var i:Integer;
begin
 inherited;
  for I := 0 to Self.ComponentCount-1 do
  begin
     if Self.Components[i] is TSimpleDataSet then
     begin
       (Self.Components[i] as TSimpleDataSet).Open;
     end;
  end;

end;

end.
