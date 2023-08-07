import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class HomeCategoryHeader extends StatelessWidget {
  final mainTitle;
  final String subTitle;
  final VoidCallback buttonFunction;
  const HomeCategoryHeader({super.key, this.mainTitle,  this.subTitle = '', required this.buttonFunction});

  @override
  Widget build(BuildContext context) {
    return  Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text(
                    mainTitle,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    subTitle,
                    style: TextStyle(
                        color: Color.fromARGB(255, 165, 161, 161),
                        fontSize: subTitle.isEmpty ? 0 : 16,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              InkWell(
                child: const Text(
                  'See All',
                  style: TextStyle(
                      color: Colors.deepPurple,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
                onTap: () {
                  buttonFunction;
                },
              ),
            ],
          ),
        )
      ;
  }
}