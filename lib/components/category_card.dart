import 'package:flutter/material.dart';
import '../screens/details_page.dart';
class CategoryCard extends StatefulWidget {
  const CategoryCard({Key? key, required this.category}) : super(key: key);

  final Map<String, dynamic> category;
  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  String truncateText(String text, int numWords) {
    List<String> words = text.split(' ');
    if (words.length <= numWords) {
      return text;
    } else {
      return words.sublist(0, numWords).join(' ') + '...';
    }
  }



  void _navigateToDetailsPage(BuildContext context, Map<String ,dynamic> cardData){
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context)=> DetailsPage(cardData: cardData)));
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> _navigateToDetailsPage(context, widget.category),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 200,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                spreadRadius: 1,
                blurRadius: 5
              )
            ]
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 100,
                width: 250,
                decoration: BoxDecoration(
                  // borderRadius: BorderRadius.circular(),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(widget.category["image"])
                  ),

                ),


              ),
              Container(
                width: 250,

                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Text(
                            truncateText(widget.category["name"],3),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.4
                          ),),
                        ),
                       // SizedBox(
                       //   height: 20,
                       //   width: 20,
                       //   child: Stack(
                       //     children: [
                       //       Positioned(
                       //         top: 0,
                       //           right: 0,
                       //           child:  Row(
                       //             children: [
                       //               Icon(Icons.star),
                       //               Text(widget.category["rating"]),
                       //             ],
                       //           ),
                       //       )
                       //     ],
                       //   ),
                       // ),
                        SizedBox(height: 5,),
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Row(
                            children: [
                              Icon(Icons.location_on,size: 16,color: Colors.orange,),
                              Text(
                                truncateText(widget.category["location"], 2),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              )

                            ],
                          ),
                        ),
                        SizedBox(height: 5,),

                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Text("Start from"),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 10),
                                        child: Row(
                                          children: [
                                            Text("\$",style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16
                                            ),),
                                            Text(widget.category["price"],style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16
                                            ),),
                                            Text("/Night")
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  Container(
                                    height: 35,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                     color: Colors.red[100]

                                    ),
                                    child: Icon(Icons.favorite_border,color: Colors.red,),
                                  )
                                ],
                              )
                            ],
                          ),

                      ],
                    ),
                  ),

              )
            ],
          ),


        ),
      ),
    );
  }
}
