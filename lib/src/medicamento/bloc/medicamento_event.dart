part of 'medicamento_bloc.dart';

abstract class MedicamentoEvent extends Equatable {
  const MedicamentoEvent();

  @override
  List<Object?> get props => [];
}

class FetchMedicamento extends MedicamentoEvent {
  const FetchMedicamento({this.cn, this.nregistro});

  final String? cn;
  final String? nregistro;

  @override
  List<Object?> get props => [cn, nregistro];
}
