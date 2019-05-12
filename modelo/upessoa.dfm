inherited frmpessoa: Tfrmpessoa
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
      ExplicitWidth = 948
      ExplicitHeight = 505
      object lblInformeseunomeaqui: TLabel [0]
        Left = 10
        Top = 10
        Width = 107
        Height = 13
        Caption = 'Informe seu nome aqui'
      end
      inherited pnlControls: TPanel
        Width = 948
        Height = 505
        ExplicitWidth = 948
        ExplicitHeight = 505
        object lblAtivo: TLabel
          Left = 320
          Top = 10
          Width = 34
          Height = 16
          Caption = 'Ativo'
        end
        object ckbativo: TDBCheckBox
          Left = 320
          Top = 36
          Width = 28
          Height = 24
          DataField = 'ativo'
          DataSource = dsAutoForm
          TabOrder = 0
        end
        object edtnome: TDBEdit
          Left = 10
          Top = 36
          Width = 300
          Height = 24
          DataField = 'nome'
          DataSource = dsAutoForm
          TabOrder = 1
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
    DataSet = qryAutoForm
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
    SQL.Strings = (
      'select * from pessoa')
    Left = 188
    Top = 239
  end
end
