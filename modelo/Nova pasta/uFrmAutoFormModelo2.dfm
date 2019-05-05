inherited frmAutoForm: TfrmAutoForm
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
    ExplicitWidth = 956
    ExplicitHeight = 515
    inherited TbCadastro: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 6
      ExplicitWidth = 948
      ExplicitHeight = 505
      inherited pnlControls: TPanel
        Width = 948
        Height = 505
        ExplicitWidth = 948
        ExplicitHeight = 505
        object Label1: TLabel
          Width = 98
          Height = 23
          Top = 10
          Left = 10
          Caption = 'Descrição'
        end
        object DBLookupComboBox16: TDBLookupComboBox
          Width = 300
          Height = 26
          Top = 164
          Left = 10
          DataSource = dsAutoForm
        end
        object DBLookupComboBox15: TDBLookupComboBox
          Width = 300
          Height = 26
          Top = 100
          Left = 630
          DataSource = dsAutoForm
        end
        object DBEdit14: TDBEdit
          Width = 300
          Height = 30
          Top = 100
          Left = 320
          DataSource = dsAutoForm
        end
        object DBEdit13: TDBEdit
          Width = 300
          Height = 30
          Top = 100
          Left = 10
          DataSource = dsAutoForm
        end
        object DBEdit12: TDBEdit
          Width = 140
          Height = 30
          Top = 36
          Left = 1010
          DataSource = dsAutoForm
        end
        object DBEdit11: TDBEdit
          Width = 145
          Height = 30
          Top = 36
          Left = 855
          DataSource = dsAutoForm
        end
        object DBEdit10: TDBEdit
          Width = 300
          Height = 30
          Top = 36
          Left = 545
          DataSource = dsAutoForm
        end
        object DBEdit9: TDBEdit
          Width = 525
          Height = 30
          Top = 36
          Left = 10
          DataSource = dsAutoForm
        end
        object Label8: TLabel
          Width = 80
          Height = 23
          Top = 138
          Left = 10
          Caption = 'PESSOA'
        end
        object Label7: TLabel
          Width = 119
          Height = 23
          Top = 74
          Left = 630
          Caption = 'CATEGORIA'
        end
        object Label6: TLabel
          Width = 140
          Height = 23
          Top = 74
          Left = 320
          Caption = 'OBSERVACAO'
        end
        object Label5: TLabel
          Width = 69
          Height = 23
          Top = 74
          Left = 10
          Caption = 'VALOR'
        end
        object Label4: TLabel
          Width = 193
          Height = 23
          Top = 10
          Left = 1010
          Caption = 'DATA_PAGAMENTO'
        end
        object Label3: TLabel
          Width = 201
          Height = 23
          Top = 10
          Left = 855
          Caption = 'DATA_VENCIMENTO'
        end
        object Label2: TLabel
          Width = 50
          Height = 23
          Top = 10
          Left = 545
          Caption = 'TIPO'
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
    Left = 432
    Top = 272
  end
  inherited ActionList1: TActionList
    Left = 560
  end
  object sdsMetaData: TSimpleDataSet [4]
    Aggregates = <>
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    PacketRecords = 0
    Params = <>
    Left = 312
    Top = 152
  end
  object sqAutoForm: TSQLDataSet [5]
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM.DBConn
    Left = 296
    Top = 272
  end
  object dspAutoForm: TDataSetProvider [6]
    DataSet = sqAutoForm
    Left = 352
    Top = 272
  end
  object cdsAutoForm: TClientDataSet [7]
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAutoForm'
    BeforePost = cdsAutoFormBeforePost
    OnNewRecord = cdsAutoFormNewRecord
    Left = 392
    Top = 272
  end
  inherited ImageList1: TImageList
    Left = 521
  end
  inherited SaveDlgExport: TSaveDialog
    Left = 480
    Top = 344
  end
end
