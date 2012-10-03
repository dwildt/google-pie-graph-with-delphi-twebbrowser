object FormGoogleGraph: TFormGoogleGraph
  Left = 192
  Top = 124
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Demonstra'#231#227'o de uso do Google Graph em um app Desktop'
  ClientHeight = 339
  ClientWidth = 707
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lblFill: TLabel
    Left = 8
    Top = 8
    Width = 434
    Height = 14
    Caption = 
      'Preencha tipos e valores - salve para ver o gr'#225'fico gerado via G' +
      'oogle Graph API'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DBGrid: TDBGrid
    Left = 8
    Top = 24
    Width = 177
    Height = 265
    DataSource = dsTipos
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Tipo'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Valor'
        Width = 40
        Visible = True
      end>
  end
  object WebBrowser: TWebBrowser
    Left = 192
    Top = 24
    Width = 500
    Height = 300
    TabOrder = 1
    ControlData = {
      4C000000AD330000021F00000000000000000000000000000000000000000000
      000000004C000000000000000000000001000000E0D057007335CF11AE690800
      2B2E126208000000000000004C0000000114020000000000C000000000000046
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000000100000000000000000000000000000000000000}
  end
  object DBNavigator: TDBNavigator
    Left = 8
    Top = 291
    Width = 175
    Height = 33
    DataSource = dsTipos
    VisibleButtons = [nbInsert, nbDelete, nbEdit, nbPost, nbCancel]
    Flat = True
    TabOrder = 2
  end
  object dsTipos: TDataSource
    DataSet = cdsTipos
    Left = 32
    Top = 48
  end
  object cdsTipos: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    AfterPost = cdsTiposAfterPost
    AfterDelete = cdsTiposAfterDelete
    Left = 32
    Top = 80
    Data = {
      410000009619E0BD010000001800000002000000000003000000410004546970
      6F0100490000000100055749445448020002001E000556616C6F720400010000
      0000000000}
    object cdsTiposTipo: TStringField
      FieldName = 'Tipo'
      Size = 30
    end
    object cdsTiposValor: TIntegerField
      FieldName = 'Valor'
    end
  end
  object pgProdGooglePie: TPageProducer
    HTMLDoc.Strings = (
      '<html>'
      '  <head>'
      
        '    <script type="text/javascript" src="https://www.google.com/j' +
        'sapi"></script>'
      '    <script type="text/javascript">'
      
        '      google.load("visualization", "1", {packages:["corechart"]}' +
        ');'
      '      google.setOnLoadCallback(drawChart);'
      '      function drawChart() {'
      '        var data = google.visualization.arrayToDataTable(['
      '          ['#39'Tipo'#39', '#39'Valor'#39'],'
      '          <#DATA>'
      '        ]);'
      ''
      '        var options = {'
      '          title: '#39'An'#225'lise feita no Delphi com Google Graph'#39
      '        };'
      ''
      
        '        var chart = new google.visualization.PieChart(document.g' +
        'etElementById('#39'chart_div'#39'));'
      '        chart.draw(data, options);'
      '      }'
      '    </script>'
      '  </head>'
      '  <body margintop=0 marginleft=0 marginright=0 marginbottom=0>'
      
        '    <div id="chart_div" style="width: 455px; height: 255px;"></d' +
        'iv>'
      '  </body>'
      '</html>')
    OnHTMLTag = pgProdGooglePieHTMLTag
    Left = 32
    Top = 112
  end
end
