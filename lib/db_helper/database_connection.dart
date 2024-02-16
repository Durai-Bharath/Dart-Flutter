import 'package:crud_project/model/Data.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';


class DatabaseConnection{
  Future<Database> setDatabase() async{
    var directory = await getApplicationDocumentsDirectory();
    var path = join(directory.path , 'crud.db');
    print(path);
    var databse = await openDatabase(path,version: 1,onCreate: _createDatabase);
    return databse;
  }
  Future<void> _createDatabase(Database database,int version) async{
    String sql = "CREATE TABLE  data (id INTEGER PRIMARY KEY,Title TEXT,Category TEXT,Description TEXT,Date TEXT,Time TEXT);";
    await database.execute(sql);
  }
}