class PdfTitle {
  final String id;
  final String title;

  PdfTitle({
    required this.id,
    required this.title,
  });

  factory PdfTitle.fromJson(Map<String, dynamic> json) {
    return PdfTitle(
      id: json['id'],
      title: json['title'],
    );
  }
}