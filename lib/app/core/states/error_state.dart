import 'package:clicar/app/core/states/base_state.dart';

class ErrorState extends BaseState {
  const ErrorState({
    required Status status,
    required String message,
  }) : super(
          status: status,
          message: message,
        );
}
