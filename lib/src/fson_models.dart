

class FSONNode {

  FSONNode({
    this.name,
  });

  String name;
  Set<FSONKeyValueNode> keyValueNodes = Set();
}

class FSONKeyValueNode {
  FSONKeyValueNode({this.key});
  String key;
  String value;
  List<String> arrayList = [];
}