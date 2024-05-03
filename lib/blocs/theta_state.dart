// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class ThetaState extends Equatable {
  final String message;
  final int jpegIndex;

  const ThetaState({required this.message, this.jpegIndex = 1});

  factory ThetaState.initial() =>
      const ThetaState(message: "Response from Camera");

  @override
  List<dynamic> get props => [message, jpegIndex];

  @override
  bool get stringify => true;

  ThetaState copyWith(
      {String? message,
      String? fileUrl,
      String? cameraState,
      String? id,
      bool? finishedSaving,
      int? jpegIndex}) {
    return ThetaState(
        message: message ?? this.message,
        jpegIndex: jpegIndex ?? this.jpegIndex);
  }
}
