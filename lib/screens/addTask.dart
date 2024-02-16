import 'package:crud_project/model/Data.dart';
import 'package:flutter/material.dart';
// import 'package:crud_project/screens/addTask.dart';
import 'package:crud_project/services/query.dart';

class AddTask extends StatefulWidget {
  const AddTask({Key? key}) : super(key: key);

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  var _titleController = TextEditingController();
  var _descriptionController = TextEditingController();
  var _categoryController = TextEditingController();
  var _dateController = TextEditingController();
  var _timeController = TextEditingController();
  var query = Query();
  // bool Task_status = false;
  // bool Remainder_status = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: SingleChildScrollView(
        child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: _titleController,
                  decoration: const InputDecoration(
                      border:  OutlineInputBorder(),
                      hintText: 'Enter Task',
                      labelText: 'Task'),
                ),
                const SizedBox(
                  height: 40,
                ),
                 TextField(
                  controller: _categoryController,
                  decoration: const InputDecoration(
                      border:  OutlineInputBorder(),
                      hintText: 'Remainder / Task',
                      labelText: 'Category'),
                ),
                const SizedBox(
                  height: 40,
                ),
                // const Text(
                //   'Category',
                //   style: TextStyle(fontSize: 15),
                // ),
                // const SizedBox(
                //   height: 20,
                // ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //   children: [
                //     Checkbox(
                //       value: Task_status,
                //       onChanged: (value) {
                //         setState(() {
                //           Task_status = value!;
                //         });
                //       },
                //     ),
                //     const Text("Task"),
                //     Checkbox(
                //       value: Remainder_status,
                //       onChanged: (value) {
                //         setState(() {
                //           Remainder_status = value!;
                //         });
                //       },
                //     ),
                //     const Text("Remainder"),
                //   ],
                // ),
                const SizedBox(
                  height: 40,
                ),
                TextField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter Description',
                      labelText: 'Description'),
                ),
                const SizedBox(
                  height: 40,
                ),
                TextField(
                  controller : _dateController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'DD-MM-YYYY',
                      labelText: 'Due Date'),
                ),
                const SizedBox(
                  height: 40,
                ),
                TextField(
                  controller : _timeController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'HH-MM  AM/PM',
                      labelText: 'Due Time'),
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.teal,
                        ),
                        onPressed: () async{
                          setState(() {
                            
                          });
                          // if(Task_status == true){
                            var _data = Data();
                            _data.Title = _titleController.text;
                            _data.Category = _categoryController.text;
                            _data.Description = _descriptionController.text;
                            _data.Date = _dateController.text;
                            _data.Time = _timeController.text;
                            var result = await query.SaveData(_data);
                            print(result);
                            Navigator.pop(context,result);
                          // }
                          // else{
                          //   var _data = Data();
                          //   _data.Title = _titleController.text;
                          //   _data.Category = 'Remainder';
                          //   _data.Description = _descriptionController.text;
                          //   _data.Date = _dateController.text;
                          //   _data.Time = _timeController.text;
                          //   var result = await query.SaveData(_data);
                          //   Navigator.pop(context,result);

                          // }
                        },
                        child: const Text(
                          'Save',
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.teal,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'Back',
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
                    ])
              ],
            )),
      ),
    ));
  }
}
