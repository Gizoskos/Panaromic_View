import 'package:equatable/equatable.dart';

abstract class ThetaEvent extends Equatable {
  const ThetaEvent();

  @override
  List<Object> get props => [];
}

class IncrementJpgIndexEvent extends ThetaEvent {}

class ZeroJpgIndexEvent extends ThetaEvent {}
