import 'package:flutter/material.dart';

class DetailsRow extends StatelessWidget {
  final String item;  
  final String titleOfItem;
  DetailsRow({Key? key,required this.item, required this.titleOfItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '$titleOfItem ',
                      style: TextStyle(fontSize: 18, color: Colors.black54),
                    ),
                    Text(
                      '$item',
                      style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),
                    ),
                  ],
                );
  }
}