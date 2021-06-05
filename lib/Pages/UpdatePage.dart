


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider_and_dio/ViwevModel/ViewModel.dart';

class UpdatePage extends StatefulWidget {
  @override
  _UpdatePageState createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  HomeViewModel model=HomeViewModel();
  bool isLoading = false;
  final titleController =new TextEditingController();
  final bodyController =new TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isLoading=false;
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 70),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 5),
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    height: 37,
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(10)
                    ),child: TextField(
                    controller: titleController,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Title",
                        hintStyle: TextStyle(color: Colors.white,fontSize: 16)
                    ),
                  ),
                  ),SizedBox(height: 10,),
                  Container(
                    padding: EdgeInsets.only(left: 5),
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    height:37,
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(10)
                    ),child: TextField(
                    controller: bodyController,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Body",
                        hintStyle: TextStyle(color: Colors.white,fontSize: 16)
                    ),
                  ),
                  ),
                  SizedBox(height: 50,),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: 50),
                    height: 60,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10)
                    ),child: FlatButton(
                    splashColor: Colors.blue,
                    onPressed: (){
                      model.sendApiToServer(titleController, bodyController, context);
                      Navigator.pop(context);

                    },child: Text("update  it",style: TextStyle(
                      color: Colors.grey,fontSize: 16
                  ),),

                  ),
                  )



                ],),),
          ),model.isLoading?Center(child: CircularProgressIndicator(),):SizedBox.shrink()
        ],
      )

    );

  }

}

