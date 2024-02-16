
// import 'dart:async';
import 'package:crud_project/db_helper/crud.dart';
import 'package:crud_project/model/Data.dart';


class Query
{
  late Repository _repository;
  Query(){
    _repository = Repository();
  }
  //Save Data
  SaveData(Data data) async{
    return await _repository.insertData('data', data.dataMap());
  }
  //Read All Data
  readAllData() async{
    return await _repository.readData('data');
  }
  //Edit Data
  UpdateData(Data data) async{
    return await _repository.updateData('data', data.dataMap());
  }

  deleteData(Id) async {
    return await _repository.deleteDataById('data', Id);
  }

}