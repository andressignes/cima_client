part of 'problemas_suministro_bloc.dart';

abstract class ProblemasSuministroState extends Equatable {
  const ProblemasSuministroState();
}

class ProblemasSuministroInitial extends ProblemasSuministroState {
  const ProblemasSuministroInitial();

  @override
  List<Object> get props => [];
}

class ProblemasSuministroLoading extends ProblemasSuministroState {
  const ProblemasSuministroLoading();

  @override
  List<Object> get props => [];
}

class ProblemasSuministroError extends ProblemasSuministroState {
  const ProblemasSuministroError();

  @override
  List<Object?> get props => [];
}

class ProblemasSuministroLoaded extends ProblemasSuministroState {
  const ProblemasSuministroLoaded(this.problemasSuministro);

  final List<ProblemaSuministro> problemasSuministro;

  @override
  List<Object> get props => [problemasSuministro];
}
