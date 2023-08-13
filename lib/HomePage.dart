import 'package:flutter/material.dart';
import 'package:myapp/Movie.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Movie>? favMovie = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Movie the_social_network = new Movie("The Social Network",
        "3 November 2010", "8/10", "assets/the_social_network.jpeg");
    Movie level_16 =
        new Movie("Level 16", "15 Maret 2019", "9/10", "assets/level_16.jpeg");
    Movie the_divine_fury = new Movie("The Divine Fury", "14 Agustus 2019",
        "8.5/10", "assets/the_divine_fury.jpeg");
    Movie mulan =
        new Movie("Mulan", "25 Maret 2020", "8/10", "assets/mulan.jpg");
    Movie milea =
        new Movie("Milea", "13 Februari 2020", "6/10", "assets/milea.jpg");

    favMovie?.add(the_social_network);
    favMovie?.add(level_16);
    favMovie?.add(the_divine_fury);
    favMovie?.add(mulan);
    favMovie?.add(milea);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorite Movie"),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.68,
        ),
        itemCount: favMovie?.length ?? 0,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              // Handle movie item tap
            },
            child: Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Color.fromRGBO(225, 225, 225, 1),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    spreadRadius: 1,
                    blurRadius: 6,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    child: Image.asset(
                      favMovie![index].imagePath,
                      height: 300,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          favMovie![index].name,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 21,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(height: 5),
                        Text(
                          favMovie![index].rilis,
                          style: TextStyle(color: Colors.black54),
                        ),
                        SizedBox(height: 5),
                        Text(
                          favMovie![index].rating,
                          style: TextStyle(color: Colors.black54),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
