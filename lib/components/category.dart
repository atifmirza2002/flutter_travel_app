import 'package:flutter/material.dart';
import '../constants/data.dart';
import './category_card.dart';
import './category_list.dart';
class Category extends StatefulWidget {
  final Map<String , dynamic> category;
  final Map<String, dynamic> categories;
  const Category({Key? key, required this.category, required this.categories}) : super(key: key);

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  late String _selectedCategory;

  @override
  void initState() {
    super.initState();
    _selectedCategory = categoriesData[0]['category']; // set initial selected category
  }

  @override
  Widget build(BuildContext context) {

    final filteredCategories = categoriesData.where(
          (item) => item['category'] == _selectedCategory,
    );

    return Column(
      children: [
        Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: categoriesList
                    .map(
                      (item) => CategoryList(
                    categories: item,
                    selectedCategory: _selectedCategory,
                    onTap: (category) {
                      setState(() {
                        _selectedCategory = category;
                      });
                    },
                  ),
                )
                    .toList(),
              ),
            ),
          ],
        ),
        Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: filteredCategories
                    .map(
                      (item) => CategoryCard(category: item),
                )
                    .toList(),
              ),
            ),
          ],
        ),
      ],
    );
  }

}
