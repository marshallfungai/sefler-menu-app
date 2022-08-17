import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_plus/flutter_swiper_plus.dart';
import 'package:hive/hive.dart';
import '../style.dart';

class MenuCategoryDetailScreen extends StatefulWidget {
  final menu;
  MenuCategoryDetailScreen({this.menu});

  @override
  _MenuCategoryDetailScreenState createState() =>
      _MenuCategoryDetailScreenState();
}

class _MenuCategoryDetailScreenState extends State<MenuCategoryDetailScreen> {
  late Box<dynamic> menuBox;

  @override
  Widget build(BuildContext context) {
    menuBox = Hive.box<dynamic>('restaurantDataURL');

    double windowHeight = MediaQuery.of(context).size.height;
    double windowWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white10,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          constraints: const BoxConstraints.expand(),
          decoration: BoxDecoration(
            color: Colors.black,
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 40.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(.5),
                          borderRadius: BorderRadius.circular(9.0),
                        ),
                        child: IconButton(
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    Container(
                        child: Text(widget.menu['name_en'],
                            style: const TextStyle(
                                fontSize: 23, color: Colors.white))),
                  ],
                ),
              ),
              SizedBox(
                height: windowHeight * 0.1,
              ),
              _platformWidget(context, widget.menu)
            ],
          ),
        ),
      ),
    );
  }

  Widget _platformWidget(context, menu) {
    double windowHeight = MediaQuery.of(context).size.height;
    double windowWidth = MediaQuery.of(context).size.width;

    if (kIsWeb) {
      return Expanded(
        child: ListView.builder(
          //controller: _controller,
          physics: BouncingScrollPhysics(),
          itemCount: menu['items'].length,
          itemBuilder: (BuildContext context, int index) {
            return _categoryDetail_web(context, menu['items'][index]);
          },
        ),
      );
    } else {
      return Container(
        height: windowHeight * 0.6,
        child: Swiper(
          itemBuilder: (BuildContext context, int index) {
            return _categoryDetail_mobile(context, menu['items'][index]);
          },
          itemCount: menu['items'].length,
          itemWidth: 300.0,
          layout: SwiperLayout.STACK,
          //loop: false,
        ),
      );
    }
  }

  Widget _categoryDetail_mobile(context, item) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    var menuItem = item;
    String menu_name = menuItem['name_en'];
    String menu_name_tr = menuItem['name_tr'];
    String menu_desc = menuItem['description_en'];
    String menu_desc_tr = menuItem['description_tr'];

    return Container(
      child: Card(
        color: Colors.white.withOpacity(0.9),
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7.0),
        ),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: MediaQuery.of(context).size.width * 0.35,
              // width: MediaQuery.of(context).size.width * 0.25,
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  // borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: NetworkImage(menuItem['image']),
                      fit: BoxFit.cover)),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 7),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                    alignment: Alignment.topLeft,
                    child: Text(
                      menuItem['name_tr'],
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.8),
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                    child: Text(
                      menuItem['description_tr'],
                      style: TextStyle(
                          fontSize: 16, color: Colors.black.withOpacity(0.8)),
                    ),
                  ),
                  Divider(
                    color: Colors.black.withOpacity(0.4),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      menuItem['price'],
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          color: Colors.deepOrange.withOpacity(0.5)),
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

  Widget _categoryDetail_web(context, item) {
    double windowHeight = MediaQuery.of(context).size.height;
    double windowWidth = MediaQuery.of(context).size.width;

    var menuItem = item;
    String menu_name = menuItem['name_en'];
    String menu_name_tr = menuItem['name_tr'];
    String menu_desc = menuItem['description_en'];
    String menu_desc_tr = menuItem['description_tr'];
    String menu_image = menuItem['image'];

    return Container(
      // height: 50,
      margin: EdgeInsets.symmetric(vertical: 7, horizontal: 10),
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      decoration: const BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        children: [
          Container(
              width: windowWidth * 0.2,
              margin: EdgeInsets.only(right: 5),
              child: Image.network(menu_image)),
          Expanded(
            //width: windowWidth * 0.8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(menu_name,
                    style: TextStyle(color: Colors.white, fontSize: 20)),
                Text(menu_desc,
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.6), fontSize: 14)),
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    menuItem['price'],
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.deepOrange.withOpacity(0.5)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
