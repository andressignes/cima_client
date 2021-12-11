import 'package:equatable/equatable.dart';

abstract class DescripcionClinica extends Equatable {
  DescripcionClinica(
      {this.vmp, this.vmpDec, this.vmpp, this.vmppDesc, this.presComerc});

  final String? vmp;
  final String? vmpDec;
  final String? vmpp;
  final String? vmppDesc;
  final int? presComerc;
}
