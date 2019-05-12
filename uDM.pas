unit uDM;

interface

uses
  SysUtils, Classes, DB, SqlExpr, WideStrings, Data.DBXMySQL, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait,
  FireDAC.Comp.Client;

type
  TDM = class(TDataModule)
    FDConn: TFDConnection;
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
// DBConn.ExecuteDirect(sql);
 FDConn.ExecSQL(sql)
end;

function TDM.VerificaTabela(value: string): Boolean;
var
  vListaTabela : TStrings;
  i:Integer;
begin
  Result:=False;
  vListaTabela := TStringList.Create;
  try
  FDConn.GetTableNames('','','',vListaTabela);
  //FDConnection1.GetTableNames('','','',Memo1.Lines,[osMy],[tkTable],true);
  //DBConn.GetTableNames(vListaTabela);
//  i:=vListaTabela.IndexOfName(LowerCase( value)  ) ;

  for I := 0 to vListaTabela.Count-1 do
  begin
    if pos(UpperCase( value),UpperCase( vListaTabela[i]))>0  then
    begin
      Result:=True;
      Exit;
    end;

  end;


  {if i> -1 then
  begin
    Result:=True;
  end;}

  finally
   vListaTabela.Free;
  end;


end;

end.
