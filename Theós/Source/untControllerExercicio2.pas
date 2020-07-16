unit untControllerExercicio2;

interface

uses
  untDAOExercicio2, untFuncionario, untDependente, Vcl.Dialogs, System.SysUtils;

type
  TControllerExercicio2 = class
  private
    FDAOExercicio2: TDAOExercicio2;

    function fcValidarInformacoesFuncionario(const pFuncionario: TFuncionario): Boolean;
    function fcValidarInformacoesDependente(const pId_Funcionario: Integer; const pDependente: TDependente): Boolean;
  public
    constructor Create;
    destructor Destroy; override;

    // Funcion�rio
    function fcGerarIdFuncionario: Integer;
    procedure prSalvarFuncionario(const pFuncionario: TFuncionario);
    procedure prExcluirFuncionario(const pId_Funcionario: Integer);

    // Dependente
    function fcGerarIdDependente: Integer;
    procedure prSalvarDependente(const pId_Funcionario: Integer; const pDependente: TDependente);
    procedure prExcluirDependente(const pId_Dependente: Integer);
  end;

implementation

{ TControllerExercicio2 }

constructor TControllerExercicio2.Create;
begin
  FDAOExercicio2 := TDAOExercicio2.Create;
end;

destructor TControllerExercicio2.Destroy;
begin
  FreeAndNil(FDAOExercicio2);
  inherited;
 end;

function TControllerExercicio2.fcGerarIdDependente: Integer;
begin
  Result := FDAOExercicio2.fcGerarIdDependente;
end;

function TControllerExercicio2.fcGerarIdFuncionario: Integer;
begin
  Result := FDAOExercicio2.fcGerarIdFuncionario;
end;

function TControllerExercicio2.fcValidarInformacoesDependente(const pId_Funcionario: Integer; const pDependente: TDependente): Boolean;
begin
  Result := False;

  if pId_Funcionario <= 0 then
  begin
    ShowMessage('O c�digo do funcion�rio para este dependente n�o foi informado.');
    Exit;
  end;

  if pDependente.Id_Dependente <= 0 then
  begin
    ShowMessage('O c�digo do dependente n�o foi informado.');
    Exit;
  end;

  if pDependente.Nome = '' then
  begin
    ShowMessage('O nome do dependente n�o foi informado.');
    Exit;
  end;

  if not pDependente.IsCalcularIR in [0, 1] then
  begin
    ShowMessage('Informa��o inv�lida se o dependente calcula IR.');
    Exit;
  end;

  if not pDependente.IsCalcularINSS in [0, 1] then
  begin
    ShowMessage('Informa��o inv�lida se o dependente calcula INSS.');
    Exit;
  end;

  Result := True;
end;

function TControllerExercicio2.fcValidarInformacoesFuncionario(const pFuncionario: TFuncionario): Boolean;
begin
  Result := False;

  if pFuncionario.Id_Funcionario <= 0 then
  begin
    ShowMessage('O c�digo do funcion�rio n�o foi informado.');
    Exit;
  end;

  if pFuncionario.Nome = '' then
  begin
    ShowMessage('O nome do funcion�rio n�o foi informado.');
    Exit;
  end;

  if pFuncionario.CPF = '' then
  begin
    ShowMessage('O CPF do funcion�rio n�o foi informado.');
    Exit;
  end;

  if pFuncionario.Salario <= 0 then
  begin
    ShowMessage('O s�l�rio do funcion�rio n�o pode ser negativo ou zero.');
  end;

  Result := True;
end;

procedure TControllerExercicio2.prExcluirDependente(const pId_Dependente: Integer);
begin
  if not FDAOExercicio2.fcExcluirDependente(pId_Dependente) then
    ShowMessage('Erro ao tentar excluir dependente.');
end;

procedure TControllerExercicio2.prExcluirFuncionario(const pId_Funcionario: Integer);
begin
  if not FDAOExercicio2.fcExcluirFuncionario(pId_Funcionario) then
    ShowMessage('Erro ao tentar excluir funcion�rio.');
end;

procedure TControllerExercicio2.prSalvarDependente(const pId_Funcionario: Integer; const pDependente: TDependente);
begin
  if not fcValidarInformacoesDependente(pId_Funcionario, pDependente) then
    Exit;

  if not FDAOExercicio2.fcInserirDependente(pId_Funcionario, pDependente) then
    ShowMessage('Erro ao tentar salvar os dados do dependente.');
end;

procedure TControllerExercicio2.prSalvarFuncionario(const pFuncionario: TFuncionario);
begin
  if not fcValidarInformacoesFuncionario(pFuncionario) then
    Exit;

  if not FDAOExercicio2.fcInserirFuncionario(pFuncionario) then
    ShowMessage('Erro ao tentar salvar os dados do funcion�rio.');
end;

end.
