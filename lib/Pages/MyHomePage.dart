


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_and_dio/Views/view.dart';
import 'package:provider_and_dio/ViwevModel/ViewModel.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  HomeViewModel viewModel = HomeViewModel();

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
            // Respond to button press
          },
          child: Icon(Icons.add),
        ));
  }

}
