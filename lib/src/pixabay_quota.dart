class Quota {
  static const int _requestsPerHalfHour = 20000;

  int _remainingRequestsPerHalfHour;
  int _remainingSecondsBeforeReset;

  int get getRequestsPerMonth => _requestsPerHalfHour;

  int get getRemainingRequestsPerMonth => _remainingRequestsPerHalfHour;

  int get getRemainingSecondsBeforeReset => _remainingSecondsBeforeReset;

  static Quota _singleton;

  Quota._internal(
      {int remainingRequestsPerMonth = _requestsPerHalfHour,
      int remainingSecondsBeforeReset = 0})
      : _remainingRequestsPerHalfHour = remainingRequestsPerMonth,
        _remainingSecondsBeforeReset = remainingSecondsBeforeReset;

  factory Quota(
      {int remainingRequestsPerMonth = _requestsPerHalfHour,
      int remainingSecondsBeforeReset = 0}) {
    _singleton ??= new Quota._internal(
        remainingRequestsPerMonth: remainingRequestsPerMonth);
    _singleton._remainingRequestsPerHalfHour = remainingRequestsPerMonth;
    _singleton._remainingSecondsBeforeReset = remainingSecondsBeforeReset;
    return _singleton;
  }

  @override
  String toString() =>
      'Requests Per Half Hour: $_remainingRequestsPerHalfHour\\$_requestsPerHalfHour';
}
