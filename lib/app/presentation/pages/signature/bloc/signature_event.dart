part of 'signature_bloc.dart';

abstract class SignatureEvent extends Equatable {
  const SignatureEvent();
}

class SearchContractEvent extends SignatureEvent {
  final String keyWord;

  const SearchContractEvent({required this.keyWord});

  @override
  List<Object> get props => [keyWord];
}
