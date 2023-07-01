interface class IFailures {
  final String message;
  final StackTrace? stackTrace;

  IFailures({
    required this.message,
    this.stackTrace,
  });
}

class ShoppingInformationFailure extends IFailures {
  ShoppingInformationFailure({
    required super.message,
    super.stackTrace,
  });
}

class ShoppinInformationSuccess extends IFailures {
  ShoppinInformationSuccess({
    required super.message,
    super.stackTrace,
  });
}
