part of 'log_in_cubit.dart';

@immutable
abstract class LogInState {}

class LogInInitial extends LogInState {}

class TryLogIn extends LogInState {}

class SuccessLogIn extends LogInState {}

class FailureLogIn extends LogInState {}
