part of 'medication_detail_bloc.dart';

abstract class MedicationDetailState extends Equatable {
  const MedicationDetailState();

  @override
  List<Object> get props => [];
}

class Initial extends MedicationDetailState {}

class Error extends MedicationDetailState {}

class Loading extends MedicationDetailState {}

class Available extends MedicationDetailState {
  final Medicamento medicamento;

  const Available({required this.medicamento});

  @override
  List<Object> get props => [super.props, medicamento];
}
