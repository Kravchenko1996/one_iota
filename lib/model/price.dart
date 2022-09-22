class Price {
  Price({
    required this.amount,
    required this.currency,
  });

  String amount;
  String currency;

  factory Price.fromJson(Map<String, dynamic> json) {
    return Price(
      amount: json['amount'],
      currency: json['currency'],
    );
  }
}
