import 'package:flutter/material.dart';
import 'package:flutter_fundamental_submission/model/restaurants.dart';
import 'package:flutter_fundamental_submission/restaurants_detail.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: RestaurantApp.routeName,
      routes: {
        RestaurantApp.routeName: (context) => RestaurantApp(),
        RestaurantsDetail.routeName: (context) => RestaurantsDetail(
              restaurants: ModalRoute.of(context).settings.arguments,
            )
      },
    );
  }
}

class RestaurantApp extends StatelessWidget {
  static const routeName = '/restaurant_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List Restaurant"),
      ),
      body: FutureBuilder<String>(
        future: DefaultAssetBundle.of(context)
            .loadString('assets/local_restaurant.json'),
        builder: (context, snapshot) {
          final List<Restaurants> restaurants = parseRestaurants(snapshot.data);
          return ListView.builder(
            itemCount: restaurants.length,
            itemBuilder: (context, index) {
              return _buildRestaurantItem(context, restaurants[index]);
            },
          );
        },
      ),
    );
  }
}

Widget _buildRestaurantItem(BuildContext context, Restaurants restaurants) {
  return ListTile(
    contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
    leading: Image.network(
      restaurants.pictureId,
      width: 100,
    ),
    title: Text(restaurants.name),
    subtitle: Text(
      restaurants.description,
      maxLines: 4,
    ),
    onTap: () {
      Navigator.pushNamed(context, RestaurantsDetail.routeName,
          arguments: restaurants);
    },
  );
}