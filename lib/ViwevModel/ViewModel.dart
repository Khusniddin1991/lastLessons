import 'package:flutter/cupertino.dart';
import 'package:provider_and_dio/Controller/Another%20Nertwork.dart';
import 'package:provider_and_dio/Controller/Network.dart';
import 'package:provider_and_dio/Model/viewmodel.dart';

class HomeViewModel extends ChangeNotifier {
  bool isLoading = false;
  List<Posting> items=List<Posting>();

  Future apiPostList() async {
  isLoading = true;
  notifyListeners();

  var response = await Networks().GET(Networks.API_LIST);
  if (response != null) {
     print(response);
  items = response;
  print(items);
  } else {
  items = new List();
  }

  isLoading = false;
  notifyListeners();
  }

  Future<bool> apiPostDelete(Posting post) async {
  isLoading = true;
  notifyListeners();

  var response = Network.DEL(Network.API_DELETE + post.id.toString(), Network.paramsEmpty());

  isLoading = false;
  notifyListeners();
  return response != null;
  }
  void sendApiToServer(TextEditingController titleController,TextEditingController bodyController,BuildContext context)async {

    String title=titleController.text.trim();
    String body=bodyController.text.trim();
    var time=DateTime.now().microsecond;
    print(time);
    print(body);
    if(title.isEmpty&&body.isEmpty){
      return;
    }
    Posting posts=Posting(title: title,body:body ,userId:1);
    add(posts,context);
  }
  void add(Posting post,BuildContext context)async {
    isLoading=true;
    var res=await Network.POST(Network.API_CREATE, Network.paramsCreate(post));
    print(res);
    try{
      if(res==null){
        isLoading=false;
        Navigator.of(context).pop({"data":"the result"});
      }
    }catch(e){
      print(e);
    }

  }
  void sendApiToForUpdate(TextEditingController titleController,TextEditingController bodyController,BuildContext context)async {

    String title=titleController.text.trim();
    String body=bodyController.text.trim();
    var time=DateTime.now().microsecond;
    print(time);
    print(body);
    if(title.isEmpty&&body.isEmpty){
      return;
    }
    Posting posts=Posting(title: title,body:body ,userId:1);
    adds(posts,context);
  }
  void adds(Posting post,BuildContext context)async {
    isLoading=true;
    var res=await Network.POST(Network.API_UPDATE, Network.paramsUpdate(post));
    print(res);
    try{
      if(res==null){
        isLoading=false;
        Navigator.of(context).pop({"data":"the result"});
      }
    }catch(e){
      print(e);
    }

  }




}
