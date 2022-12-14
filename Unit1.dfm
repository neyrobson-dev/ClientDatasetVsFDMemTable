object Form1: TForm1
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'TClientDataSet VS TFDMemTable'
  ClientHeight = 317
  ClientWidth = 399
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object lblClientDataset: TLabel
    Left = 44
    Top = 87
    Width = 65
    Height = 13
    Caption = 'ClientDataset'
  end
  object lblFDMemTable: TLabel
    Left = 286
    Top = 87
    Width = 61
    Height = 13
    Caption = 'FDMemTable'
  end
  object lblRecordCount: TLabel
    Left = 150
    Top = 89
    Width = 101
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = 'Count'
  end
  object btnFDAppend: TButton
    Left = 252
    Top = 106
    Width = 135
    Height = 21
    Caption = 'Append'
    TabOrder = 0
    OnClick = btnFDAppendClick
  end
  object btnAppend: TButton
    Left = 17
    Top = 106
    Width = 135
    Height = 21
    Caption = 'Append'
    TabOrder = 1
    OnClick = btnAppendClick
  end
  object btnFDEmptyDataSet: TButton
    Left = 252
    Top = 206
    Width = 135
    Height = 21
    Caption = 'EmptyDataSet'
    TabOrder = 6
    OnClick = btnFDEmptyDataSetClick
  end
  object btnEmptyDataSet: TButton
    Left = 17
    Top = 206
    Width = 135
    Height = 21
    Caption = 'EmptyDataSet'
    TabOrder = 7
    OnClick = btnEmptyDataSetClick
  end
  object btnSaveToFile: TButton
    Left = 17
    Top = 156
    Width = 135
    Height = 21
    Caption = 'SaveToFile'
    TabOrder = 3
    OnClick = btnSaveToFileClick
  end
  object btnFDSaveToFile: TButton
    Left = 252
    Top = 156
    Width = 135
    Height = 21
    Caption = 'SaveToFile'
    TabOrder = 2
    OnClick = btnFDSaveToFileClick
  end
  object btnLoadFromFile: TButton
    Left = 17
    Top = 231
    Width = 135
    Height = 21
    Caption = 'LoadFromFile'
    TabOrder = 9
    OnClick = btnLoadFromFileClick
  end
  object btnFDLoadFromFile: TButton
    Left = 252
    Top = 231
    Width = 135
    Height = 21
    Caption = 'LoadFromFile'
    TabOrder = 8
    OnClick = btnFDLoadFromFileClick
  end
  object btnSaveToStream: TButton
    Left = 17
    Top = 181
    Width = 135
    Height = 21
    Caption = 'SaveToStream'
    TabOrder = 5
    OnClick = btnSaveToStreamClick
  end
  object btnFDSaveToStream: TButton
    Left = 252
    Top = 181
    Width = 135
    Height = 21
    Caption = 'SaveToStream'
    TabOrder = 4
    OnClick = btnFDSaveToStreamClick
  end
  object btnFDLoadFromStream: TButton
    Left = 252
    Top = 256
    Width = 135
    Height = 21
    Caption = 'LoadFromStream'
    TabOrder = 10
    OnClick = btnFDLoadFromStreamClick
  end
  object btnLoadFromStream: TButton
    Left = 17
    Top = 256
    Width = 135
    Height = 21
    Caption = 'LoadFromStream'
    TabOrder = 11
    OnClick = btnLoadFromStreamClick
  end
  object btn1: TButton
    Left = 17
    Top = 8
    Width = 75
    Height = 25
    Caption = '10'
    TabOrder = 12
    OnClick = AjustaCount
  end
  object btn2: TButton
    Left = 115
    Top = 8
    Width = 75
    Height = 25
    Caption = '100'
    TabOrder = 13
    OnClick = AjustaCount
  end
  object btn3: TButton
    Left = 214
    Top = 8
    Width = 75
    Height = 25
    Caption = '1000'
    TabOrder = 14
    OnClick = AjustaCount
  end
  object btn4: TButton
    Left = 312
    Top = 8
    Width = 75
    Height = 25
    Caption = '10000'
    TabOrder = 15
    OnClick = AjustaCount
  end
  object btn5: TButton
    Left = 17
    Top = 39
    Width = 75
    Height = 25
    Caption = '100000'
    TabOrder = 16
    OnClick = AjustaCount
  end
  object btn6: TButton
    Left = 115
    Top = 39
    Width = 75
    Height = 25
    Caption = '1000000'
    TabOrder = 17
    OnClick = AjustaCount
  end
  object btn7: TButton
    Left = 214
    Top = 39
    Width = 75
    Height = 25
    Caption = '10000000'
    TabOrder = 18
    OnClick = AjustaCount
  end
  object btn8: TButton
    Left = 312
    Top = 39
    Width = 75
    Height = 25
    Caption = '10000000'
    TabOrder = 19
    OnClick = AjustaCount
  end
  object btnFDInsert: TButton
    Left = 252
    Top = 131
    Width = 135
    Height = 21
    Caption = 'Insert'
    TabOrder = 20
    OnClick = btnFDInsertClick
  end
  object btnInsert: TButton
    Left = 17
    Top = 131
    Width = 135
    Height = 21
    Caption = 'Insert'
    TabOrder = 21
    OnClick = btnInsertClick
  end
  object btnFDCopyData: TButton
    Left = 252
    Top = 282
    Width = 135
    Height = 21
    Caption = 'CopyData'
    TabOrder = 22
    OnClick = btnFDCopyDataClick
  end
  object btnCopyData: TButton
    Left = 17
    Top = 282
    Width = 135
    Height = 21
    Caption = 'CopyData'
    TabOrder = 23
    OnClick = btnCopyDataClick
  end
end
