part of 'search_medication_result_bloc.dart';

class SearchMedicationResultEvent extends Equatable {
  const SearchMedicationResultEvent();

  @override
  List<Object?> get props => [];
}

class Search extends SearchMedicationResultEvent {
  const Search({this.params});

  final Map<String, String>? params;

  @override
  List<Object?> get props => [params];
}
