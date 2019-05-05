unit uDM;

interface

uses
  SysUtils, Classes, DB, SqlExpr, WideStrings, Data.DBXMySQL;

type
  TDM = class(TDataModule)
    DBConn: TSQLConnection;
  private
    { Private declarations }
  public
    { Public declarations }
    function  VerificaTabela(value:string):Boolean;
    procedure CriaTabela(sql:string);
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDM }

procedure TDM.CriaTabela(sql:string);
begin
 DBConn.ExecuteDirect(sql);
end;

function TDM.VerificaTabela(value: string): Boolean;
var
  vListaTabela : TStrings;
  i:Integer;
begin
  Result:=False;
  vListaTabela := TStringList.Create;

  DBConn.GetTableNames(vListaTabela);
  i:=vListaTabela.IndexOf(value) ;
  if i> -1 then
  begin
    Result:=True;
  end;

  vListaTabela.Free;

end;

end.
