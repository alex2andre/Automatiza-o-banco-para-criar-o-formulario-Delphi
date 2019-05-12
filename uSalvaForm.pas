unit uSalvaForm;

interface

uses
  System.Classes, Vcl.DBCtrls, Vcl.StdCtrls, Data.DB,FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;
type
  GeraForm = class
    private
      geraPas:TStringList;
      geraDFM:TStringList;
      contTDBEdit:Integer;
      contTDataSet:Integer;
      contTDataSorce:Integer;
      FcontadorComponente:Integer;
      FNomeUnit:string;
      FNomeFomulario:string;
      FKeyField: string;
      FTableDisplayName: string;
      procedure CarregaLista;
      function CriaDataSet(CommandText:string):string;
      procedure CriaDataSource(DataSet,nomeDataSorce:string);
      function GetContadorComponente:Integer;
      procedure SetContador(aValues:integer);

    public
      constructor Create;
      destructor Destroy;override;
      procedure CarregarTDBEdit(AControl: TDBEdit;DataSource:string);
      procedure CarregarTLabel(AControl: TLabel);
      procedure CarregarTDBCheckBox(AControl: TDBCheckBox; DataSource: string);
      procedure CarregarLookupComboBox(AControl: TDBLookupComboBox; DataSource: string);
      procedure InsertSQLsqAutoForm(AControl: TFDQuery);
      procedure InsertSQLsdsMetaDataForm(AControl: TFDQuery);

      procedure propertys(pMemo : TStringList; pCliente :  TObject;retorno:Boolean=true);
      procedure CorriginomeForm;
      function Substitui(antigo,novo,tag:string;quote:Boolean=false):string;
      Function RemoveAcentos(Str:String): String;
      function NomeTAbela(sql:string):string;
      property ContadorComponente:Integer read GetContadorComponente write SetContador;
      property KeyField:string read FKeyField write FKeyField;
      property TableDisplayName:string read FTableDisplayName write FTableDisplayName;
      property NomeUnit:string read FNomeUnit write FNomeUnit;
      property NomeFomulario:string read FNomeFomulario write FNomeFomulario;
  end;
implementation

uses
  System.SysUtils, Vcl.Forms,rtti;

{ GeraForm }



procedure GeraForm.CarregaLista;
var caminho:string;
begin

  caminho := ExtractFilePath(Application.ExeName);
  geraPas.LoadFromFile(caminho+'\modelo\uFrmAutoFormModelo.pas');
  geraDFM.LoadFromFile(caminho+'\modelo\uFrmAutoFormModelo.dfm');

end;

procedure GeraForm.CarregarLookupComboBox(AControl: TDBLookupComboBox; DataSource: string);
var i,soma:Integer;
s,fim:boolean;
vNomeTAbela,nomeDataSet,nomeDataSorce:string;
sdts:TFDQuery;
begin
   s:=false;
   fim:=false;
   soma:=1;
   if ContadorComponente =1 then
   soma:=0;


   for I := 0 to geraDFM.Count-1 do
   begin
     if pos('inherited pnlControls: TPanel',geraDFM[i]) >0 then
     begin
      s:=true;
      fim:=true;
     end;

     if s then
     begin
      if pos('object',geraDFM[i]) >0 then
        fim:=false;
      if pos('end',geraDFM[i]) >0 then
        fim:=true;

      if fim then
      if pos('end',geraDFM[i]) >0 then
      begin

       geraDFM.Insert(i+soma,'        object lkcb'+RemoveAcentos( AControl.DataField)+': TDBLookupComboBox');
       soma:=soma+1;
       geraDFM.Insert(i+soma,'          Width = '+AControl.Width.ToString);
       soma:=soma+1;
       geraDFM.Insert(i+soma,'          Height = '+AControl.Height.ToString);
       soma:=soma+1;
       geraDFM.Insert(i+soma,'          Top = '+AControl.Top.ToString);
       soma:=soma+1;
       geraDFM.Insert(i+soma,'          Left = '+AControl.Left.ToString);
       soma:=soma+1;
       geraDFM.Insert(i+soma,'          DataSource = '+DataSource);
       soma:=soma+1;
       geraDFM.Insert(i+soma,'          DataField = '+QuotedStr (AControl.DataField));
       soma:=soma+1;
       geraDFM.Insert(i+soma,'          KeyField = '+QuotedStr (AControl.KeyField));
       soma:=soma+1;
       geraDFM.Insert(i+soma,'          ListField = '+QuotedStr (AControl.ListField));
       soma:=soma+1;

       sdts:=((AControl.ListSource as TDataSource).DataSet as TFDQuery);
       nomeDataSorce:= 'ds'+NomeTAbela(sdts.SQL.Text);;
       contTDataSorce:=contTDataSorce+1;

       geraDFM.Insert(i+soma,'          ListSource = '+nomeDataSorce);
       soma:=soma+1;
       geraDFM.Insert(i+soma,'        end');
       nomeDataSet:= CriaDataSet(sdts.SQL.Text);
      // geraDFM.SaveToFile(ExtractFilePath(Application.ExeName)+'\modelo\padrao1.dfm');
       CriaDataSource(nomeDataSet,nomeDataSorce);





       //geraDFM.Insert(i+soma,'         Parent = '+QuotedStr('pnlControls'));
       //soma:=soma+1;
       //geraDFM.Insert(i+soma,'         BevelKind = '+QuotedStr('bkFlat'));
       //soma:=soma+1;




      // geraDFM.Add('end');
       geraDFM.SaveToFile(ExtractFilePath(Application.ExeName)+'\modelo\'+FNomeUnit+'.dfm');

      Break;
      end;

     end;
   end;

   //geraDFM.Delete(geraDFM.Count-1);

   for i:=0 to geraPas.Count-1 do
   begin
     if pos('procedure',geraPas[i]) >0 then
     begin
       geraPas.Insert(i,'    lkcb'+RemoveAcentos( AControl.DataField)+': TDBLookupComboBox;');

       Break;
     end;


   end;
    contTDBEdit:=contTDBEdit+1;
    ContadorComponente:=ContadorComponente+1;
   geraPas.SaveToFile(ExtractFilePath(Application.ExeName)+'\modelo\padrao1.pas');

end;

procedure GeraForm.CarregarTDBCheckBox(AControl: TDBCheckBox; DataSource: string);
var i,soma:Integer;
s,fim:boolean;
begin
   s:=false;
   fim:=false;
   soma:=1;
   if ContadorComponente =1 then
   soma:=0;

   for I := 0 to geraDFM.Count-1 do
   begin
     if pos('inherited pnlControls: TPanel',geraDFM[i]) >0 then
     begin
      s:=true;
      fim:=true;
     end;

     if s then
     begin
      if pos('object',geraDFM[i]) >0 then
        fim:=false;
      if pos('end',geraDFM[i]) >0 then
        fim:=true;

      if fim then
      if pos('end',geraDFM[i]) >0 then
      begin
       geraDFM.Insert(i+soma,'        object ckb'+RemoveAcentos( StringReplace( AControl.DataField, ' ', '', [rfReplaceAll]))+': TDBCheckBox');
       soma:=soma+1;
       geraDFM.Insert(i+soma,'          Width = '+AControl.Width.ToString);
       soma:=soma+1;
       geraDFM.Insert(i+soma,'          Height = '+AControl.Height.ToString);
       soma:=soma+1;
       geraDFM.Insert(i+soma,'          Top = '+AControl.Top.ToString);
       soma:=soma+1;
       geraDFM.Insert(i+soma,'          Left = '+AControl.Left.ToString);
       soma:=soma+1;
       geraDFM.Insert(i+soma,'          Caption = '+QuotedStr( AControl.Caption));
       soma:=soma+1;
       geraDFM.Insert(i+soma,'    DataSource = '+DataSource);
       soma:=soma+1;
       geraDFM.Insert(i+soma,'          DataField = '+QuotedStr (AControl.DataField));
       soma:=soma+1;

       geraDFM.Insert(i+soma,'        end');
      // geraDFM.Add('end');
       geraDFM.SaveToFile(ExtractFilePath(Application.ExeName)+'\modelo\'+FNomeUnit+'.dfm');

      Break;
      end;

     end;
   end;

   //geraDFM.Delete(geraDFM.Count-1);

   for i:=0 to geraPas.Count-1 do
   begin
     if pos('procedure',geraPas[i]) >0 then
     begin
       geraPas.Insert(i,'    ckb'+RemoveAcentos(StringReplace( AControl.DataField, ' ', '', [rfReplaceAll]))+': TDBCheckBox;');

       Break;
     end;


   end;
    contTDBEdit:=contTDBEdit+1;
    ContadorComponente:=ContadorComponente+1;
   geraPas.SaveToFile(ExtractFilePath(Application.ExeName)+'\modelo\'+FNomeUnit+'.pas');

end;

procedure GeraForm.CarregarTDBEdit(AControl: TDBEdit; DataSource: string);
var i,soma:Integer;
s,fim:boolean;
begin
   s:=false;
   fim:=false;
   soma:=1;
   if ContadorComponente =1 then
   soma:=0;

   for I := 0 to geraDFM.Count-1 do
   begin
     if pos('inherited pnlControls: TPanel',geraDFM[i]) >0 then
     begin
      s:=true;
      fim:=true;
     end;

     if s then
     begin
      if pos('object',geraDFM[i]) >0 then
        fim:=false;
      if pos('end',geraDFM[i]) >0 then
        fim:=true;

      if fim then
      if pos('end',geraDFM[i]) >0 then
      begin
       geraDFM.Insert(i+soma,'        object edt'+RemoveAcentos(AControl.DataField)+': TDBEdit');
       soma:=soma+1;
       geraDFM.Insert(i+soma,'          Width = '+AControl.Width.ToString);
       soma:=soma+1;
       geraDFM.Insert(i+soma,'          Height = '+AControl.Height.ToString);
       soma:=soma+1;
       geraDFM.Insert(i+soma,'          Top = '+AControl.Top.ToString);
       soma:=soma+1;
       geraDFM.Insert(i+soma,'          Left = '+AControl.Left.ToString);
       soma:=soma+1;
       geraDFM.Insert(i+soma,'          DataSource = '+DataSource);
       soma:=soma+1;
       geraDFM.Insert(i+soma,'          DataField = '+QuotedStr( AControl.DataField));
       soma:=soma+1;

       geraDFM.Insert(i+soma,'        end');
      // geraDFM.Add('end');
       geraDFM.SaveToFile(ExtractFilePath(Application.ExeName)+'\modelo\'+FNomeUnit+'.dfm');

      Break;
      end;

     end;
   end;

   //geraDFM.Delete(geraDFM.Count-1);

   for i:=0 to geraPas.Count-1 do
   begin
     if pos('procedure',geraPas[i]) >0 then
     begin
       geraPas.Insert(i,'    edt'+RemoveAcentos(AControl.DataField)+': TDBEdit;');

       Break;
     end;


   end;
    contTDBEdit:=contTDBEdit+1;
    ContadorComponente:=ContadorComponente+1;

   geraPas.SaveToFile(ExtractFilePath(Application.ExeName)+'\modelo\'+FNomeUnit+'.pas');

end;

procedure GeraForm.CarregarTLabel(AControl: TLabel);
var i,soma:Integer;
s,fim:boolean;
begin
   s:=false;
   fim:=false;
   soma:=1;
   if ContadorComponente =1 then
   soma:=0;

   for I := 0 to geraDFM.Count-1 do
   begin
     if pos('inherited pnlControls: TPanel',geraDFM[i]) >0 then
     begin
      s:=true;
      fim:=true;
     end;

     if s then
     begin
      if pos('object',geraDFM[i]) >0 then
        fim:=false;
      if pos('end',geraDFM[i]) >0 then
        fim:=true;

      if fim then
      if pos('end',geraDFM[i]) >0 then
      begin
       geraDFM.Insert(i+soma,'        object lbl'+RemoveAcentos( StringReplace( AControl.Caption, ' ', '', [rfReplaceAll]))+': TLabel');
       soma:=soma+1;
       geraDFM.Insert(i+soma,'          Width = '+AControl.Width.ToString);
       soma:=soma+1;
       geraDFM.Insert(i+soma,'          Height = '+AControl.Height.ToString);
       soma:=soma+1;
       geraDFM.Insert(i+soma,'          Top = '+AControl.Top.ToString);
       soma:=soma+1;
       geraDFM.Insert(i+soma,'          Left = '+AControl.Left.ToString);
       soma:=soma+1;
       geraDFM.Insert(i+soma,'          Caption = '+QuotedStr( AControl.Caption));
       soma:=soma+1;
       //geraDFM.Insert(i+soma,'    DataSource = '+DataSource);
       //soma:=soma+1;
       geraDFM.Insert(i+soma,'        end');
      // geraDFM.Add('end');
       geraDFM.SaveToFile(ExtractFilePath(Application.ExeName)+'\modelo\'+FNomeUnit+'.dfm');

      Break;
      end;

     end;
   end;

   //geraDFM.Delete(geraDFM.Count-1);

   for i:=0 to geraPas.Count-1 do
   begin
     if pos('procedure',geraPas[i]) >0 then
     begin
       geraPas.Insert(i,'    lbl'+RemoveAcentos(StringReplace( AControl.Caption, ' ', '', [rfReplaceAll]))+': TLabel;');

       Break;
     end;


   end;
    contTDBEdit:=contTDBEdit+1;
    ContadorComponente:=ContadorComponente+1;
   geraPas.SaveToFile(ExtractFilePath(Application.ExeName)+'\modelo\'+FNomeUnit+'.pas');

end;


procedure GeraForm.CorriginomeForm;
var i:Integer;

begin

   for I := 0 to geraPas.Count-1 do
   begin
     if pos('<NomeUnit>',geraPas[i]) >0 then
     begin
      geraPas[i] :=  'unit '+FNomeUnit+';';
     end;

     if pos('<NomeForm>',geraPas[i])>0 then
     begin

        geraPas[i]:=Substitui(geraPas[i],'Tfrm'+FNomeFomulario,'<NomeForm>');

     end;


     if pos('<VarNomeForm>',geraPas[i])>0 then
     begin

        geraPas[i]:=Substitui(geraPas[i],'frm'+FNomeFomulario,'<VarNomeForm>');
     end;


     if pos('<KeyField>',geraPas[i])>0 then
     begin

        geraPas[i]:=Substitui(geraPas[i],KeyField,'<KeyField>',true);
     end;


     if pos('<TableDisplayName>',geraPas[i])>0 then
     begin

        geraPas[i]:=Substitui(geraPas[i],TableDisplayName,'<TableDisplayName>',true);
     end;





   end;

   for I := 0 to geraDFM.Count-1 do
   begin
     if pos('<VarNomeForm>',geraDFM[i])>0 then
     begin

        geraDFM[i]:=Substitui(geraDFM[i],'frm'+FNomeFomulario,'<VarNomeForm>');
     end;

     if pos('<NomeForm>',geraDFM[i])>0 then
     begin

        geraDFM[i]:=Substitui(geraDFM[i],'Tfrm'+FNomeFomulario,'<NomeForm>');

     end;


   end;

end;

function GeraForm.GetContadorComponente: Integer;
begin
Result:=FcontadorComponente;

end;

function GeraForm.CriaDataSet(CommandText : string):string;
var aux,i,soma:Integer;
s,fim:boolean;
nomeComponente:string;

begin
   s:=false;
   fim:=false;
   soma:=1;
   if contTDataSet =1 then
   soma:=0;

   for I := 0 to geraDFM.Count-1 do
   begin
     if pos('inherited Pc: TPageControl',geraDFM[i]) >0 then
     begin
      s:=true;
      fim:=true;
      aux:=i-1;
     end;

     if s then
     begin
      if pos('object',geraDFM[i]) >0 then
        fim:=false;
      if pos('end',geraDFM[i]) >0 then
        fim:=true;

      if fim then
      if pos('end',geraDFM[i]) >0 then
      begin
       nomeComponente:= 'sds'+NomeTAbela(CommandText);
       geraDFM.Insert(aux+soma,'  object '+nomeComponente+': TFDQuery');
       soma:=soma+1;
       geraDFM.Insert(aux+soma,'    Top = 10');
       soma:=soma+1;
       geraDFM.Insert(aux+soma,'    Left = 10');
       soma:=soma+1;
       geraDFM.Insert(aux+soma,'    Aggregates = <>');
       soma:=soma+1;

       geraDFM.Insert(aux+soma,'    Params = <>');
       soma:=soma+1;
       geraDFM.Insert(aux+soma,'    Connection =  DM.DBConn');
       soma:=soma+1;
       geraDFM.Insert(aux+soma,'    DataSet.CommandText = ' +QuotedStr(CommandText));
       soma:=soma+1;




       geraDFM.Insert(aux+soma,'  end');
      // geraDFM.Add('end');
       geraDFM.SaveToFile(ExtractFilePath(Application.ExeName)+'\modelo\'+FNomeUnit+'.dfm');
       Result:=nomeComponente;
      Break;
      end;

     end;
   end;

   //geraDFM.Delete(geraDFM.Count-1);

   for i:=0 to geraPas.Count-1 do
   begin
     if pos('procedure',geraPas[i]) >0 then
     begin
       geraPas.Insert(i,'    '+nomeComponente+': TFDQuery;');

       Break;
     end;


   end;
    contTDataSet:=contTDataSet+1;
   geraPas.SaveToFile(ExtractFilePath(Application.ExeName)+'\modelo\'+FNomeUnit+'.pas');

end;

procedure GeraForm.CriaDataSource(DataSet,nomeDataSorce:string);
var aux,i,soma:Integer;
s,fim:boolean;

begin
   s:=false;
   fim:=false;
   soma:=1;
   if contTDataSorce =1 then
   soma:=0;

   for I := 0 to geraDFM.Count-1 do
   begin
     if pos('inherited Pc: TPageControl',geraDFM[i]) >0 then
     begin
      s:=true;
      fim:=true;
      aux:=i-1;
     end;

     if s then
     begin
      if pos('object',geraDFM[i]) >0 then
        fim:=false;
      if pos('end',geraDFM[i]) >0 then
        fim:=true;

      if fim then
      if pos('end',geraDFM[i]) >0 then
      begin
       //nomeComponente:= 'DataSource'+contTDataSorce.ToString;

       geraDFM.Insert(aux+soma,'  object '+nomeDataSorce+': TDataSource');
       soma:=soma+1;
       geraDFM.Insert(aux+soma,'    Top = 10');
       soma:=soma+1;
       geraDFM.Insert(aux+soma,'    Left = 10');
       soma:=soma+1;

       geraDFM.Insert(aux+soma,'    DataSet = '+DataSet);
       soma:=soma+1;



       //geraDFM.Insert(i+soma,'    Aggregates = <>');
       //soma:=soma+1;
       //geraDFM.Insert(i+soma,'    Params = <>');
       //soma:=soma+1;

       //geraDFM.Insert(i+soma,'    Params = <>');
       //soma:=soma+1;
       //geraDFM.Insert(i+soma,'    Connection = ' +QuotedStr(' DM.DBConn'));
       //soma:=soma+1;
       //geraDFM.Insert(i+soma,'    DataSet.CommandText = ' +QuotedStr(AControl.DataSet.CommandText));
       //soma:=soma+1;




       geraDFM.Insert(aux+soma,'  end');
      // geraDFM.Add('end');
       geraDFM.SaveToFile(ExtractFilePath(Application.ExeName)+'\modelo\'+FNomeUnit+'.dfm');
       //Result:=nomeComponente;
      Break;
      end;

     end;
   end;

   //geraDFM.Delete(geraDFM.Count-1);

   for i:=0 to geraPas.Count-1 do
   begin
     if pos('procedure',geraPas[i]) >0 then
     begin
       geraPas.Insert(i,'    '+nomeDataSorce+': TDataSource;');

       Break;
     end;


   end;
   // contTDataSet:=contTDataSet+1;
   geraPas.SaveToFile(ExtractFilePath(Application.ExeName)+'\modelo\'+FNomeUnit+'.pas');

end;

constructor GeraForm.Create;
begin
geraPas:=TStringList.Create;
geraDFM:=TStringList.Create;
CarregaLista;
contTDBEdit:=1;
contTDataSet:=1;
contTDataSorce:=1;
end;

destructor GeraForm.Destroy;
begin
  geraPas.Free;
  geraDFM.Free;
  inherited;
end;

procedure GeraForm.InsertSQLsdsMetaDataForm(AControl: TFDQuery);
var i,soma:Integer;
s,fim:boolean;
begin
   s:=false;
   fim:=false;
   soma:=1;
   if contTDataSet =1 then
   soma:=0;

   for I := 0 to geraDFM.Count-1 do
   begin
     if pos('sdsMeta',geraDFM[i]) >0 then
     begin
      s:=true;
      soma:=soma+1;
     end;

     if s then
     begin
       geraDFM.Insert(i+soma,'  DataSet.CommandText = '+QuotedStr( AControl.SQL.Text) );
       soma:=soma+1;
       geraDFM.SaveToFile(ExtractFilePath(Application.ExeName)+'\modelo\'+FNomeUnit+'.dfm');

      Break;
     end;
   end;

end;

procedure GeraForm.InsertSQLsqAutoForm(AControl: TFDQuery);
var i,soma:Integer;
s,fim:boolean;
begin
   s:=false;
   fim:=false;
   soma:=1;
   if contTDataSet =1 then
   soma:=0;

   for I := 0 to geraDFM.Count-1 do
   begin
     if pos('qryAutoForm',geraDFM[i]) >0 then
     begin
      s:=true;
      soma:=soma+1;
     end;

     if s then
     begin
       geraDFM.Insert(i+soma,'  SQL.Strings = ('+QuotedStr( AControl.SQL.Text) +')');
       soma:=soma+1;
       geraDFM.SaveToFile(ExtractFilePath(Application.ExeName)+'\modelo\'+FNomeUnit+'.dfm');

      Break;
     end;
   end;

end;

function GeraForm.NomeTAbela(sql: string): string;
var p,l,f:Integer;
begin
p:=Pos('FROM',UpperCase( sql));
        l:=Length(sql);
        f:= Length('FROM');
        Result:=Copy( sql,p+f+1,l-p-f);
end;

procedure GeraForm.propertys(pMemo: TStringList; pCliente: TObject;retorno:Boolean=true);
var
  ctxRtti  : TRttiContext;
  typeRtti : TRttiType;
  propRtti : TRttiProperty;

begin
  try
  ctxRtti  := TRttiContext.Create;
  typeRtti := ctxRtti.GetType( pCliente.ClassType );
  pMemo.Add(' ');
  for propRtti in typeRtti.GetProperties do
  begin
     if propRtti.PropertyType.ToString  = 'IInterface' then
    //if (propRtti.Name = 'AsCurrency') or (propRtti.Name =  'AsBCD') or (propRtti.Name = 'ComObject') then
      pMemo.Add(propRtti.Name+':'+ propRtti.PropertyType.ToString +'=')
    else
      pMemo.Add(propRtti.Name+':'+ propRtti.PropertyType.ToString +'='+ propRtti.GetValue(pCliente).ToString);
  //  if (propRtti.PropertyType.ToString ='TField') and (retorno) then
    begin
  //   pMemo.Add(' ');
  //  propertys(pMemo,propRtti.GetValue(pCliente).AsObject,false);
  //  pMemo.Add(' ');
    end;

  end;

  finally
    ctxRtti.Free;
  end;


end;

function GeraForm.RemoveAcentos(Str: String): String;
Const ComAcento = '‡‚ÍÙ˚„ı·ÈÌÛ˙Á¸¿¬ ‘€√’¡…Õ”⁄«‹';
  SemAcento = 'aaeouaoaeioucuAAEOUAOAEIOUCU';
Var
x : Integer;
Begin
For x := 1 to Length(Str) do
  Begin
  if Pos(Str[x],ComAcento)<>0 Then
  begin
  Str[x] := SemAcento[Pos(Str[x],ComAcento)];
  end;
  end;
Result := Str;
end;
procedure GeraForm.SetContador(aValues: integer);
begin
  FcontadorComponente:=aValues;
end;

function GeraForm.Substitui(antigo, novo,tag: string;quote:Boolean): string;
var espaco,tamanho:Integer;
 pedacoInical,valor:string;

begin
   tamanho:=length(tag);
   espaco:=pos(tag,antigo);
   valor:=Copy(antigo,tamanho+espaco,length(antigo)-tamanho);
   pedacoInical:=Copy(antigo,1,espaco-1);
   Result:=pedacoInical + novo +valor;
   if quote then
     Result:=pedacoInical +QuotedStr( novo) +valor;

end;

end.

