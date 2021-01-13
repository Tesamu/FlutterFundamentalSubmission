import 'package:flutter/material.dart';
import 'package:flutter_fundamental_submission/model/restaurants.dart';

class RestaurantsDetail extends StatelessWidget {
  static const routeName = '/restaurant_detail';

  final Restaurants restaurants;

  const RestaurantsDetail({@required this.restaurants});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(restaurants.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(restaurants.pictureId),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    restaurants.description,
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 17),
                  ),
                  Divider(
                    color: Colors.black,
                  ),
                  Text(
                    "Kota: ${restaurants.city}",
                    style: TextStyle(fontSize: 15),
                  ),
                  Text(
                    "Rating: ${restaurants.rating}",
                    style: TextStyle(fontSize: 15),
                  ),
                  Divider(
                    color: Colors.black,
                  ),
                  Container(
                    height: 25,
                    child: Text(
                      "List Makanan",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    height: 159,
                    child: ListView(
                      children: restaurants.menus.foods.map((e) {
                        return new Card(
                          elevation: 7.0,
                          child: new Container(
                            child: new Row(
                              children: <Widget>[
                                Container(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text("- ${e.name.toString()}"),
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  Divider(
                    color: Colors.black,
                  ),
                  Container(
                    height: 25,
                    child: Text(
                      "List Minuman",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    height: 159,
                    child: ListView(
                      children: restaurants.menus.drinks.map((e) {
                        return new Card(
                          elevation: 7.0,
                          child: new Container(
                            child: new Row(
                              children: <Widget>[
                                Container(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text("- ${e.name.toString()}"),
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}