part of 'accept_contract_bloc.dart';

class AcceptContractEvent extends Equatable {
  final bool isAccepted;

  const AcceptContractEvent({
    required this.isAccepted,
  });

  @override
  List<Object> get props => [isAccepted];
}
