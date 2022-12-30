part of 'medication_detail_bloc.dart';

abstract class MedicationDetailEvent extends Equatable {
  const MedicationDetailEvent();

  @override
  List<Object?> get props => [];
}

class FetchMedicamento extends MedicationDetailEvent {
  const FetchMedicamento({this.cn, this.nregistro});

  final String? cn;
  final String? nregistro;

  @override
  List<Object?> get props => [cn, nregistro];
}
