unit udump;

interface

function  DumpTypeDefinition(ATypeInfo: Pointer;OnlyDeclarated:Boolean=False) : string;

implementation

//Author  Rodrigo Ruz V. 2010-10-10
uses
  Rtti,
  TypInfo,
  Classes,
  Generics.Collections,
  SysUtils;

function  DumpTypeDefinition(ATypeInfo: Pointer;OnlyDeclarated:Boolean=False) : string;

  //add and format a field
  procedure AddField(List:TStrings;lField : TRttiField);
  begin
     if Assigned(lField.FieldType) then
      List.Add((Format('   %-20s:%s;',[lField.Name,lField.FieldType.Name])))
     else
      List.Add((Format('   %-20s:%s;',[lField.Name,'Unknow'])));
  end;

  //add and format a method
  procedure AddMethod(List:TStrings;lMethod : TRttiMethod);
  begin
     List.Add((Format('   %s;',[lMethod.ToString])));
  end;

  //add and format a Property
  procedure AddProperty(List:TStrings;lProperty : TRttiProperty);
  begin
     List.Add((Format('   %s;',[lProperty.ToString])));
  end;

const
 sType          = 'type';
 sIndent        = '  ';
 ArrVisibility  : Array[TMemberVisibility] of string = ('private','protected','public','published');//Helper array for Visibility
var
  ctx       : TRttiContext;
  lType     : TRttiType;
  lMethod   : TRttiMethod;
  lProperty : TRttiProperty;
  lField    : TRttiField;
  Definition: TObjectDictionary<string, TStrings>;
  i         : TMemberVisibility;
begin
   Result:='No Rtti Information';
   ctx       := TRttiContext.Create;
   Definition:= TObjectDictionary<string, TStrings>.Create([doOwnsValues]);
   try

     if not Assigned(ATypeInfo) then exit;
     lType:=ctx.GetType(ATypeInfo);
     if not Assigned(lType) then exit;

     Definition.Add(sType,TStringList.Create);
     Definition.Items[sType].Add('type');

     //Initialize the buffers to hold the data
     for i:=Low(TMemberVisibility) to High(TMemberVisibility) do
     begin
      Definition.Add(ArrVisibility[i]  ,TStringList.Create);
      Definition.Items[ArrVisibility[i]].Add(sIndent+ArrVisibility[i]);
     end;

     case lType.TypeKind of
       tkUnknown    : ;
       tkInteger    : ;
       tkChar       : ;
       tkEnumeration: ;
       tkFloat      : ;
       tkString     : ;
       tkSet        : ;
       tkClass      :
                     begin
                       //get the main definition
                       if Assigned(lType.BaseType) then
                        Definition.Items[sType].Add(Format('%s%s=class(%s)',[sIndent,lType.Name,lType.BaseType.Name]))
                       else
                        Definition.Items[sType].Add(Format('%s%s=class',[sIndent,lType.Name]));
                     end;
       tkMethod     : ;
       tkWChar      : ;
       tkLString    : ;
       tkWString    : ;
       tkVariant    : ;
       tkArray      : ;
       tkRecord     : begin
                       //get the main definition
                        Definition.Items[sType].Add(Format('%s%s=record',[sIndent,lType.Name]));
                      end;

       tkInterface  :
                     begin
                       //get the main definition
                       if Assigned(lType.BaseType) then
                        Definition.Items[sType].Add(Format('%s%s=Interface(%s)',[sIndent,lType.Name,lType.BaseType.Name]))
                       else
                        Definition.Items[sType].Add(Format('%s%s=Interface',[sIndent,lType.Name]));

                     end;
       tkInt64      : ;
       tkDynArray   : ;
       tkUString    : ;
       tkClassRef   : ;
       tkPointer    : ;
       tkProcedure  : ;
     end;

       //add the fields
       if OnlyDeclarated then
         for lField in lType.GetDeclaredFields do
           AddField(Definition.Items[ArrVisibility[lField.Visibility]],lField)
       else
         for lField in lType.GetFields do
           AddField(Definition.Items[ArrVisibility[lField.Visibility]],lField);

       //add the methods
       if OnlyDeclarated then
         for lMethod in lType.GetDeclaredMethods do
           AddMethod(Definition.Items[ArrVisibility[lMethod.Visibility]],lMethod)
       else
         for lMethod in lType.GetMethods do
           AddMethod(Definition.Items[ArrVisibility[lMethod.Visibility]],lMethod);

       //add the Properties
       if OnlyDeclarated then
         for lProperty in lType.GetDeclaredProperties do
           AddProperty(Definition.Items[ArrVisibility[lProperty.Visibility]],lProperty)
       else
         for lProperty in lType.GetProperties do
           AddProperty(Definition.Items[ArrVisibility[lProperty.Visibility]],lProperty);

     for i:=Low(TMemberVisibility) to High(TMemberVisibility) do
      if Definition.Items[ArrVisibility[i]].Count>1 then
       Definition.Items[sType].AddStrings(Definition.Items[ArrVisibility[i]]);

     Definition.Items[sType].Add(sIndent+'end;');
     Result:=Definition.Items[sType].Text;
   finally
    Definition.free;
    ctx.free;
   end;
end;

end.
