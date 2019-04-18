import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:m_flutter/net/HttpManager.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ListWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _ListState();
}

class _ListState extends State<ListWidget> {
  List data = [];
  var _refreshController = new RefreshController();

  @override
  void initState() {
    super.initState();
    loadData(true);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("List Demo"),
          centerTitle: true,
        ),
        body: new SmartRefresher(
            enablePullDown: true,
            enablePullUp: true,
            onRefresh: _onRefresh,
            controller: _refreshController,
            child: getListView()));
  }

  void _onRefresh(bool up) {
    loadData(up);
  }

  void loadData(bool up) async {
    try {
      Response response = await HttpManager.getDio("")
          .get("https://jsonplaceholder.typicode.com/posts");
      print(response.data.toString());
      _refreshController.sendBack(up, RefreshStatus.completed);
      setState(() {
        data = response.data;
      });
    } catch (e) {
      _refreshController.sendBack(up, RefreshStatus.failed);
      print(e);
    }
  }

  ListView getListView() {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (BuildContext context, int position) {
        return getRow(position);
      },
    );
  }

  Widget getRow(int i) {
    return Padding(
        padding: EdgeInsets.all(10.0), child: Text("Row ${data[i]["title"]}"));
  }
}
