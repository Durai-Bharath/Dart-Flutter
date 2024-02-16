
class Data {
  int? id;
  String? Title;
  String? Category;
  String? Description;
  String? Date;
  String? Time;

  dataMap() {
    var mapping = Map<String, dynamic>();
    mapping['id'] = id ?? null;
    mapping['Title'] = Title!;
    mapping['Category'] = Category!;
    mapping['Description'] = Description!;
    mapping['Date'] = Date!;
    mapping['Time'] = Time!;
    return mapping;
  }
}
