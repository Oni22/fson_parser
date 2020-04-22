
import 'fson_models.dart';

class FSONSchema {
  List<String> requiredKeys;
  List<String> keys;
  Function(FSONNode) fsonCustomValidate;

  FSONSchema({
    this.requiredKeys,
    this.fsonCustomValidate,
    this.keys,
  });

}