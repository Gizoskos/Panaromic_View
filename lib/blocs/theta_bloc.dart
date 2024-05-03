import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_application_1/blocs/theta_event.dart';
import 'package:flutter_application_1/blocs/theta_state.dart';

class ThetaBloc extends Bloc<ThetaEvent, ThetaState> {
  ThetaBloc() : super(ThetaState.initial()) {
    on<IncrementJpgIndexEvent>((event, emit) async {
      emit(state.copyWith(jpegIndex: state.jpegIndex + 1));
    });
  }
}
