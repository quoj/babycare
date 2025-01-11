import 'package:flutter/cupertino.dart';
import 'package:t2305m_mcv/model/category.dart';

class CategoryItem extends StatelessWidget{
  final Category category;
  const CategoryItem({required this.category});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(
          "https://openweathermap.org/img/wn/10d@2x.png",
          width: 150,
          height: 120,
        ),
        Text(category.name??"")
      ],
    );
  }
}