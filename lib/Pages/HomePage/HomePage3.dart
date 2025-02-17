import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testpage/Controller/ApiController.dart';

class HomePage3 extends StatelessWidget {
  const HomePage3({super.key});

  @override
  Widget build(BuildContext context) {
    ApiController apiController = Get.put(ApiController());
    return Scaffold(
      floatingActionButton:FloatingActionButton(
        onPressed:(){
         showModalBottomSheet(context: context, builder:(context) {
           return Container(
             width:400,
             height:400,
        decoration:const BoxDecoration(
          borderRadius:BorderRadius.only(topLeft:Radius.circular(10),topRight:Radius.circular(10)),

        ),
             child:Padding(
               padding: const EdgeInsets.all(8.0),
               child: Column(
                 children: [
                   SizedBox(
                     width:300,
                     child: TextField(
                       controller:apiController.title,
                       decoration:InputDecoration(
                         hintText:'Enter Title',
                         fillColor:Colors.teal,
                         filled:true,
                         border:OutlineInputBorder(
                           borderRadius:BorderRadius.circular(10),
                         ),
                         suffixIcon:const Icon(Icons.person),
                       ),
                     ),
                   ),
                   const SizedBox(height:15),
                   SizedBox(
                     width:350,
                     child: TextField(
                       controller:apiController.description,
                       maxLines:8,
                       decoration:InputDecoration(
                         hintText:'Enter Description',
                         fillColor:Colors.teal,
                         filled:true,
                         border:OutlineInputBorder(
                           borderRadius:BorderRadius.circular(20),
                         ),
                       ),
                     ),
                   ),
                   const SizedBox(height:10),
                   InkWell(
                     onTap:(){
                       apiController.addNotes();
                       Get.back();
                     },
                     child: Container(
                       width:100,
                       height:50,
                       decoration:BoxDecoration(
                         borderRadius:BorderRadius.circular(20),
                         color:Colors.teal
                       ),
                       child:const Icon(Icons.save,color:Colors.pinkAccent,)
                     ),
                   ),
                 ],
               ),
             ),
           );
         },
         );
        },child:const Icon(Icons.add),
      ),
      backgroundColor:Colors.black,
      appBar:AppBar(
        centerTitle:true,
        title:const Text('Api'),
        backgroundColor:Colors.teal,
      ),
      body:Column(
        children: [
        Obx(() =>Expanded(
          child:apiController.isLoading.value ? const Center(child: CircularProgressIndicator()) :  GridView.builder(
            itemCount:apiController.notes.length,
            gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:2),
            itemBuilder:(context, index) {
              return Container(
                  padding:const EdgeInsets.all(5),
                  margin:const EdgeInsets.all(4),
                  decoration:BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color:Colors.white,
                  ),
                  child:Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                              flex:8,
                              child:Text(apiController.notes[index].title!,style:const TextStyle(fontSize:17,fontWeight:FontWeight.bold),)),
                           Expanded(child:InkWell(
                              onTap: (){
                                showModalBottomSheet(context: context, builder:(context) =>
                                Container(
                                  padding:const EdgeInsets.all(5),
                                  width:400,
                                  height:106,
                                  decoration:const BoxDecoration(
                                    borderRadius:BorderRadius.only(topLeft:Radius.circular(10),topRight:Radius.circular(10)),
                                    color:Colors.blueGrey
                                  ),
                                  child:Column(
                                    children: [
                                        Row(
                                          children: [
                                            const Text('Delete'),
                                            IconButton(onPressed: (){
                                                apiController.deleteNotes(apiController.notes[index].id!);
                                                Get.back();
                                                }, icon:const Icon(Icons.delete,color:Colors.red,)),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            const Text('Update'),
                                            IconButton(onPressed: (){
                                              modalSheet(context, apiController,index);
                                            }, icon:const Icon(Icons.edit,color:Colors.green,)),
                                          ],
                                        ),
                                    ],
                                  ),
                                )
                                );
                              },
                              child: const Icon(Icons.more_vert_rounded)))
                        ],
                      ),
                      Expanded(
                        child:SingleChildScrollView(child: Text(apiController.notes[index].description!)),
                      ),
                    ],
                  )
              );
            },
          ),
        ),)
        ],
      ),
    );
  }
}


void modalSheet(BuildContext context,ApiController apiController,index)
{
  showModalBottomSheet(context: context, builder:(context) {
    return Container(
      width:400,
      height:400,
      decoration:const BoxDecoration(
        borderRadius:BorderRadius.only(topLeft:Radius.circular(10),topRight:Radius.circular(10)),

      ),
      child:Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              width:300,
              child: TextField(
                controller:apiController.title,
                decoration:InputDecoration(
                  hintText:'Enter Title',
                  fillColor:Colors.teal,
                  filled:true,
                  border:OutlineInputBorder(
                    borderRadius:BorderRadius.circular(10),
                  ),
                  suffixIcon:const Icon(Icons.person),
                ),
              ),
            ),
            const SizedBox(height:15),
            SizedBox(
              width:350,
              child: TextField(
                controller:apiController.description,
                maxLines:8,
                decoration:InputDecoration(
                  hintText:'Enter Description',
                  fillColor:Colors.teal,
                  filled:true,
                  border:OutlineInputBorder(
                    borderRadius:BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            const SizedBox(height:10),
            InkWell(
              onTap:(){
                apiController.updateNotes(apiController.notes[index].id!);
                Get.back();
                Get.back();
              },
              child: Container(
                  width:100,
                  height:50,
                  decoration:BoxDecoration(
                      borderRadius:BorderRadius.circular(20),
                      color:Colors.orangeAccent
                  ),
                  child:const Icon(Icons.update,color:Colors.green,)
              ),
            ),
          ],
        ),
      ),
    );
  }
  );
}