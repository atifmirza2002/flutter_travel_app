import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({
    Key? key,
    required this.categories,
    required this.selectedCategory,
    required this.onTap,
  }) : super(key: key);

  final Map<String, dynamic> categories;
  final String selectedCategory;
  final Function(dynamic category) onTap;

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  @override
  Widget build(BuildContext context) {
    final isSelected = widget.categories["category"] == widget.selectedCategory;

    return GestureDetector(
      onTap: () => widget.onTap(widget.categories["category"]),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 40,
          decoration: BoxDecoration(
            color: isSelected ? Colors.black : Colors.white,
            borderRadius: BorderRadius.circular(30),
            border: isSelected
                ? null
                : Border.all(
              color: Colors.black,
              width: 1,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                widget.categories["category"],
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


