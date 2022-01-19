class DocumentItem {
  final String type;
  final String label;
  String? id;
  DocumentItem({
    required this.type,
    required this.label,
    this.id,
  });
}
