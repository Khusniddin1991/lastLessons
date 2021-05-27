import 'package:flutter/cupertino.dart';
import 'package:provider_and_dio/Controller/Another%20Nertwork.dart';
import 'package:provider_and_dio/Controller/Network.dart';
import 'package:provider_and_dio/Model/viewmodel.dart';

class HomeViewModel extends ChangeNotifier {
  bool isLoading = false;
  List<Posting> items = new List();

  Future apiPostList() async {
  isLoading = true;
  notifyListeners();

  var response = await Networks.GET(Networks.API_LIST);
  if (response != null) {
  items = Networks.parsePostList(response);
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



  }
