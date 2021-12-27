part of 'accept_contract_bloc.dart';

class AcceptContractState extends BaseState {
  final bool isAccepted;

  const AcceptContractState({
    required this.isAccepted,
    required Status status,
    required String message,
  }) : super(status: status, message: message);

  @override
  List<Object> get props => [isAccepted];
}
