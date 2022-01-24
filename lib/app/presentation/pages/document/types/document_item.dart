class DocumentItem {
  final String type;
  final String label;
  String? id;
  DocumentItem({
    required this.type,
    required this.label,
    this.id,
  });

  DocumentItem copyWith({
    String? type,
    String? label,
    String? id,
  }) {
    return DocumentItem(
      type: type ?? this.type,
      label: label ?? this.label,
      id: id ?? this.id,
    );
  }
}
