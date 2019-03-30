import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class ListWidget extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => new _ListState();

}

class _ListState extends State<ListWidget> {

  List data =[];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: Text("List Demo"), centerTitle: true,),
      body: getListView(),
    );
  }

  void loadData() async {
    try {
      http.Response response = await http.get(
          "https://jsonplaceholder.typicode.com/posts");
      setState(() {
        data = json.decode(response.body);
      });
      print(response);
    } catch (e) {
      print(e);
    }
  }

  ListView getListView() {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (BuildContext context, int position){
        return getRow(position);
      },
    );
  }

  Widget getRow(int i) {
    return Padding(padding: EdgeInsets.all(10.0), child: Text("Row ${data[i]["title"]}"));
  }

}