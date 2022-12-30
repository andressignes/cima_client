part of 'supply_problems_bloc.dart';

abstract class SupplyProblemsState extends Equatable {
  const SupplyProblemsState();
}

class Initial extends SupplyProblemsState {
  const Initial();

  @override
  List<Object> get props => [];
}

class Loading extends SupplyProblemsState {
  const Loading();

  @override
  List<Object> get props => [];
}

class Error extends SupplyProblemsState {
  const Error();

  @override
  List<Object?> get props => [];
}

class Loaded extends SupplyProblemsState {
  const Loaded(this.problemasSuministro);

  final List<ProblemaSuministro> problemasSuministro;

  @override
  List<Object> get props => [problemasSuministro];
}
