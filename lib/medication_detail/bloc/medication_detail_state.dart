part of 'medication_detail_bloc.dart';

abstract class MedicationDetailState extends Equatable {
  const MedicationDetailState();

  @override
  List<Object> get props => [];
}

class Initial extends MedicationDetailState {}

class Error extends MedicationDetailState {}

class Loading extends MedicationDetailState {}

class AvailableMedicationDetailState extends MedicationDetailState {
  const AvailableMedicationDetailState({required this.medicamento});

  final Medicamento medicamento;

  @override
  List<Object> get props => [super.props, medicamento];
}
