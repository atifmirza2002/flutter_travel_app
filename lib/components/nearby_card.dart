import 'package:flutter/material.dart';
import '../screens/details_page.dart';
class NearbyCard extends StatefulWidget {
  const NearbyCard({Key? key, required this.nearby}) : super(key: key);

  final Map<String, dynamic> nearby;
  @override
  State<NearbyCard> createState() => _NearbyCardState();
}

class _NearbyCardState extends State<NearbyCard> {
  String truncateText(String text, int numWords){
    List<String> words = text.split(" ");
    if (words.length <= numWords){
      return text;
    }else{
      return words.sublist(0,numWords).join(" ") + '...';
    }
  }

  void _navigateToDetailsPage(BuildContext context, Map<String , dynamic> cardData){
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context)=> DetailsPage(cardData: cardData)));
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> _navigateToDetailsPage(context,widget.nearby),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Column(
              children: [
                Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width,

                  decoration: BoxDecoration(
                      color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: 1,
                        blurRadius: 5,
                        color: Colors.grey,
                        offset: Offset(3,0)
                      )
                    ]
                  ),
                  child: Row(

                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(widget.nearby["image"])
                            )
                          ),
                        ),
                      ),
                      Container(
                        width: 270,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(truncateText(widget.nearby["name"], 4),
                              style: TextStyle(

                              ),
                              ),
                              SizedBox(height: 5,),
                              Row(
                                children: [
                                  Icon(Icons.location_on,size: 16,color: Colors.orange,),
                                  Text(truncateText(widget.nearby["location"], 4),
                                  style: TextStyle(
                                    color: Colors.grey
                                  ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Text("Start from"),
                                      SizedBox(height: 2,),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 10),
                                        child: Row(
                                          children: [
                                            Text("\$",style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16
                                            ),),
                                            Text(widget.nearby["price"],style: TextStyle(
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
                        ),
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
