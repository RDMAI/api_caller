import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'method_handler_event.dart';
part 'method_handler_state.dart';

class MethodHandlerBloc extends Bloc<MethodHandlerEvent, MethodHandlerState> {
  MethodHandlerBloc() : super(MethodHandlerInitial()) {
    on<MethodHandlerEvent>();
  }
}
