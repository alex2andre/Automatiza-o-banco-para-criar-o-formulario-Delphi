inherited frm: Tfrm
  Left = 356
  Top = 113
  Caption = 'frmAutoFormModelo'
  ClientHeight = 588
  ClientWidth = 956
  OldCreateOrder = True
  ExplicitWidth = 962
  ExplicitHeight = 617
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnTitulo: TPanel
    Width = 956
    ExplicitWidth = 956
    inherited SpeedButton9: TSpeedButton
      Left = 861
      ExplicitLeft = 514
    end
  object sdsCATEGORIA: TSimpleDataSet
    Top = 10
    Left = 10
    Aggregates = <>
    Params = <>
    Connection =  DM.DBConn
    DataSet.CommandText = 'SELECT CODIGO, NOME FROM CATEGORIA'
  end
  end
  object dsCATEGORIA: TDataSource
    Top = 10
    Left = 10
    DataSet = sdsCATEGORIA
  end
  object sdsPESSOA: TSimpleDataSet
    Top = 10
    Left = 10
    Aggregates = <>
    Params = <>
    Connection =  DM.DBConn
    DataSet.CommandText = 'SELECT CODIGO, NOME FROM PESSOA'
  end
  object dsPESSOA: TDataSource
    Top = 10
    Left = 10
    DataSet = sdsPESSOA
  end
  inherited Pc: TPageControl
    Width = 956
    Height = 515
    ActivePage = TbConsulta
    ExplicitWidth = 956
    ExplicitHeight = 515
    inherited TbCadastro: TTabSheet
      ExplicitWidth = 948
      ExplicitHeight = 505
      inherited pnlControls: TPanel
        Width = 948
        Height = 505
        ExplicitWidth = 948
        ExplicitHeight = 505
        object lblTIPO: TLabel
          Width = 50
          Height = 23
          Top = 10
          Left = 545
          Caption = 'TIPO'
        end
        object lkcbCODIGO_PESSOA: TDBLookupComboBox
          Width = 300
          Height = 26
          Top = 164
          Left = 10
          DataSource = dsAutoForm
          DataField = 'CODIGO_PESSOA'
          KeyField = 'CODIGO'
          ListField = 'NOME'
          ListSource = dsPESSOA
        end
        object lkcbCODIGO_CATEGORIA: TDBLookupComboBox
          Width = 300
          Height = 26
          Top = 100
          Left = 630
          DataSource = dsAutoForm
          DataField = 'CODIGO_CATEGORIA'
          KeyField = 'CODIGO'
          ListField = 'NOME'
          ListSource = dsCATEGORIA
        end
        object edtOBSERVACAO: TDBEdit
          Width = 300
          Height = 30
          Top = 100
          Left = 320
          DataSource = dsAutoForm
          DataField = 'OBSERVACAO'
        end
        object edtVALOR: TDBEdit
          Width = 300
          Height = 30
          Top = 100
          Left = 10
          DataSource = dsAutoForm
          DataField = 'VALOR'
        end
        object edtDATA_PAGAMENTO: TDBEdit
          Width = 140
          Height = 30
          Top = 36
          Left = 1010
          DataSource = dsAutoForm
          DataField = 'DATA_PAGAMENTO'
        end
        object edtDATA_VENCIMENTO: TDBEdit
          Width = 145
          Height = 30
          Top = 36
          Left = 855
          DataSource = dsAutoForm
          DataField = 'DATA_VENCIMENTO'
        end
        object edtTIPO: TDBEdit
          Width = 300
          Height = 30
          Top = 36
          Left = 545
          DataSource = dsAutoForm
          DataField = 'TIPO'
        end
        object edtDESCRICAO: TDBEdit
          Width = 525
          Height = 30
          Top = 36
          Left = 10
          DataSource = dsAutoForm
          DataField = 'DESCRICAO'
        end
        object lblPESSOA: TLabel
          Width = 80
          Height = 23
          Top = 138
          Left = 10
          Caption = 'PESSOA'
        end
        object lblCATEGORIA: TLabel
          Width = 119
          Height = 23
          Top = 74
          Left = 630
          Caption = 'CATEGORIA'
        end
        object lblOBSERVACAO: TLabel
          Width = 140
          Height = 23
          Top = 74
          Left = 320
          Caption = 'OBSERVACAO'
        end
        object lblVALOR: TLabel
          Width = 69
          Height = 23
          Top = 74
          Left = 10
          Caption = 'VALOR'
        end
        object lblDATA_PAGAMENTO: TLabel
          Width = 193
          Height = 23
          Top = 10
          Left = 1010
          Caption = 'DATA_PAGAMENTO'
        end
        object lblDATA_VENCIMENTO: TLabel
          Width = 201
          Height = 23
          Top = 10
          Left = 855
          Caption = 'DATA_VENCIMENTO'
        end
      end
        object lblDescricao: TLabel
          Width = 98
          Height = 23
          Top = 10
          Left = 10
          Caption = 'Descrição'
        end
    end
    inherited TbConsulta: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 6
      ExplicitWidth = 948
      ExplicitHeight = 505
      inherited PnConsulta: TPanel
        Width = 948
        ExplicitWidth = 948
      end
      inherited StatusBar1: TStatusBar
        Top = 486
        Width = 948
        ExplicitTop = 486
        ExplicitWidth = 948
      end
      inherited DBGrid1: TDBGrid
        Width = 948
        Height = 453
      end
    end
  end
  inherited dsAutoForm: TDataSource
    DataSet = cdsAutoForm
    Left = 480
    Top = 272
  end
  inherited ActionList1: TActionList
    Left = 560
  end
  object dspAutoForm: TDataSetProvider [4]
    Left = 336
    Top = 272
  end
  object cdsAutoForm: TClientDataSet [5]
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAutoForm'
    BeforePost = cdsAutoFormBeforePost
    OnNewRecord = cdsAutoFormNewRecord
    Left = 416
    Top = 272
  end
  inherited ImageList1: TImageList
    Left = 521
  end
  inherited SaveDlgExport: TSaveDialog
    Left = 480
    Top = 344
  end
  object qryAutoForm: TFDQuery
    Connection = DM.FDConn
    Left = 188
    Top = 239
  end
end
