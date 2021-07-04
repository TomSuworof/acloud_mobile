class UserFile {
  double id;
  String author;
  String filename;
  List<int> content;
  bool canBeDownloadedPublicly;

  UserFile({
    this.id,
    this.author,
    this.filename,
    this.content,
    this.canBeDownloadedPublicly
  });

  UserFile.fromJson(Map<String, Object> jsonString) {
    this.id = jsonString['id'];
    this.author = jsonString['author'];
    this.filename = jsonString['filename'];
    this.content = jsonString['content'];
    this.canBeDownloadedPublicly = jsonString['canBeDownloadedPublicly'];
  }
}