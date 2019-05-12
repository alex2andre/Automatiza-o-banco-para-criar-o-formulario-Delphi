inherited frmAutoForm: TfrmAutoForm
  Left = 356
  Top = 113
  Caption = 'frmAutoForm'
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
    Left = 488
    Top = 272
  end
  inherited ActionList1: TActionList
    Left = 560
  end
  object dspAutoForm: TDataSetProvider [4]
    DataSet = qryAutoForm
    Left = 328
    Top = 272
  end
  object cdsAutoForm: TClientDataSet [5]
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAutoForm'
    BeforePost = cdsAutoFormBeforePost
    OnNewRecord = cdsAutoFormNewRecord
    Left = 408
    Top = 272
  end
  inherited ImageList1: TImageList
    Left = 521
  end
  inherited SaveDlgExport: TSaveDialog
    Left = 480
    Top = 344
  end
  object mtMetaData1: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 212
    Top = 151
  end
  object qryAutoForm: TFDQuery
    Connection = DM.FDConn
    Left = 188
    Top = 239
  end
  object FDQuery1: TFDQuery
    Connection = DM.FDConn
    Left = 188
    Top = 303
  end
end
