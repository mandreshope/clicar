class BilledInfo {
  final String label;
  final double amount;
  bool isSelected;
  BilledInfo({
    required this.label,
    required this.amount,
    this.isSelected = false,
  });

  BilledInfo copyWith({
    String? label,
    double? amount,
    bool? isSelected,
  }) {
    return BilledInfo(
      label: label ?? this.label,
      amount: amount ?? this.amount,
      isSelected: isSelected ?? this.isSelected,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'label': label,
      'amount': amount,
    };
  }
}
