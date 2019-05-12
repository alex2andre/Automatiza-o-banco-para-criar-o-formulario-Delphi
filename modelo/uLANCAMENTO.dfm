inherited frmLANCAMENTO: TfrmLANCAMENTO
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
  end
  inherited Pc: TPageControl
    Width = 956
    Height = 515
    ActivePage = TbConsulta
    ExplicitWidth = 956
    ExplicitHeight = 515
    inherited TbCadastro: TTabSheet
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 948
      ExplicitHeight = 505
      object lblDescricao: TLabel [0]
        Left = 10
        Top = 10
        Width = 48
        Height = 13
        Caption = 'Descri'#231#227'o'
      end
      inherited pnlControls: TPanel
        Width = 948
        Height = 505
        ExplicitWidth = 948
        ExplicitHeight = 505
        object lblTIPO: TLabel
          Left = 545
          Top = 10
          Width = 32
          Height = 16
          Caption = 'TIPO'
        end
        object lblPESSOA: TLabel
          Left = 10
          Top = 138
          Width = 53
          Height = 16
          Caption = 'PESSOA'
        end
        object lblCATEGORIA: TLabel
          Left = 630
          Top = 74
          Width = 75
          Height = 16
          Caption = 'CATEGORIA'
        end
        object lblOBSERVACAO: TLabel
          Left = 320
          Top = 74
          Width = 89
          Height = 16
          Caption = 'OBSERVACAO'
        end
        object lblVALOR: TLabel
          Left = 10
          Top = 74
          Width = 43
          Height = 16
          Caption = 'VALOR'
        end
        object lblDATA_PAGAMENTO: TLabel
          Left = 1010
          Top = 10
          Width = 124
          Height = 16
          Caption = 'DATA_PAGAMENTO'
        end
        object lblDATA_VENCIMENTO: TLabel
          Left = 855
          Top = 10
          Width = 129
          Height = 16
          Caption = 'DATA_VENCIMENTO'
        end
        object lkcbCODIGO_PESSOA: TDBLookupComboBox
          Left = 10
          Top = 164
          Width = 300
          Height = 24
          DataField = 'CODIGO_PESSOA'
          DataSource = dsAutoForm
          KeyField = 'CODIGO'
          ListField = 'NOME'
          ListSource = dsPESSOA
          TabOrder = 0
        end
        object lkcbCODIGO_CATEGORIA: TDBLookupComboBox
          Left = 630
          Top = 100
          Width = 300
          Height = 24
          DataField = 'CODIGO_CATEGORIA'
          DataSource = dsAutoForm
          KeyField = 'CODIGO'
          ListField = 'NOME'
          ListSource = dsCATEGORIA
          TabOrder = 1
        end
        object edtOBSERVACAO: TDBEdit
          Left = 320
          Top = 100
          Width = 300
          Height = 30
          DataField = 'OBSERVACAO'
          DataSource = dsAutoForm
          TabOrder = 2
        end
        object edtVALOR: TDBEdit
          Left = 10
          Top = 100
          Width = 300
          Height = 30
          DataField = 'VALOR'
          DataSource = dsAutoForm
          TabOrder = 3
        end
        object edtDATA_PAGAMENTO: TDBEdit
          Left = 1010
          Top = 36
          Width = 140
          Height = 30
          DataField = 'DATA_PAGAMENTO'
          DataSource = dsAutoForm
          TabOrder = 4
        end
        object edtDATA_VENCIMENTO: TDBEdit
          Left = 855
          Top = 36
          Width = 145
          Height = 30
          DataField = 'DATA_VENCIMENTO'
          DataSource = dsAutoForm
          TabOrder = 5
        end
        object edtTIPO: TDBEdit
          Left = 545
          Top = 36
          Width = 300
          Height = 30
          DataField = 'TIPO'
          DataSource = dsAutoForm
          TabOrder = 6
        end
        object edtDESCRICAO: TDBEdit
          Left = 10
          Top = 36
          Width = 525
          Height = 30
          DataField = 'DESCRICAO'
          DataSource = dsAutoForm
          TabOrder = 7
        end
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
  object sdsCATEGORIA: TFDQuery
    Left = 10
    Top = 10
  end
  object dsCATEGORIA: TDataSource
    DataSet = sdsCATEGORIA
    Left = 10
    Top = 10
  end
  object sdsPESSOA: TFDQuery
    Left = 10
    Top = 10
  end
  object dsPESSOA: TDataSource
    DataSet = sdsPESSOA
    Left = 10
    Top = 10
  end
  object qryAutoForm: TFDQuery
    Connection = DM.FDConn
    Left = 188
    Top = 239
  end
end
