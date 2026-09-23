object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 540
  ClientWidth = 963
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 963
    Height = 540
    ActivePage = tb_01
    Align = alClient
    TabOrder = 0
    object tb_01: TTabSheet
      Caption = 'Documento Fiscal'
      object btnListaDocs: TButton
        Left = 789
        Top = 354
        Width = 161
        Height = 39
        Caption = 'Listar Documentos'
        TabOrder = 0
        OnClick = btnListaDocsClick
      end
      object btnEnvioArq: TButton
        Left = 789
        Top = 399
        Width = 161
        Height = 39
        Caption = 'Enviar Arquivo'
        TabOrder = 1
        OnClick = btnEnvioArqClick
      end
      object DBGrid1: TDBGrid
        Left = 3
        Top = 3
        Width = 947
        Height = 345
        DataSource = dsArquivos
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
      object Memo1: TMemo
        Left = 3
        Top = 354
        Width = 521
        Height = 89
        Lines.Strings = (
          'Memo1')
        TabOrder = 3
      end
      object Button1: TButton
        Left = 530
        Top = 418
        Width = 75
        Height = 25
        Caption = 'Button1'
        TabOrder = 4
        OnClick = Button1Click
      end
      object Button8: TButton
        Left = 789
        Top = 444
        Width = 161
        Height = 37
        Caption = 'Button8'
        TabOrder = 5
        OnClick = Button8Click
      end
    end
    object tb_02: TTabSheet
      Caption = 'Configura'#231#227'o'
      ImageIndex = 1
      object pg_config: TPageControl
        Left = 3
        Top = 3
        Width = 949
        Height = 438
        ActivePage = tb_config_nfe
        TabOrder = 0
        object tb_conf_webservice: TTabSheet
          Caption = 'NF-e / NFC-e'
          object GroupBox1: TGroupBox
            Left = 3
            Top = 17
            Width = 935
            Height = 136
            Caption = 'API'
            TabOrder = 0
            object Label3: TLabel
              Left = 9
              Top = 72
              Width = 92
              Height = 13
              Caption = 'API INUTILIZA'#199#195'O'
            end
            object Label1: TLabel
              Left = 9
              Top = 24
              Width = 86
              Height = 13
              Caption = 'API AUTORIZADA'
            end
            object Label2: TLabel
              Left = 487
              Top = 24
              Width = 276
              Height = 13
              Caption = 'API EVENTOS / CANCELAMENTO / CARTA DE CORRE'#199#195'O'
            end
            object txtUrlNFeNFCeInutilizacao: TEdit
              Left = 9
              Top = 91
              Width = 470
              Height = 24
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
            object txtUrlNFeNFCeAut: TEdit
              Left = 9
              Top = 43
              Width = 470
              Height = 24
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
            end
            object txtUrlNFeNFCeEventos: TEdit
              Left = 485
              Top = 43
              Width = 441
              Height = 24
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
            end
          end
          object GroupBox2: TGroupBox
            Left = 3
            Top = 159
            Width = 935
            Height = 202
            Caption = 'API'
            TabOrder = 1
            object Label4: TLabel
              Left = 9
              Top = 72
              Width = 134
              Height = 13
              Caption = 'LOCAL NFC-e AUTORIZADA'
            end
            object Label5: TLabel
              Left = 9
              Top = 24
              Width = 127
              Height = 13
              Caption = 'LOCAL NF-e AUTORIZADA'
            end
            object Label6: TLabel
              Left = 9
              Top = 104
              Width = 127
              Height = 13
              Caption = 'LOCAL NF-e AUTORIZADA'
            end
            object Label7: TLabel
              Left = 502
              Top = 72
              Width = 113
              Height = 13
              Caption = 'LOCAL NFC-e EVENTOS'
            end
            object Label8: TLabel
              Left = 502
              Top = 24
              Width = 106
              Height = 13
              Caption = 'LOCAL NF-e EVENTOS'
            end
            object Label9: TLabel
              Left = 9
              Top = 122
              Width = 140
              Height = 13
              Caption = 'LOCAL NFC-e INUTILIZA'#199#195'O'
            end
            object Label10: TLabel
              Left = 502
              Top = 122
              Width = 129
              Height = 13
              Caption = 'LOCAL NFe INUTILIZA'#199#195'O'
            end
            object txtNFCeAut: TEdit
              Left = 9
              Top = 91
              Width = 432
              Height = 24
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
            object txtNFeAut: TEdit
              Left = 9
              Top = 43
              Width = 432
              Height = 24
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
            end
            object Button2: TButton
              Left = 446
              Top = 43
              Width = 52
              Height = 24
              Caption = '+'
              TabOrder = 2
              OnClick = Button2Click
            end
            object Button3: TButton
              Left = 446
              Top = 91
              Width = 52
              Height = 24
              Caption = '+'
              TabOrder = 3
              OnClick = Button3Click
            end
            object txtNFeEnv: TEdit
              Left = 502
              Top = 43
              Width = 371
              Height = 24
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 4
            end
            object txtNFCeEvent: TEdit
              Left = 502
              Top = 91
              Width = 371
              Height = 24
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 5
            end
            object Button4: TButton
              Left = 878
              Top = 91
              Width = 52
              Height = 24
              Caption = '+'
              TabOrder = 6
              OnClick = Button4Click
            end
            object btnev: TButton
              Left = 878
              Top = 43
              Width = 52
              Height = 24
              Caption = '+'
              TabOrder = 7
              OnClick = btnevClick
            end
            object txtNFCeInut: TEdit
              Left = 9
              Top = 141
              Width = 432
              Height = 24
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 8
            end
            object Button5: TButton
              Left = 446
              Top = 141
              Width = 52
              Height = 24
              Caption = '+'
              TabOrder = 9
              OnClick = Button5Click
            end
            object txtNFeInut: TEdit
              Left = 502
              Top = 141
              Width = 371
              Height = 24
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 10
            end
            object Button6: TButton
              Left = 878
              Top = 141
              Width = 52
              Height = 24
              Caption = '+'
              TabOrder = 11
              OnClick = Button6Click
            end
          end
        end
        object tb_config_nfe: TTabSheet
          Caption = 'NFe'
          ImageIndex = 1
        end
      end
      object Button7: TButton
        Left = 784
        Top = 455
        Width = 156
        Height = 34
        Caption = 'GRAVAR CONFIGURA'#199#195'O'
        TabOrder = 1
        OnClick = Button7Click
      end
    end
  end
  object qry_arquivos: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 592
    Top = 144
    object qry_arquivosid: TAutoIncField
      FieldName = 'id'
    end
    object qry_arquivospath: TStringField
      FieldName = 'path'
      Size = 600
    end
    object qry_arquivosfile_name: TStringField
      FieldName = 'file_name'
      Size = 600
    end
    object qry_arquivostipo: TStringField
      FieldName = 'tipo'
      Size = 100
    end
    object qry_arquivosdata_criacao: TDateTimeField
      FieldName = 'data_criacao'
    end
    object qry_arquivosdata_modificacao: TDateTimeField
      FieldName = 'data_modificacao'
    end
  end
  object dsArquivos: TDataSource
    DataSet = qry_arquivos
    Left = 688
    Top = 160
  end
end
