import 'package:equatable/equatable.dart';

class PasswordState extends Equatable {
  const PasswordState();

  @override
  List<Object> get props => [];
}

class PasswordStateInitial extends PasswordState {
  const PasswordStateInitial();

  @override
  List<Object> get props => [];
}

class PasswordStateLoading extends PasswordState {
  const PasswordStateLoading();

  @override
  List<Object> get props => [];
}

class PasswordStateSuccess extends PasswordState {
  const PasswordStateSuccess();

  @override
  List<Object> get props => [];
}

class PasswordStateError extends PasswordState {
  final String error;

  const PasswordStateError(this.error);

  @override
  List<Object> get props => [error];
}
