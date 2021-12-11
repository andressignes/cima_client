import 'package:equatable/equatable.dart';

abstract class Estado extends Equatable {
  Estado({this.aut, this.susp, this.rev});

  final int? aut;
  final int? susp;
  final int? rev;
}
