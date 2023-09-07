class CurrencyConvertModel {
  final double difference;
  final double rate;

  CurrencyConvertModel({
    required this.difference,
    required this.rate,
  });

  factory CurrencyConvertModel.fromJSON({required Map<String, dynamic> json}) {
    return CurrencyConvertModel(
      difference: json["result"] == null ? 0.0 : json["result"].toDouble(),
      rate:
          json["info"]["rate"] == null ? 0.0 : json["info"]["rate"].toDouble(),
    );
  }
}
