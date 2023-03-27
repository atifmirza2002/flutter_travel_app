import 'package:flutter/material.dart';
import '../components/category.dart';
import '../components/search_bar.dart';
import '../components/nearby.dart';
import '../components/insights.dart';
import '../screens/all_products.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                image: DecorationImage(
                                    fit: BoxFit.fitHeight,
                                    image: NetworkImage(
                                        "https://th.bing.com/th/id/OIP.fzSnClvueUiDCZNJINMWywHaEK?pid=ImgDet&rs=1"))),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Hello there!",
                              ),
                              Text(
                                "WELCOME TO TRAVAEL HACK",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.notifications,
                        size: 26,
                      ),
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Column(
              children: [SearchBar()],
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Category",
                        style: TextStyle(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AllProducts(
                                      category: {},
                                      allproducts: {},
                                    ))),
                        child: Row(
                          children: [
                            Text("See all"),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 14,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Category(
                  category: {},
                  categories: {},
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.my_location,
                            color: Colors.orange,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text("Top Nearby"),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text("See all"),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 14,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                TopNearby(
                  nearby: {},
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(Icons.insights, color: Colors.orange),
                          SizedBox(
                            width: 5,
                          ),
                          Text("Insights for you"),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text("See all"),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 14,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Insights(
                  insights: {},
                )
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
