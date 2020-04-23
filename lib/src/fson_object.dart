
abstract class FSONObject {
  FSONObject({
    this.map,
    this.name,
  });
  String name;
  Map<String,dynamic> map = {};

  dynamic getKey(String key);
}