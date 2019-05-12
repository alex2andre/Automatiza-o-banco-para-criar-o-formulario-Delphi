unit Model.FactoryForm;

interface

uses
  uFrmAutoForm;


type
  TTipoForm = (tfProduto, tfGrupo, tfFilm, tfcliente,tfCategoria,tfPessoa,tfLancamento);

  TFactoryForm = class
  strict private
    class var FInstance: TFactoryForm;
    constructor Create;
  private
    function CreateFormProduto: TfrmAutoForm;
    function CreateFormGrupo: TfrmAutoForm;
    function CreateFormFilm: TFrmAutoForm;
    function CreateFormCliente: TfrmAutoForm;
    function CreateFormCategoria: TfrmAutoForm;
    function CreateFormPessoa: TfrmAutoForm;
    function CreateFormLancamento: TfrmAutoForm;
  public
    class function GetInstance: TFactoryForm;
    function GetForm(Form: TTipoForm): TfrmAutoForm;
  end;

implementation

constructor TFactoryForm.Create;
begin
  inherited;
end;

function TFactoryForm.CreateFormCategoria: TfrmAutoForm;
var
  Form: TfrmAutoForm;

begin
  Form := TfrmAutoForm.Create(nil, 'categoria','categoria','codigo','','');
  form.AddStringField('nome','Informe seu nome aqui',40,'',true);
  Result := Form;
end;

function TFactoryForm.CreateFormCliente: TfrmAutoForm;
var
  Form: TfrmAutoForm;
begin
  Form := TfrmAutoForm.Create(nil, 'cliente','Embarcadero Conference 2017','idcliente','','');
  form.AddStringField('nome','Informe seu nome aqui',40,'',true);
  Form.AddStringField('endereco','Endereço',50);
  Form.AddStringField('email','E-mail',50);
  Form.AddStringField('telefone','Telefone',30,'(99) 09999-9999;1;_');
  Result := Form;
end;

function TFactoryForm.CreateFormFilm: TFrmAutoForm;
begin

end;

function TFactoryForm.CreateFormGrupo: TfrmAutoForm;
var
  Form: TfrmAutoForm;
  sql:string;
begin
  sql:='create table GRUPO (GRUPOID int AUTO_INCREMENT,DESCRICAO varchar(100),PRIMARY KEY (GRUPOID)) ';
  Form := TfrmAutoForm.Create(nil,'GRUPO',
       'Cadastro de Grupo','GRUPOID','',sql);
  Form.AddStringField('DESCRICAO','Descrição',100,'',True);
  Result := Form;
end;

function TFactoryForm.CreateFormLancamento: TfrmAutoForm;
var
  Form: TfrmAutoForm;

begin
  Form := TfrmAutoForm.Create(nil,'LANCAMENTO',
  'Cadastro de Lançamento','codigo','','');
  Form.AddStringField('DESCRICAO','Descrição',70,'',true);
  Form.AddStringField('TIPO','TIPO',40);
  Form.AddDateField('DATA_VENCIMENTO','DATA_VENCIMENTO');
  Form.AddDateField('DATA_PAGAMENTO','DATA_PAGAMENTO');
  Form.AddFloatField('VALOR','VALOR',40, tfBCD);
  Form.AddStringField('OBSERVACAO','OBSERVACAO',40);
  Form.AddLookupField('CODIGO_CATEGORIA','CATEGORIA','CODIGO',  'NOME','SELECT CODIGO, NOME FROM CATEGORIA',50);

  Form.AddLookupField('CODIGO_PESSOA','PESSOA','CODIGO',  'NOME','SELECT CODIGO, NOME FROM PESSOA',50);
  Result := Form;

end;

function TFactoryForm.CreateFormPessoa: TfrmAutoForm;
var
  Form: TfrmAutoForm;

begin
 Form := TfrmAutoForm.Create(nil, 'pessoa','pessoa','codigo','','');
  form.AddStringField('nome','Informe seu nome aqui',40,'',true);
  form.AddBooleanField('ativo','Ativo',4);
  Result := Form;end;

function TFactoryForm.CreateFormProduto: TfrmAutoForm;
var
  Form: TfrmAutoForm;
  sql:string;
begin
  sql:='create table PRODUTO (PRODUTOID int AUTO_INCREMENT,GRUPOID int ,DESCRICAO varchar(100),FABRICANTE varchar(100),PRIMARY KEY (PRODUTOID),FOREIGN KEY(GRUPOID) REFERENCES GRUPO(GRUPOID)) ';
  Form := TfrmAutoForm.Create(nil,'PRODUTO',
  'Cadastro de Produto','PRODUTOID','',sql);
  Form.AddStringField('DESCRICAO','Descrição',70,'',true);
  Form.AddStringField('FABRICANTE','Fabricante',40);
  Form.AddLookupField('GRUPOID','Grupo','GRUPOID',
  'DESCRICAO','SELECT GRUPOID, DESCRICAO FROM GRUPO',50);
  Result := Form;
end;

function TFactoryForm.GetForm(Form: TTipoForm): TfrmAutoForm;
begin
  case Form of
    tfProduto: Result := CreateFormProduto;
    tfGrupo:   Result := CreateFormGrupo;
    tfFilm: Result := CreateFormFilm;
    tfcliente: Result := CreateFormCliente;
    tfCategoria:Result := CreateFormCategoria;
    tfPessoa:Result := CreateFormPessoa;
    tfLancamento:Result := CreateFormLancamento;
  end;
end;

class function TFactoryForm.GetInstance: TFactoryForm;
begin
  If FInstance = nil Then
  begin
    FInstance := Model.FactoryForm.TFactoryForm.Create();
  end;
  Result := FInstance;
end;

end.
