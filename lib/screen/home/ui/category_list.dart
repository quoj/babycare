import 'package:flutter/material.dart';
import 'package:t2305m_mcv/screen/home/ui/category_item.dart';
import 'package:t2305m_mcv/service/category_service.dart';
import '../../../model/category.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({super.key});
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  final CategoryService _categoryService = CategoryService();
  List<Category> categories = [];

  Future<void> _getData() async {
    List<Category> data = await _categoryService.getCategories();
    setState(() {
      categories = data;
    });
  }

  @override
  void initState() {
    super.initState();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 10, top: 20, right: 10, bottom: 20),
          child: Text(
            "Category",
            style: TextStyle(
              color: Colors.red,
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        Container(
          height: 620,
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: categories.length < 6 ? categories.length : 6,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.all(10.0),
                child: CategoryItem(category: categories[index]),
              );
            },
          ),
        ),
      ],
    );
  }
}
