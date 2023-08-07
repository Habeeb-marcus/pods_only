import 'package:flutter/material.dart';
import 'package:pods_only/core/models/product_model.dart';

import '../../core/services/api_service.dart';
class TempAPIUI extends StatelessWidget {
  const TempAPIUI({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children:[
          const Text('Hello'),
          FutureBuilder<ProductModel>(
            future: ApiService().getItem(),
            builder: (BuildContext context,AsyncSnapshot<ProductModel> snapshot) {
              if(snapshot.hasData){
                return Column(
                  children: [
                    Text(snapshot.data!.title),
                    Text(snapshot.data!.description),
                    Text(snapshot.data!.price.toString()),
                    Text(snapshot.data!.discountPercentage.toString()),
                    Text(snapshot.data!.ratings.toString()),
                    Text(snapshot.data!.stock.toString()),
                    Text(snapshot.data!.brand),
                    Text(snapshot.data!.category),
                    Text(snapshot.data!.thumbnail),
                    Image.network('${snapshot.data!.images[0]}',
                    height: 100,
                    width: 100,),
                
                  ],
                );
              }
              if(snapshot. hasError){
                return Text(snapshot.error.toString());
              }
             
                return const CircularProgressIndicator();
             
            
            },
         
          
            
            )
        ]
      ),
    );
  }
}