import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:podcast_search/podcast_search.dart';
import 'package:pods_only/core/services/podcast_service.dart';
import 'package:pods_only/ui/home_category.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
                  children: [
            Padding(
              padding: EdgeInsets.fromLTRB(5.0, 30.0, 5.0, 4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:const [
                  Text(
                    'Listen Now',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontWeight: FontWeight.w700),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      backgroundColor: Color(0xffE6E6E6),
                      radius: 30,
                      child: Icon(
                        Icons.person,
                        color: Color(0xffCCCCCC),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const Divider(color: Colors.grey,thickness: 0.2,),
            HomeCategory(
              mainTitle: 'Up Next', 
              buttonFunction: (){}, 
              imageHeight: 210, 
              imageWidth: 250, 
              containerHeight:350, 
              containerColor:const Color.fromARGB(96, 38, 36, 36),
              genre: 'Technology'
              ,
              // isHorizontalLine: false,
              ),
              const SizedBox(
                height: 10,
              ),
            HomeCategory(
              mainTitle: 'You Might Like', 
              buttonFunction: (){}, 
              subTitle: 'Based on your listening', 
              imageHeight: 180, 
              imageWidth: 150, 
              containerHeight: 220, 
              containerColor: Colors.black,
              isHorizontalLine: true,
              genre: 'Business',
              ),
            HomeCategory(
              mainTitle: 'Popular show', 
              buttonFunction: (){}, 
              imageHeight: 180, 
              imageWidth: 150, 
              containerHeight: 220, 
              containerColor: Colors.black,
              isHorizontalLine: true,
              genre: 'Politics',
              ),
                  ],
                ),
          )),
    );
  }
}
