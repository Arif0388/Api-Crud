import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:testpage/Model/NoteModel.dart';
import 'package:testpage/Model/UserModel.dart';

class DataBaseController extends GetxController
{
  // String baseUrl = 'https://api.github.com/users';
  // List<UserModel> userList= [];
  RxBool isLoading  = false.obs;
  FirebaseFirestore db = FirebaseFirestore.instance;
  RxList<NoteModel> note = <NoteModel>[].obs;
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();

  @override
  void onInit()
  {
    super.onInit();
    // getApi();
    getNotes();
  }

//   void getApi() async{
//     isLoading.value = true;
//       final response  = await http.get(Uri.parse(baseUrl));
//       var data = jsonDecode(response.body);
//       if(response.statusCode==200)
//         {
//            for(var users in data)
//              {
//                userList.add(UserModel.fromJson(users));
//              }
//            print('Function CALL');
//     }
//     isLoading.value = false;
//   }
//
//
// Future<void> addData() async{
//   await db.collection('userDetails').doc().set(
//     {
//       'name':'Arif',
//       'email':'arifhussain542@gmail.com',
//       'address':'Saran',
//     }
//   );
// }
//
// Future<void> getData() async{
//   await db.collection('userDetails').get().then((value){
//      for(var users in value.docs)
//        {
//
//       }
//     });
// }
//
// Future<void> updateData()async{
//   await db.collection('userDetails').doc('KikoMtRvfuoycIqkW7Jz').set(
//     {
//       "name":"Aif Hussain"
//     }
//   );
// }
//
// Future<void> deleteData() async{
//   await db.collection('userDetails').doc('KikoMtRvfuoycIqkW7Jz').delete();
// }




//................................................................-------------------------------------------........................................
Future<void> addNote(NoteModel note)async{
    isLoading.value = true;
    try{
      await db.collection('Notes').doc(note.id).set(note.toJson());
      Get.snackbar('Note Added','Oh Nice Note Added',
          snackPosition:SnackPosition.BOTTOM,
          backgroundColor:Colors.green,
          colorText:Colors.white
      );
      title.clear();
      description.clear();
      getNotes();
    }catch(ex)
  {
    print(ex);
    }
    isLoading.value = false;
}

Future<void> getNotes()async{
  isLoading.value = true;
    note.clear();
    await db.collection('Notes').get().then((value){
      for(var data in value.docs)
        {
          note.add(NoteModel.fromJson(data.data()));
        }
    }
    );
  isLoading.value = false;
}

Future<void> deleteNotes(String id)async{
  isLoading.value = true;
    await db.collection('Notes').doc(id).delete();
    getNotes();
  isLoading.value =false;
}

Future<void> updateNotes(String id)async{
    isLoading.value = true;
    await db.collection('Notes').doc(id).update(
      NoteModel(
        id:id,
        title:title.text,
        description:description.text
      ).toJson(),
    );
    title.clear();
    description.clear();
    getNotes();
    isLoading.value = false;
  }

}