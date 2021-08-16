import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Dog.dart';
import 'DogDao.dart';

var dogDao = new DogDao();
var database;
void main() async{
  database = dogDao.openDb();
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  //pair programming -- driver, navigator
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'add dog',
      home: Scaffold(
        appBar: AppBar(title: Text('insert dog'),),
        body: AddDogForm(
        ),

      ),
    );
  }
}

class AddDogForm extends StatefulWidget {
  const AddDogForm({Key? key}) : super(key: key);

  @override
  _AddDogFormState createState() => _AddDogFormState();
}


class _AddDogFormState extends State<AddDogForm> {
  int id = 0;
  int age = 0;
  String name = '';
  var idController = TextEditingController();
  var nameController = TextEditingController();
  var ageController = TextEditingController();

  void _addDog() async{
    setState(() {
      id = int.parse(idController.text);
      age = int.parse(ageController.text);
      name = nameController.text;
    });
    var dog = Dog(id:id,name:name,age: age);
    await dogDao.insertDog(dog);
  }
  Widget _getDogs()=>  Scaffold(
      appBar: AppBar(
        title: Text('List Of Employees'),
  ),
          body: FutureBuilder<List>(
            future: dogDao.getDogs(),
              builder: (context, snapshot) {
                return snapshot.hasData
               ? ListView.builder(
                 itemCount: snapshot.data!.length,
                itemBuilder: (_, int position) {
                  final item = snapshot.data![position];
  //get your item data here ...
                        return Card(
                             child: ListTile(
                            title: Text(
                              "Employee Name: " + snapshot.data![position].row[1]),
                            ),
                          );
  }               ,
    )
                :         Center(
                  child: CircularProgressIndicator(),
  );
  },
  ),
  );

  @override
  Widget build(BuildContext context) {

    return Container (
        child:Form(
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: idController,
                decoration: InputDecoration(labelText: 'id'),
              ),
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'name'),
              ),
              TextFormField(
                controller: ageController,
                decoration: InputDecoration(labelText: 'age'),
              ),
              RaisedButton(onPressed: _addDog, child: Text('add dog'),),
              RaisedButton(onPressed: _getDogs, child: Text('get dog'),),
            ],
          ),
        ),
    );
  }
}