import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key, required this.cardData}) : super(key: key);

  final Map<String, dynamic> cardData;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Column(
          children: [
        Stack(
          children: [
            Column(
              children: [
                Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(widget.cardData["image"])
                      )
                  ),
                )
              ],
            ),
            Positioned(
              top: 0,
              right: 0,
              left: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.red[200]

                        ),
                        child: GestureDetector(
                          onTap: ()=> Navigator.pop(context),
                            child: Center(child: Icon(Icons.arrow_back_ios,color: Colors.white,)))),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.red[200]

                        ),
                        child: Center(child: Icon(Icons.share,color: Colors.white,))),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 120,
              right: 0,
              left: 0,

              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    for (var imageUrl in widget.cardData["imageList"].values)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 50,
                          width: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                width: 4,
                                color: Colors.red.shade200,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  spreadRadius: 1,
                                  blurRadius: 5,
                                  color: Colors.blueGrey
                                )
                              ],
                              image: DecorationImage(
                                image: NetworkImage(imageUrl),
                                fit: BoxFit.cover,
                              )
                          ),
                        ),
                      )
                  ],
                ),
              ),
            ),
          ],
        ),


            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.cardData["name"]),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(widget.cardData["location"]),
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
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Icon(Icons.star,size: 14,color: Colors.orange,),
                      Icon(Icons.star,size: 14,color: Colors.orange,),
                      Icon(Icons.star,size: 14,color: Colors.orange,),
                      Icon(Icons.star,size: 14,color: Colors.orange,),
                      Icon(Icons.star,size: 14,color: Colors.orange[200],),
                      SizedBox(width: 5,),
                      Text(widget.cardData["rating"]),
                      SizedBox(width: 5,),
                      Container(
                        height: 30,
                        width: 2,
                        decoration: BoxDecoration(
                          color: Colors.grey
                        ),
                      ),
                      SizedBox(width: 5,),
                      Text(widget.cardData["reviews"]),
                      SizedBox(width: 5,),
                      Text("Reviews")
                    ],
                  ),
                  SizedBox(height: 10,),
                  Text("Description",style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600
                  ),),
                  SizedBox(height: 10,),
                  Text(widget.cardData["description"]),
                  SizedBox(height: 10,),
                  Text("Facility",style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600
                  ),),

                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 60,
                        width: 70,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Icon(Icons.local_parking_rounded),
                              Text("Parking")
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 60,
                        width: 70,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Icon(Icons.wifi),
                              Text("WI-FI")
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 60,
                        width: 70,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Icon(Icons.pool),
                              Text("Pool")
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 60,
                        width: 70,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Icon(Icons.sports_gymnastics),
                              Text("Gym")
                            ],
                          ),
                        ),
                      ),

                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("START FROM",style: TextStyle(

                          ),),
                          Row(
                            children: [
                              Text("\$",style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w600
                              ),),
                              Text(widget.cardData["price"],
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                              ),),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        height: 40,
                        width: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.blue[800],
                        ),
                        child: Center(child: Text("Booking",style: TextStyle(
                          color: Colors.white,

                        ),)),
                      )
                    ],
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
