import 'package:flutter/material.dart';
import 'package:plantapp_2/models/plant.dart';
import 'package:plantapp_2/widgets/plant_widget.dart';

class FavoritePage extends StatefulWidget {
  final List<Plant> favoritedPlants;

  const FavoritePage({
    super.key,
    required this.favoritedPlants,
  });

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: widget.favoritedPlants.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100.0,
                    child: Image.asset('assets/images/favorited.png'),
                  ),
                  const SizedBox(height: 20.0),
                  const Text(
                    'ظاهراً به هیچی علاقه نداشتی  :-|',
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 20.0,
                      fontFamily: 'YekanBakh',
                    ),
                  )
                ],
              ),
            )
          : Container(
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 30.0),
              height: size.height * 0.5,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: widget.favoritedPlants.length,
                itemBuilder: (context, index) {
                  return NewPlantWidget(
                    plantList: widget.favoritedPlants,
                    index: index,
                  );
                },
              ),
            ),
    );
  }
}
