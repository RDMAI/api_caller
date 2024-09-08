part of 'method_handler_bloc.dart';

sealed class MethodHandlerState extends Equatable {
  const MethodHandlerState();
  
  @override
  List<Object> get props => [];
}

final class MethodHandlerInitial extends MethodHandlerState {}
