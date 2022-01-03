part of 'supply_problems_bloc.dart';

abstract class SupplyProblemsEvent extends Equatable {
  const SupplyProblemsEvent();
}

class GetActive extends SupplyProblemsEvent {
  const GetActive();

  @override
  List<Object?> get props => [];
}
