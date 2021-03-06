


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:provider_and_dio/Model/viewmodel.dart';
import 'package:provider_and_dio/Views/view.dart';
import 'package:provider_and_dio/ViwevModel/ViewModel.dart';

import 'DetailPage.dart';
import 'UpdatePage.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  HomeViewModel viewModel = HomeViewModel();
  Future openDetail() async{
    Map results = await Navigator.of(context).push(new MaterialPageRoute(
        builder: (BuildContext context){
          return new DetailPage();
        }
    ));
    if(results != null && results.containsKey("data")){
      print(results['data']);
      viewModel.apiPostList();
    }
  }
   Future openDetails() async{
    Map results = await Navigator.of(context).push(new MaterialPageRoute(
        builder: (BuildContext context){
          return new UpdatePage();
        }
    ));
    if(results != null && results.containsKey("data")){
      print(results['data']);
      viewModel.apiPostList();
    }
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.apiPostList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Provider"),
          centerTitle: true,
        ),
        body:Consumer<HomeViewModel>(
        builder: (ctx, model, index) =>
        Stack(
        children: [
        ListView.builder(
        itemCount: viewModel.items.length,
        itemBuilder: (ctx, index) {
        return itemOfPost(viewModel, viewModel.items[index]);
        },
        ),
        viewModel.isLoading
        ? Center(
        child: CircularProgressIndicator(),
        )
            : SizedBox.shrink(),
        ],
        ) ),

        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          onPressed: () {
            openDetail();
          },
          child: Icon(Icons.add),
        ));
  }
  Widget itemOfPost(HomeViewModel viewModel, Posting post) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      child: Container(
        padding: EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              post.title.toUpperCase(),
              style:
              TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5,
            ),
            Text(post.body),
          ],
        ),
      ),
      actions: <Widget>[
        IconSlideAction(
          caption: 'Update',
          color: Colors.indigo,
          icon: Icons.edit,
          onTap: () {
            openDetails();
          },
        ),
      ],
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: 'Delete',
          color: Colors.red,
          icon: Icons.delete,
          onTap: () {
            viewModel.apiPostDelete(post).then((value) => {
              if(value) viewModel.apiPostList(),
            });
          },
        ),
      ],
    );
  }
}
