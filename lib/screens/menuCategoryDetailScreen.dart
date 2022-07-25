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
          decoration: BoxDecoration(
              color: Colors.red,
              image: DecorationImage(
                image: AssetImage('assets/images/sefler-menu-bg2.jpg'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    primaryColorDark.withOpacity(.8), BlendMode.srcOver),
              )),
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
              Container(
                height: windowHeight * 0.6,
                child: Swiper(
                  itemBuilder: (BuildContext context, int index) {
                    return _categoryDetail(
                        context, widget.menu['items'][index]);
                  },
                  itemCount: widget.menu['items'].length,
                  itemWidth: 300.0,
                  layout: SwiperLayout.STACK,
                  //loop: false,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _categoryDetail(context, item) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    var menuItem = item;

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
                      menuItem['name_en'],
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
                      menuItem['description_en'],
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
}
