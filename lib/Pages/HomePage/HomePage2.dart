
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testpage/Controller/firebaseController.dart';

class HomePage2 extends StatelessWidget {
  const HomePage2({super.key});

  @override
  Widget build(BuildContext context) {
    DataBaseController dataBaseController = Get.put(DataBaseController());
    return Scaffold(
      backgroundColor:Colors.black26,
      appBar:AppBar(
        backgroundColor:Colors.grey,
        centerTitle:true,
        title:const Text('Users'),
      ),
      body:Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
           Obx(() =>
               Expanded(
                 child: dataBaseController.isLoading.value? const Center(child: CircularProgressIndicator()) : ListView.builder(
                   itemCount:dataBaseController.userList.length,
                   itemBuilder: (context, index) {
                     return  Container(
                       margin:const EdgeInsets.all(7),
                       padding:const EdgeInsets.all(10),
                       // width:200,
                       decoration:BoxDecoration(
                         borderRadius:BorderRadius.circular(15),
                         color:Colors.white,
                       ),
                       child:Row(
                         children: [
                           ClipRRect(
                             borderRadius:BorderRadius.circular(15),
                             child: CircleAvatar(
                               maxRadius:25,
                               child:Image.network(dataBaseController.userList[index].avatarUrl!),
                             ),
                           ),
                           const SizedBox(width:20),
                           Text(dataBaseController.userList[index].login!),
                         ],
                       ),
                     );
                   },
                 ),
               )
           ),
          ],
        ),
      ),
    );
  }
}
