class GalleryItem {
  final String name;
  final int uid;
  final int docType;
  final String imageUrl;

  GalleryItem({
    required this.name,
    required this.uid,
    required this.docType,
    required this.imageUrl,
  });

  factory GalleryItem.fromJson(Map<String, dynamic> json) {
    return GalleryItem(
      name: json['_name'] ?? '',
      uid: json['_uid'] ?? 0,
      docType: json['_docType'] ?? 0,
      imageUrl: json['_url'] ?? '',
    );
  }
}
