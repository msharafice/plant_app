import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plantapp_2/const/constants.dart';
import 'package:plantapp_2/models/plant.dart';
import 'package:plantapp_2/screens/detail_page.dart';
import 'package:plantapp_2/widgets/extensions.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  final List<Plant> _plantlist = Plant.plantList;

  bool toggleIsFavorite(bool isFavorite) {
    return !isFavorite;
  }

  final List<String> _planttypes = [
    '| پیشنهادی |',
    '| آپارتمانی |',
    '| محل کار |',
    '| گل باغچه‌ای |',
    '| گل سمی |',
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //search box
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  width: size.width * 0.9,
                  decoration: BoxDecoration(
                    color: Constants.primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.mic,
                        color: Constants.blackColor,
                      ),
                      const Expanded(
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: TextField(
                            textAlign: TextAlign.start,
                            showCursor: false,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(right: 5.0),
                              hintText: '...جستجو',
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                            ),
                            style: TextStyle(
                              // fontFamily: 'iransans'
                              fontSize: 14.0,
                            ),
                          ),
                        ),
                      ),
                      Icon(
                        Icons.search,
                        color: Constants.blackColor,
                      )
                    ],
                  ),
                ),
              ),
            ),
            //category
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 18.0, vertical: 15.0),
              height: 70.0,
              width: size.width,
              child: ListView.builder(
                reverse: true,
                scrollDirection: Axis.horizontal,
                itemCount: _planttypes.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Text(
                        _planttypes[index],
                        style: TextStyle(
                          // fontFamily: 'iransans',
                          fontSize: 16.0,
                          fontWeight: selectedIndex == index
                              ? FontWeight.bold
                              : FontWeight.w300,
                          color: selectedIndex == index
                              ? Constants.primaryColor
                              : Constants.blackColor,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            //product one
            SizedBox(
              height: size.height * 0.3,
              child: ListView.builder(
                itemCount: _plantlist.length,
                scrollDirection: Axis.horizontal,
                reverse: true,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          child: DetailPage(
                            plantId: _plantlist[index].plantId,
                          ),
                          type: PageTransitionType.topToBottom,
                        ),
                      );
                    },
                    child: Container(
                      width: 200.0,
                      margin: const EdgeInsets.symmetric(horizontal: 18.0),
                      decoration: BoxDecoration(
                        color: Constants.primaryColor.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            top: 10.0,
                            right: 20.0,
                            child: Container(
                              width: 40.0,
                              height: 40.0,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                              child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    bool isFavorated = toggleIsFavorite(
                                        (_plantlist[index].isFavorated));
                                    _plantlist[index].isFavorated = isFavorated;
                                  });
                                },
                                icon: Icon(
                                  _plantlist[index].isFavorated == true
                                      ? Icons.favorite
                                      : Icons.favorite_border_outlined,
                                  color: Constants.primaryColor,
                                  size: 20.0,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 50.0,
                            right: 50.0,
                            top: 50.0,
                            bottom: 50.0,
                            child: Image.asset(
                              _plantlist[index].imageURL,
                            ),
                          ),
                          Positioned(
                            bottom: 15.0,
                            left: 20.0,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 2.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Text(
                                r'$' +
                                    _plantlist[index]
                                        .price
                                        .toString()
                                        .farsinumber,
                                style: TextStyle(
                                    color: Constants.primaryColor,
                                    fontSize: 16.0,
                                    fontFamily: 'lalezar'),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 15.0,
                            right: 20.0,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  _plantlist[index].category,
                                  style: const TextStyle(
                                    // fontFamily: 'yrkanbakh',
                                    color: Colors.white70,
                                    fontSize: 14.0,
                                  ),
                                ),
                                Text(
                                  _plantlist[index].plantName,
                                  style: const TextStyle(
                                      // fontFamily: 'yekanbakh',
                                      color: Colors.white70,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            // new plant product 2
            Container(
              alignment: Alignment.centerRight,
              padding:
                  const EdgeInsets.only(right: 10.0, bottom: 15.0, top: 20.0),
              child: const Text(
                'گیاهان جدید',
                style: TextStyle(
                  fontFamily: 'lalezar',
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              height: size.height * 0.3,
              child: ListView.builder(
                itemCount: _plantlist.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          child: DetailPage(
                            plantId: _plantlist[index].plantId,
                          ),
                          type: PageTransitionType.rightToLeft,
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Constants.primaryColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      height: 80.0,
                      width: size.width,
                      margin: const EdgeInsets.only(bottom: 10.0, top: 10.0),
                      padding: const EdgeInsets.only(left: 10.0, top: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                  height: 20.0,
                                  child: Image.asset(
                                      'assets/images/PriceUnit-green.png')),
                              const SizedBox(width: 5.0),
                              Text(
                                _plantlist[index].price.toString().farsinumber,
                                style: TextStyle(
                                  fontFamily: 'lalezar',
                                  color: Constants.primaryColor,
                                  fontSize: 20.0,
                                ),
                              ),
                            ],
                          ),
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Container(
                                width: 60.0,
                                height: 60.0,
                                decoration: BoxDecoration(
                                  color:
                                      Constants.primaryColor.withOpacity(0.8),
                                  shape: BoxShape.circle,
                                ),
                              ),
                              Positioned(
                                bottom: 5.0,
                                right: 0,
                                left: 0,
                                child: SizedBox(
                                  height: 80.0,
                                  child:
                                      Image.asset(_plantlist[index].imageURL),
                                ),
                              ),
                              Positioned(
                                  bottom: 5.0,
                                  right: 80.0,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        _plantlist[index].category,
                                        style: const TextStyle(
                                          fontSize: 13.0,
                                          // fontFamily: 'yekanbakh',
                                        ),
                                      ),
                                      Text(
                                        _plantlist[index].plantName,
                                        style: TextStyle(
                                          fontSize: 18.0,
                                          // fontFamily: 'yekanbakh',
                                          color: Constants.blackColor,
                                        ),
                                      ),
                                    ],
                                  ))
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}


