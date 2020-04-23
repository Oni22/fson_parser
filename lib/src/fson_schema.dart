
import 'fson_models.dart';

class FSONSchema {
  List<String> requiredKeys = [];
  List<String> keys = [];
  Function(FSONNode) fsonCustomValidate;

  FSONSchema({
    this.requiredKeys,
    this.fsonCustomValidate,
    this.keys,
  });

  bool validate(FSONNode node) {

    if((requiredKeys == null || requiredKeys.isEmpty) && (keys == null || keys.isEmpty)) 
      throw FormatException("FSON_ERROR: FSON node needs at least one key! at ${node.name}");

    if(requiredKeys.isNotEmpty) {
      requiredKeys.forEach((f) {
        if(node.keyValueNodes.any((kv) => kv.key == f) == false) {
          throw FormatException("FSON_ERROR: The key $f is required! at ${node.name}.");
        }
      });
    }
    if(keys.isNotEmpty) {
      node.keyValueNodes.forEach((kv) {
        if(keys.contains(kv.key) == false) {
          throw FormatException("FSON_ERROR: The key ${kv.key} is not supported! at ${node.name}.");
        }
      });
    }
    return true;
  }

}