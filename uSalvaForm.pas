unit uSalvaForm;

interface

uses
  System.Classes, Vcl.DBCtrls, Vcl.StdCtrls, SimpleDS, Data.DB, Data.SqlExpr;
type
  GeraForm = class
    private
      geraPas:TStringList;
      geraDFM:TStringList;
      contTDBEdit:Integer;
      contTDataSet:Integer;
      contTDataSorce:Integer;
      FcontadorComponente:Integer;
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
      procedure CarregarLookupComboBox(AControl: TDBLookupComboBox; DataSource: string);
      procedure InsertSQLsqAutoForm(AControl: TSQLDataSet);
      procedure InsertSQLsdsMetaDataForm(AControl: TSQLDataSet);

      procedure propertys(pMemo : TStringList; pCliente :  TObject;retorno:Boolean=true);
      procedure CorriginomeForm;
      property  ContadorComponente:Integer read GetContadorComponente write SetContador;
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
nomeDataSet,nomeDataSorce:string;
sdts:TSimpleDataSet;
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
       geraDFM.Insert(i+soma,'        object DBLookupComboBox'+contTDBEdit.ToString+': TDBLookupComboBox');
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
       geraDFM.Insert(i+soma,'          DataField = '+QuotedStr (AControl.Field.FieldName));
       soma:=soma+1;

       nomeDataSorce:= 'DataSource'+contTDataSorce.ToString;
       contTDataSorce:=contTDataSorce+1;

       geraDFM.Insert(i+soma,'          ListSource = '+nomeDataSorce);
       soma:=soma+1;
       geraDFM.Insert(i+soma,'        end');
       //(AControl.ListSource as TSimpleDataSet).DataSet.CommandText

       sdts:=((AControl.ListSource as TDataSource).DataSet as TSimpleDataSet);

       geraDFM.SaveToFile(ExtractFilePath(Application.ExeName)+'\modelo\padrao1.dfm');
       nomeDataSet:= CriaDataSet(sdts.DataSet.CommandText);
       geraDFM.SaveToFile(ExtractFilePath(Application.ExeName)+'\modelo\padrao1.dfm');
       CriaDataSource(nomeDataSet,nomeDataSorce);





       //geraDFM.Insert(i+soma,'         Parent = '+QuotedStr('pnlControls'));
       //soma:=soma+1;
       //geraDFM.Insert(i+soma,'         BevelKind = '+QuotedStr('bkFlat'));
       //soma:=soma+1;




      // geraDFM.Add('end');
       geraDFM.SaveToFile(ExtractFilePath(Application.ExeName)+'\modelo\padrao1.dfm');

      Break;
      end;

     end;
   end;

   //geraDFM.Delete(geraDFM.Count-1);

   for i:=0 to geraPas.Count-1 do
   begin
     if pos('procedure',geraPas[i]) >0 then
     begin
       geraPas.Insert(i,'    DBLookupComboBox'+contTDBEdit.ToString+': TDBLookupComboBox;');

       Break;
     end;


   end;
    contTDBEdit:=contTDBEdit+1;
    ContadorComponente:=ContadorComponente+1;
   geraPas.SaveToFile(ExtractFilePath(Application.ExeName)+'\modelo\padrao1.pas');

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
       geraDFM.Insert(i+soma,'        object DBEdit'+contTDBEdit.ToString+': TDBEdit');
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
       geraDFM.SaveToFile(ExtractFilePath(Application.ExeName)+'\modelo\padrao1.dfm');

      Break;
      end;

     end;
   end;

   //geraDFM.Delete(geraDFM.Count-1);

   for i:=0 to geraPas.Count-1 do
   begin
     if pos('procedure',geraPas[i]) >0 then
     begin
       geraPas.Insert(i,'    DBEdit'+contTDBEdit.ToString+': TDBEdit;');

       Break;
     end;


   end;
    contTDBEdit:=contTDBEdit+1;
    ContadorComponente:=ContadorComponente+1;

   geraPas.SaveToFile(ExtractFilePath(Application.ExeName)+'\modelo\padrao1.pas');

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
       geraDFM.Insert(i+soma,'        object Label'+contTDBEdit.ToString+': TLabel');
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
       geraDFM.SaveToFile(ExtractFilePath(Application.ExeName)+'\modelo\padrao1.dfm');

      Break;
      end;

     end;
   end;

   //geraDFM.Delete(geraDFM.Count-1);

   for i:=0 to geraPas.Count-1 do
   begin
     if pos('procedure',geraPas[i]) >0 then
     begin
       geraPas.Insert(i,'    Label'+contTDBEdit.ToString+': TLabel;');

       Break;
     end;


   end;
    contTDBEdit:=contTDBEdit+1;
    ContadorComponente:=ContadorComponente+1;
   geraPas.SaveToFile(ExtractFilePath(Application.ExeName)+'\modelo\padrao1.pas');

end;


procedure GeraForm.CorriginomeForm;
var i:Integer;
begin
   for I := 0 to geraPas.Count-1 do
   begin
     if pos('unit',geraPas[i]) >0 then
     begin
      geraPas[i] :=  'unit padrao1;';
      Exit;
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
       nomeComponente:= 'SimpleDataSet'+contTDataSet.ToString;
       geraDFM.Insert(aux+soma,'  object '+nomeComponente+': TSimpleDataSet');
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
       geraDFM.SaveToFile(ExtractFilePath(Application.ExeName)+'\modelo\padrao1.dfm');
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
       geraPas.Insert(i,'    SimpleDataSet'+contTDataSet.ToString+': TSimpleDataSet;');

       Break;
     end;


   end;
    contTDataSet:=contTDataSet+1;
   geraPas.SaveToFile(ExtractFilePath(Application.ExeName)+'\modelo\padrao1.pas');

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
       geraDFM.SaveToFile(ExtractFilePath(Application.ExeName)+'\modelo\padrao1.dfm');
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
   geraPas.SaveToFile(ExtractFilePath(Application.ExeName)+'\modelo\padrao1.pas');

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

procedure GeraForm.InsertSQLsdsMetaDataForm(AControl: TSQLDataSet);
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
       geraDFM.Insert(i+soma,'  DataSet.CommandText = '+QuotedStr( AControl.CommandText) );
       soma:=soma+1;
       geraDFM.SaveToFile(ExtractFilePath(Application.ExeName)+'\modelo\padrao1.dfm');

      Break;
     end;
   end;

end;

procedure GeraForm.InsertSQLsqAutoForm(AControl: TSQLDataSet);
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
     if pos('sqAutoForm',geraDFM[i]) >0 then
     begin
      s:=true;
      soma:=soma+1;
     end;

     if s then
     begin
       geraDFM.Insert(i+soma,'  CommandText = '+QuotedStr( AControl.CommandText) );
       soma:=soma+1;
       geraDFM.SaveToFile(ExtractFilePath(Application.ExeName)+'\modelo\padrao1.dfm');

      Break;
     end;
   end;

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

procedure GeraForm.SetContador(aValues: integer);
begin
  FcontadorComponente:=aValues;
end;

end.
