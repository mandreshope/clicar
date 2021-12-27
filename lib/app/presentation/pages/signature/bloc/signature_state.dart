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
