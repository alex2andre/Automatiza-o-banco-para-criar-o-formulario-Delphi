inherited frmAutoFormModelo: TfrmAutoForm
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
      ExplicitWidth = 948
      ExplicitHeight = 505
      inherited pnlControls: TPanel
        Width = 948
        Height = 505
        ExplicitWidth = 948
        ExplicitHeight = 505
      end
    end
    inherited TbConsulta: TTabSheet
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