part of 'medicamento_bloc.dart';

abstract class MedicamentoState extends Equatable {
  const MedicamentoState();

  @override
  List<Object> get props => [];
}

class Initial extends MedicamentoState {}

class Error extends MedicamentoState {}

class Loading extends MedicamentoState {}

class Available extends MedicamentoState {
  final Medicamento medicamento;

  const Available({required this.medicamento});

  @override
  List<Object> get props => [super.props, medicamento];
}
