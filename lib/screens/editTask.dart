import 'package:crud_project/model/Data.dart';
import 'package:crud_project/services/query.dart';
import 'package:flutter/material.dart';

class EditTask extends StatefulWidget {
  final Data data;
  
  const EditTask({super.key,required this.data});

  @override
  State<EditTask> createState() => _EditTaskState();
}

class _EditTaskState extends State<EditTask> {
  var _titleController = TextEditingController();
  var _descriptionController = TextEditingController();
  var _categoryController = TextEditingController();
  var _dateController = TextEditingController();
  var _timeController = TextEditingController();
  var _id = null;
  // var Task_status = false;
  // var Remainder_status = false;

  var _query = Query();

  @override
  void initState(){
    setState(() {
      _id = widget.data.id;
      _titleController.text = widget.data.Title ?? ' ';
      _descriptionController.text = widget.data.Description ?? ' ';
      _categoryController.text = widget.data.Category ?? ' ';
      _dateController.text = widget.data.Date ?? ' ';
      _timeController.text = widget.data.Time ?? ' ';
    });
    super.initState();
  }
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
                      hintText: 'task/Remainder',
                      labelText: 'Category'),
                ),
                // const SizedBox(
                //   height: 40,
                // ),
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
                            _data.id = _id;
                            _data.Title = _titleController.text;
                            _data.Category = _categoryController.text;
                            _data.Description = _descriptionController.text;
                            _data.Date = _dateController.text;
                            _data.Time = _timeController.text;
                            var result = await _query.UpdateData(_data);
                            print(result);
                            // ignore: use_build_context_synchronously
                            Navigator.pop(context,result);
                          // }
                          // else{
                          //   var data0 = Data();
                          //   data0.Title = _titleController.text;
                          //   data0.Category = 'Remainder';
                          //   data0.Description = _descriptionController.text;
                          //   data0.Date = _dateController.text;
                          //   data0.Time = _timeController.text;
                          //   var result = await _query.UpdateData(data0);
                          //   // ignore: use_build_context_synchronously
                          //   Navigator.pop(context,result);

                          // }
                        },
                        child: const Text(
                          'Update',
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