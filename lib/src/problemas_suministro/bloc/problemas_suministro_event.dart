part of 'problemas_suministro_bloc.dart';

abstract class ProblemasSuministroEvent extends Equatable {
  const ProblemasSuministroEvent();
}

class GetActivos extends ProblemasSuministroEvent {
  const GetActivos();

  @override
  List<Object?> get props => [];
}
