import 'package:crud_project/main.dart';
import 'package:flutter/material.dart';
import 'package:crud_project/screens/remainder.dart';
import 'package:crud_project/screens/addTask.dart';
import 'package:crud_project/model/Data.dart';
import 'package:crud_project/services/query.dart';
import 'package:crud_project/screens/editTask.dart';

class MyTask extends StatefulWidget {
  const MyTask({super.key});
  State<MyTask> createState() => _MyTaskState();
}

class _MyTaskState extends State<MyTask> {
    late List<Data> _dataList = <Data>[];
  final _query = Query();
  getAllData() async {
    var value = await _query.readAllData();
    _dataList = <Data>[];
    value.forEach((val) {
      setState(() {
        var dataModel = Data();
        dataModel.id = val['id'];
        dataModel.Title = val['Title'];
        dataModel.Category = val['Category'];
        dataModel.Description = val['Description'];
        dataModel.Date = val['Date'];
        dataModel.Time = val['Time'];
        _dataList.add(dataModel);
      });
    });
  }
 @override
  void initState() {
    getAllData();
    super.initState();
  }
  _deleteFormDialog(BuildContext context, Id) {
    return showDialog(
        context: context,
        builder: (param) {
          return AlertDialog(
            title: const Text(
              'Are You Sure to Delete',
              style: TextStyle(color: Colors.blue, fontSize: 20),
            ),
            actions: [
              TextButton(
                  style: TextButton.styleFrom(
                      foregroundColor: Colors.white, // foreground
                      backgroundColor: Colors.blue),
                  onPressed: () async {
                    var result = await _query.deleteData(Id);
                    if (result != null) {
                      Navigator.pop(context);
                      getAllData();
                       var snackBar = SnackBar(content: Text('Deleted Successfully'));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
                  child: const Text('Delete')),
              TextButton(
                  style: TextButton.styleFrom(
                      foregroundColor: Colors.white, // foreground
                      backgroundColor: Colors.blue),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Close'))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black,
          title: const Text(
            'Tasks',
            style: TextStyle(fontSize: 25, color: Colors.white),
          ),
        ),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MyNotesPage()));
                    },
                    child: const Text(
                      'Notes',
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    )),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MyRemainder()));
                    },
                    child: const Text(
                      'Remainder',
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    )),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MyTask()));
                    },
                    child: const Text(
                      'Task',
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    )),
              ],
            ),
            Expanded(
              child: SizedBox(
                height: 200,
                child: ListView.builder(
                  itemCount: _dataList.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        onTap: () {},
                        leading: const Icon(Icons.alarm),
                        title: Text(_dataList[index].Title ?? ' '),
                        subtitle: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(_dataList[index].Date ?? ' '),
                            Text(_dataList[index].Time ?? ' ')
                          ],
                        ),
        
                        trailing:
                            Row(mainAxisSize: MainAxisSize.min, children: [
                          IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => EditTask(
                                              data: _dataList[index],
                                            ))).then((data) {
                                  if (data != null) {
                                    getAllData();
                                     var snackBar = SnackBar(content: Text('Updated Successfully'));
                                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                  }
                                });
                              },
                              icon: const Icon(
                                Icons.edit,
                                color: Colors.blue,
                              )),
                          IconButton(
                              onPressed: () {
                                _deleteFormDialog(context, _dataList[index].id);
                              },
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.blue,
                              ))
                        ]),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          onPressed: () {
            Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const AddTask()))
                .then((data) {
              if (data != null) {
                getAllData();
                 var snackBar = SnackBar(content: Text('data Added Successfully'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
            });
          },
          child: const Icon(Icons.add, color: Colors.black),
        ),
      );  }
}
