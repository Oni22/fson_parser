
class FSONValidatorMessage {
  String message;
  bool isValid;
  FSONValidatorMessage({this.isValid,this.message});
}

class FSONValidator {

  static FSONValidatorMessage validateKey(String key) {
    if(key.contains("\""))
      return FSONValidatorMessage(isValid: false, message: "FSON_ERROR: \" are not allowed in key names!");
    else 
      return FSONValidatorMessage(isValid: true, message: "");
  }
  
  static FSONValidatorMessage validateStringId(String name) {
    if(name.contains(RegExp(r"[^a-z^A-Z^0-9\^_]+"))) 
      return FSONValidatorMessage(isValid: false, message: "FSON_ERROR: Id name has unsupported characters. Only underscores are allowed in id names!");
    else 
      return FSONValidatorMessage(isValid: true, message: "");
  }

  static FSONValidatorMessage validateText(String text) {
    //RegExp(r"\[(.*?)\]"))
    if(text.startsWith("[") && text.endsWith("]")) {
      var rawPlurals = text.replaceFirst("[", "").replaceFirst("]", "");
      if(rawPlurals.contains("[") || rawPlurals.contains("]")) {
        return FSONValidatorMessage(isValid: false, message: "FSON_ERROR: Plurals inside plurals are not allowed!");
      }
      var validatedPlurals = rawPlurals.trim().split(",");
      //"[^"]*"
      for(var p in validatedPlurals) {
        if(!p.startsWith("\"") || !p.endsWith("\"")) {
          return FSONValidatorMessage(isValid: false, message: "FSON_ERROR: Text must be a string!");
        } else {
          var r = p.replaceAll(RegExp(r"^.|.$"),"");
          if(r.contains("\"")) { //NOT FINAL
            return FSONValidatorMessage(isValid: false,message:"FSON_ERROR: Please escape with \\""\" inside a string");
          }    
        }
      }
      return FSONValidatorMessage(isValid: true,message: "");
    }
    return FSONValidatorMessage(isValid: text.startsWith("\"") && text.endsWith("\"") ? true : false,message: "");
  }

// bool validateISO6391(String code) {
//   var lang = RService().langCodes.firstWhere((l) => l == code,orElse: () => null);
//   return lang != null;
// }

}
