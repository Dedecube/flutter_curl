part of 'client.dart';

enum _BodyType {
  raw,
  file,
  string,
  form,
  multipart,
}

class RequestBody {
  _BodyType? type;
  late List<int> raw;
  late String string;
  late String file;
  Map<String, dynamic>? form;
  late List<Multipart> multipart;

  RequestBody._();

  factory RequestBody.raw(List<int> data) {
    return RequestBody._()
      ..type = _BodyType.raw
      ..raw = data;
  }

  factory RequestBody.file(String path) {
    return RequestBody._()
      ..type = _BodyType.raw
      ..file = path;
  }

  factory RequestBody.string(String content) {
    return RequestBody._()
      ..type = _BodyType.string
      ..string = content;
  }

  factory RequestBody.form(Map<String, String> params) {
    return RequestBody._()
      ..type = _BodyType.form
      ..form = params;
  }

  factory RequestBody.multipart(List<Multipart> data) {
    return RequestBody._()
      ..type = _BodyType.multipart
      ..multipart = data;
  }
}

enum MultipartType {
  raw,
  file,
}

class Multipart {
  String? _name;
  String? _data;
  String? _filename;
  String? _filepath;
  MultipartType? _type;

  Multipart({String? name, String? data}) {
    _name = name;
    _data = data;
    _type = MultipartType.raw;
  }

  factory Multipart.file({String? name, String? path, String? filename}) {
    return Multipart(name: name)
      .._filename = filename
      .._filepath = path
      .._type = MultipartType.file;
  }
}
