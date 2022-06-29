import 'package:flutter/material.dart';
import 'package:flutter_apptesting/models/model.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

import 'list_provider.dart';
// import 'package:provider_dynamic_listview/models/model.dart';
// import 'package:provider_dynamic_listview/provider/list_provider.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late GlobalKey<FormState> _formKey;
  late TextEditingController _controller;
  var taskItems;
  int counter = 0;
  late DynamicList listClass;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _formKey = GlobalKey();
    _controller = TextEditingController();
    taskItems = Provider.of<ListProvider>(context, listen: false);
    listClass = DynamicList(taskItems.list);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget buildList(BuildContext context, int index) {
    counter++;
    return Dismissible(
        key: Key(counter.toString()),
        direction: DismissDirection.startToEnd,
        onDismissed: (direction) {
          taskItems.deleteItem(index);
        },
        child: Container(
          margin: EdgeInsets.all(4),
          decoration: BoxDecoration(
              border: Border.all(
                color: Color.fromARGB(255, 177, 91, 197),
                width: 2,
              ),
              borderRadius: BorderRadius.circular(10)),
          child: ListTile(
            title: Text(listClass.list[index].toString()),
            onTap: () {
              Share.share(listClass.list[index].toString());
            },
          ),
        ));
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Text Templates'),
        ),
        body: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: _formKey,
                  child: TextFormField(
                    controller: _controller,
                    onSaved: (val) {
                      taskItems.addItem(val);
                    },
                    validator: (val) {
                      if (val!.length > 0) {
                        return null;
                      } else
                        return 'Add a text first';
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                    }
                  },
                  child: Text('Add'),
                ),
              ),
              Consumer<ListProvider>(builder: (context, provider, listTile) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: listClass.list.length,
                    itemBuilder: buildList,
                  ),
                );
              }),
            ],
          ),
        ));
  }
}

//___________________________________________

class MyPage extends StatefulWidget {
  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('example on share'),
          SizedBox(
            height: 20,
          ),
          MaterialButton(
            elevation: 5.0,
            height: 50,
            minWidth: 150,
            color: Colors.red,
            child: Icon(Icons.share),
            onPressed: () {
              Share.share(" hello ");
            },
          )
        ],
      ),
    );
  }
}
