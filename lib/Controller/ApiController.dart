import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:testpage/Model/NotesModel.dart';
import 'package:http/http.dart' as http;
class ApiController extends GetxController
{
  TextEditingController title  = TextEditingController();
  TextEditingController description  = TextEditingController();
  String baseUrl = 'https://676a5824863eaa5ac0de0a81.mockapi.io/api/Notes';
  List<NotesModel> notes = [];
 RxBool isLoading = false.obs;
  @override
  void onInit()
  {
    super.onInit();
    getNotes();
  }

  Future<void> getNotes()async{
    notes.clear();
    print('Function Call');
    isLoading.value = true;
    final response = await http.get(Uri.parse(baseUrl));
 var data = jsonDecode(response.body);
 if(response.statusCode==200)
   {
     for(var allNotes in data)
       {
         notes.add(NotesModel.fromJson(allNotes));
       }
   }
 isLoading.value = false;
  }

  Future<void> addNotes()async{
    var newNote = NotesModel(
      title:title.text,
      description:description.text
    );
    if(title.text!='' && description.text!='')
      {
        var response = await http.post(Uri.parse(baseUrl),
            body:jsonEncode(newNote.toJson()),
            headers:{'content-type':'application/json'}
        );
        if(response.statusCode==201)
        {
          print('Notes Add Successful');
          getNotes();
          title.clear();
          description.clear();
        }
      }
    else
      {
        Get.snackbar(
            'Notes','Please Add The Notes'
        );
    }


  }

  Future<void> deleteNotes(String id)async{
    var BaseUrl  = 'https://676a5824863eaa5ac0de0a81.mockapi.io/api/Notes/$id';

    final response = await http.delete(Uri.parse(BaseUrl));
    if(response.statusCode==200)
      {
        print('Deleted Successful');
        getNotes();
    }
  }

  Future<void> updateNotes(String id)async{
    var BaseUrl  = 'https://676a5824863eaa5ac0de0a81.mockapi.io/api/Notes/$id';
    final response = await http.put(Uri.parse(BaseUrl),
        body:jsonEncode(
          NotesModel(
            title:title.text,
            description:description.text
        ),),
      headers:{'content-type':'application/json'}
    );
  if(response.statusCode==200)
    {
      print('Notes Updated Successful');
      title.clear();
      description.clear();
      getNotes();
    }
  }

}