unit untCalcularImpostoExercicio2Test;
{

  Delphi DUnit Test Case
  ----------------------
  This unit contains a skeleton test case class generated by the Test Case Wizard.
  Modify the generated code to correctly setup and call the methods from the unit 
  being tested.

}

interface

uses
  TestFramework, untCalcularImpostoExercicio2, Generics.Collections, untDependente,
  untFuncionario;

type
  // Test methods for class TCalcularImpostoExercicio2

  TestTCalcularImpostoExercicio2 = class(TTestCase)
  strict private
    FCalcularImpostoExercicio2: TCalcularImpostoExercicio2;
  private
    procedure prPrepararFuncionario(const pFuncionario: TFuncionario);
    procedure prPrepararListaDependente(const pFuncionario: TFuncionario);
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure fcRetornarValorIRTest;
    procedure fcRetornarValorINSSTest;
  end;

implementation

procedure TestTCalcularImpostoExercicio2.prPrepararFuncionario(const pFuncionario: TFuncionario);
begin
  pFuncionario.Id_Funcionario := 1;
  pFuncionario.Salario := 1000;

  prPrepararListaDependente(pFuncionario);
end;

procedure TestTCalcularImpostoExercicio2.prPrepararListaDependente(const pFuncionario: TFuncionario);
var
  vDependenteAux: TDependente;
begin
  vDependenteAux := TDependente.Create;
  vDependenteAux.Id_Dependente  := 1;
  vDependenteAux.IsCalcularIR   := 1;
  vDependenteAux.IsCalcularINSS := 1;

  pFuncionario.ListaDependentes.Add(vDependenteAux);

  vDependenteAux := TDependente.Create;
  vDependenteAux.Id_Dependente  := 2;
  vDependenteAux.IsCalcularIR   := 1;
  vDependenteAux.IsCalcularINSS := 0;

  pFuncionario.ListaDependentes.Add(vDependenteAux);

  vDependenteAux := TDependente.Create;
  vDependenteAux.Id_Dependente  := 3;
  vDependenteAux.IsCalcularIR   := 0;
  vDependenteAux.IsCalcularINSS := 1;

  pFuncionario.ListaDependentes.Add(vDependenteAux);
end;

procedure TestTCalcularImpostoExercicio2.SetUp;
begin
  FCalcularImpostoExercicio2 := TCalcularImpostoExercicio2.Create;
end;

procedure TestTCalcularImpostoExercicio2.TearDown;
begin
  FCalcularImpostoExercicio2.Free;
  FCalcularImpostoExercicio2 := nil;
end;

procedure TestTCalcularImpostoExercicio2.fcRetornarValorIRTest;
var
  ReturnValue: Double;
  vFuncionario: TFuncionario;
begin
  vFuncionario := TFuncionario.Create;

  prPrepararFuncionario(vFuncionario);

  // TODO: Setup method call parameters
  ReturnValue := FCalcularImpostoExercicio2.fcRetornarValorIR(vFuncionario);
  // TODO: Validate method results
  CheckEquals(120,ReturnValue,'Valor incorreto para o c�lculo de IR.');
end;

procedure TestTCalcularImpostoExercicio2.fcRetornarValorINSSTest;
var
  ReturnValue: Double;
  vFuncionario: TFuncionario;
begin
  vFuncionario := TFuncionario.Create;

  prPrepararFuncionario(vFuncionario);

  // TODO: Setup method call parameters
  ReturnValue := FCalcularImpostoExercicio2.fcRetornarValorINSS(vFuncionario);
  // TODO: Validate method results
  CheckEquals(80,ReturnValue,'Valor incorreto para o c�lculo do INSS.');
end;

initialization
  // Register any test cases with the test runner
  RegisterTest(TestTCalcularImpostoExercicio2.Suite);
end.

