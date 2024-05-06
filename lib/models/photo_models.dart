class PhotoModel {
  String? url;
  SrcModel? src;

  PhotoModel({this.url, this.src});

  factory PhotoModel.fromMap(Map<String, dynamic> parsedJson) {
    return PhotoModel(
      url: parsedJson['url'],
      src: SrcModel.fromMap(parsedJson['src']),
    );
  }
}

class SrcModel {
  String? portrait;
  String? landscape;
  String? large;
  String? medium;

  SrcModel({this.portrait, this.landscape, this.large, this.medium});

  factory SrcModel.fromMap(Map<String, dynamic> srcJson) {
    return SrcModel(
      portrait: srcJson['portrait'],
      landscape: srcJson['landscape'],
      large: srcJson['large'],
      medium: srcJson['medium'],
    );
  }
}
