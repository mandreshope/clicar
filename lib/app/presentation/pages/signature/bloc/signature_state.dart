part of 'signature_bloc.dart';

class SearchContractState extends BaseState {
  final List<Contract> contracts;

  const SearchContractState({
    required this.contracts,
    required Status status,
    required String message,
  }) : super(status: status, message: message);

  @override
  List<Object> get props => [contracts];
}

class SelectedContractState extends BaseState {
  final bool isAccepted;
  final bool isSigned;

  const SelectedContractState({
    required this.isAccepted,
    required Status status,
    required String message,
    required this.isSigned,
  }) : super(status: status, message: message);

  @override
  List<Object> get props => [isAccepted, isSigned];
}
