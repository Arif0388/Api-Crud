import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:testpage/Model/UserModel.dart';

class DataBaseController extends GetxController
{
  String baseUrl = 'https://api.github.com/users';
  List<UserModel> userList= [];
  RxBool isLoading  = false.obs;
  FirebaseFirestore db = FirebaseFirestore.instance;

  @override
  void onInit()
  {
    super.onInit();
    getApi();
  }

  void getApi() async{
    isLoading.value = true;
      final response  = await http.get(Uri.parse(baseUrl));
      var data = jsonDecode(response.body);
      if(response.statusCode==200)
        {
           for(var users in data)
             {
               userList.add(UserModel.fromJson(users));
             }
           print('Function CALL');
    }
    isLoading.value = false;
  }

  
Future<void> addData() async{
  await db.collection('userDetails').doc().set(
    {
      'name':'Arif',
      'email':'arifhussain542@gmail.com',
      'address':'Saran',
    }
  );
}

Future<void> getData() async{
  await db.collection('userDetails').get().then((value){
     for(var users in value.docs)
       {

      }
    });
}

Future<void> updateData()async{
  await db.collection('userDetails').doc('KikoMtRvfuoycIqkW7Jz').set(
    {
      "name":"Aif Hussain"
    }
  );
}

Future<void> deleteData() async{
  await db.collection('userDetails').doc('KikoMtRvfuoycIqkW7Jz').delete();
}

}