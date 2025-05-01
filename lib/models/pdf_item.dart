class PdfItem {
  final String id;
  final String name;
  final String file;
  final String collectionId;
  final String title;
  final String link;

  PdfItem({
    required this.id,
    required this.name,
    required this.file,
    required this.collectionId,
    required this.title,
    required this.link,
  });

  factory PdfItem.fromJson(Map<String, dynamic> json) {
    return PdfItem(
      id: json['id'],
      name: json['name'],
      file: 'https://pocketbase-5i4fn3.chbk.app/api/files/${json['collectionId']}/${json['id']}/${json['file']}',
      collectionId: json['collectionId'],
      title: json['title'],
      link: json['link'],
    );
  }
}