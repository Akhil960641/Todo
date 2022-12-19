import 'package:Todo/Constant.dart';
import 'package:Todo/msgList.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  TextEditingController txtTod = TextEditingController();

  @override
  Widget build(BuildContext context) {
    getTodo();
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      // backgroundColor: Colors.grey,
      appBar: AppBar(
          backgroundColor: Colors.yellow,
          title: Text(
            'Note',
          )),
      body: Column(
        children: [
          Expanded(
            flex: 7,
            child: ValueListenableBuilder(
              valueListenable: TodoListNotifier,
              builder: (BuildContext ctx,List<Todo> TodoList,Widget? child) {
              return ListView.separated(
                  itemBuilder: (context, index) {
                    final data=TodoList[index];
                    return ListTile(
                      tileColor: Colors.blue[100],
                      title: Text(data.TodoList)
                    );
                  },
                  separatorBuilder: (context, index) => Divider(
                        height: 5,
                      ),
                  itemCount: TodoList.length);
  }
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  // color: Colors.yellow,
                  height: size.height * .07,
                  width: size.width * .8,
                  decoration: BoxDecoration(

                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,

                  ),
                  child: Center(
                    child: TextFormField(
                      controller: txtTod,

                      style: TextStyle(color:Colors.black  ),
                      decoration: InputDecoration(

                           enabledBorder: InputBorder.none,
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.transparent,
                          )),
                          hintText: 'message',



                          hintStyle: TextStyle(fontSize: 20,color: Colors.black38),
                          prefixIcon:
                              Icon(Icons.sticky_note_2, color: Colors.black),
                          border: OutlineInputBorder()),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    // final _text  = txtTod.text.trim();
                    // if(_text.isEmpty){
                    //   return;
                    // }
                    final _data = Todo(TodoList:txtTod.text);
                    if(txtTod.text.isNotEmpty)
                    addTodo(_data);
                   txtTod.clear();
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.green,
                      radius: 30,
                      child: Icon(
                        Icons.send,
                         size: 30,
                        color: Colors.white,
                        //size: size.height * .07,
                      )
                      ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
//
//   Future<void> addButton()async{
//     final _todo =txtTod.text.trim();
//     if(txtTod.text.isNotEmpty){
//        ;
//     }
//     final _TodoList=Todo(TodoList: _todo);
//
// addTodo(_TodoList);
//   }


}
