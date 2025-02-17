import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testpage/Controller/firebaseController.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    DataBaseController dataBaseController = Get.put(DataBaseController());
    return Scaffold(
      appBar:AppBar(
        backgroundColor:Colors.grey,
        centerTitle:true,
        title:const Text("Home Page"),
      ),
      body:Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              margin:const EdgeInsets.symmetric(horizontal:50),
              width:250,
              decoration:BoxDecoration(
                borderRadius:BorderRadius.circular(15),
                color:Colors.grey,
              ),
              child:const Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment:CrossAxisAlignment.start,
                  children: [
                    Text('Name : '),
                    SizedBox(height:20),
                    Text('Email :'),
                    SizedBox(height:20),
                    Text('Address :'),
                  ],
                ),
              ),
            ),
            const SizedBox(height:30),
            Row(
              mainAxisAlignment:MainAxisAlignment.spaceAround,
              children: [
                 InkWell(
                   onTap:(){
                     dataBaseController.deleteData();
                   },
                   child: Card(
                                   shadowColor:Colors.grey,
                                   child: Container(
                    padding:const EdgeInsets.all(10),
                    height:40,
                    decoration:BoxDecoration(
                      borderRadius:BorderRadius.circular(15),
                      color:Colors.green,
                    ),
                    child:const Text('Add'),
                                   ),
                                 ),
                 ),
                 Card(
                  child: Container(
                    padding:const EdgeInsets.all(10),
                    height:40,
                    decoration:BoxDecoration(
                      borderRadius:BorderRadius.circular(15),
                      color:Colors.green,
                    ),
                    child:const Text('Delete'),
                  ),
                ),
                 Card(
                  child: Container(
                    padding:const EdgeInsets.all(10),
                    height:40,
                    decoration:BoxDecoration(
                      borderRadius:BorderRadius.circular(15),
                      color:Colors.green,
                    ),
                    child:const Text('Update'),
                  ),
                ),
            ],
            )
          ],
        ),
      ),
    );
  }
}
