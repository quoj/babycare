
import 'package:flutter/material.dart';
import 'package:t2305m_mcv/screen/home/ui/banner_slider.dart';
import 'package:t2305m_mcv/screen/home/ui/category_list.dart';
import 'package:t2305m_mcv/screen/home/ui/feature_products.dart';
import 'package:t2305m_mcv/screen/home/ui/search_box.dart';

class HomeScreen extends StatelessWidget{
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          SearchBox(),
          BannerSlider(),
          CategoryList(),
          FeatureProducts()
        ],
      ),
    );
  }
}