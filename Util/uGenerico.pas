unit uGenerico;

interface

Uses
  Vcl.Controls;

Type
  TFormGeneric = class
  Public
    procedure ConfigControles;Virtual;Abstract;
    procedure HabilitaControlesModoInclusao;Virtual;Abstract;
    procedure Pesquisa;Virtual;Abstract;
  end;

implementation

{ TFormGeneric }

end.
