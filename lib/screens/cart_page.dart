import 'package:flutter/material.dart';
import 'package:plantapp_2/const/constants.dart';
import 'package:plantapp_2/models/plant.dart';
import 'package:plantapp_2/widgets/plant_widget.dart';
import 'package:plantapp_2/widgets/extensions.dart';

class CartPage extends StatefulWidget {
  final List<Plant> addedToCartPlants;
  const CartPage({
    super.key,
    required this.addedToCartPlants,
  });

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  double get totalPrice {
    // محاسبه مجموع قیمت محصولات در سبد خرید
    return widget.addedToCartPlants
        .fold(0.0, (sum, plant) => sum + plant.price);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.addedToCartPlants.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100.0,
                    child: Image.asset('assets/images/add-cart.png'),
                  ),
                  const SizedBox(height: 20.0),
                  const Text(
                    'سبد خرید تار عنکبوت بسته است',
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
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 30.0),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: widget.addedToCartPlants.length,
                      itemBuilder: (context, index) {
                        return NewPlantWidget(
                          plantList: widget.addedToCartPlants,
                          index: index,
                        );
                      },
                    ),
                  ),
                  Column(
                    children: [
                      const Divider(
                        thickness: 1.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                  height: 20.0,
                                  child: Image.asset(
                                      'assets/images/PriceUnit-green.png')),
                              const SizedBox(width: 5.0),
                              Text(
                                totalPrice
                                    .toStringAsFixed(2)
                                    .farsiNumber, // استفاده از مجموع قیمت‌ها
                                style: TextStyle(
                                  fontFamily: 'Lalezar',
                                  color: Constants.primaryColor,
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                          const Text(
                            'جمع کل',
                            style: TextStyle(
                              fontFamily: 'Lalezar',
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
    );
  }
}
