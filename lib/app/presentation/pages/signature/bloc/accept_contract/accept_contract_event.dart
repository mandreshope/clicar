part of 'accept_contract_bloc.dart';


abstract class AcceptEvent extends Equatable {
  const AcceptEvent();
}
class AcceptContractEvent extends AcceptEvent {
  final bool isAccepted;

  const AcceptContractEvent({
    required this.isAccepted,
  });

  @override
  List<Object> get props => [isAccepted];
}

class AcceptParapheEvent extends AcceptEvent {
  final bool isAccepted;

  const AcceptParapheEvent({
    required this.isAccepted,
  });

  @override
  List<Object> get props => [isAccepted];
}
