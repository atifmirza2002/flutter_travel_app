import 'package:flutter/material.dart';
import '../constants/data.dart';
import '../components/all_productscard.dart';

class AllProducts extends StatefulWidget {
  final Map<String, dynamic> allproducts;
  const AllProducts({Key? key, required this.allproducts, required Map category}) : super(key: key);

  @override
  State<AllProducts> createState() => _AllProductsState();
}

class _AllProductsState extends State<AllProducts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: ()=> Navigator.pop(context),
        ),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 0.9,
        padding: const EdgeInsets.all(10),
        children: categoriesData
            .map((item) => AllProductsCard(category: item))
            .toList(),
      ),
    );
  }
}

