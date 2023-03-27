import 'package:flutter/material.dart';
import '../screens/details_page.dart';
class InsightsCard extends StatefulWidget {
  const InsightsCard({Key? key,required this.insights}) : super(key: key);
  final Map<String , dynamic> insights;
  @override
  State<InsightsCard> createState() => _InsightsCardState();
}

class _InsightsCardState extends State<InsightsCard> {

  String truncateText(String text,numWords){
    List<String> words = text.split(" ");
    if(words.length <= numWords){
      return text;
    }else{
      return words.sublist(0,numWords).join(" ") + ("...");
    }
  }

void _navigateToDetailsPage(BuildContext context,Map<String , dynamic> cardData){
    Navigator.push(context,
        MaterialPageRoute(
            builder: (context)=> DetailsPage(cardData : cardData)));
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> _navigateToDetailsPage(context,widget.insights),

      child: Column(

        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    spreadRadius: 1,
                    blurRadius: 5,
                    color: Colors.blueGrey,

                  )
                ]

              ),
              height: 300,
              width: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 150,
                    width: 300,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(widget.insights["image"])
                      )
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 30,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.blueGrey,
                                  blurRadius: 5,
                                  spreadRadius: 0.1,
                                )
                              ]
                          ),
                          child: Center(
                            child: Text(widget.insights["category"].toString().toUpperCase(),
                              style: TextStyle(
                                color: Colors.green,

                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 5,),
                        Text(truncateText(widget.insights["description"], 10),
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16
                        ),
                        ),
                        SizedBox(height: 5,),
                        Column(
                          children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Row(
                                          children: [
                                            Icon(Icons.thumb_up_alt_sharp,color: Colors.grey,size: 18,),
                                            SizedBox(width: 5,),
                                            Text("25")
                                          ],
                                        ),
                                        SizedBox(width: 5,),
                                        Row(
                                          children: [
                                            Icon(Icons.message,color: Colors.grey,size: 18,),
                                            SizedBox(width: 5,),
                                            Text("4")
                                          ],
                                        ),
                                        SizedBox(width: 5,),
                                        SizedBox(width: 5,),
                                        Icon(Icons.share_sharp,color: Colors.grey,size: 18,)
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
                                    ),
                                  ],
                                ),
                              ],
                        )
                      ],
                    ),
                  )
                ],
              ),

            ),
          ),
          
        ],
      ),
    );
  }
}
