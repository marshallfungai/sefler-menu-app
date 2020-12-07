import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:sefler_menu/models/MenuItemsModel.dart';
import 'package:sefler_menu/style.dart';

class MenuCategoryDetailScreen extends StatefulWidget {
  final menu;
  MenuCategoryDetailScreen({this.menu});

  @override
  _MenuCategoryDetailScreenState createState() => _MenuCategoryDetailScreenState();
}

class _MenuCategoryDetailScreenState extends State<MenuCategoryDetailScreen> {

  Box<dynamic> menuBox;

  List<Items> categoryMenuItems;



  @override
  Widget build(BuildContext context) {

    menuBox =  Hive.box<dynamic>('restaurantDataURL');

    String restaurantName = menuBox.get('restaurant_name');
    var items =  menuBox.get("restaurant_menus_items");
    categoryMenuItems= items;

    double windowHeight = MediaQuery.of(context).size.height;
    double windowWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white10,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        decoration: BoxDecoration(
            color: Colors.red,
            image: DecorationImage(
              image: AssetImage('assets/images/sefler-menu-bg2.jpg'),
              fit: BoxFit.cover,
              colorFilter: new ColorFilter.mode(primaryColorDark.withOpacity(.8), BlendMode.srcOver),
            )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 40.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(.5),
                        borderRadius: BorderRadius.circular(9.0),
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Container(
                    // margin: EdgeInsets.only(top: windowHeight * 0.1 ),
                      child: Text(widget.menu.nameEn,  style: TextStyle(fontSize: 23, color: Colors.white))),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: widget.menu.items.length,
                itemBuilder: (context, item) => _categoryDetail(context, item)
               ),
            )
          ],
        ),
      ),
    );
  }

  Widget _categoryDetail(context, index) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    var menuItem = widget.menu.items[index];

    return Container(
      height: height * .19,

      child: Card(
        color: Colors.white10,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7.0),
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height:  MediaQuery.of(context).size.width * 0.25,
              width: MediaQuery.of(context).size.width * 0.25,
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                // borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: NetworkImage(menuItem.image),
                      fit: BoxFit.cover)
              ),
            ),
            Expanded(
              child: Container(

                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 7),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        menuItem.nameEn,
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      child:  Text(menuItem.descriptionEn, maxLines: 2, style: TextStyle(color: Colors.white.withOpacity(0.5)),),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      child:OutlineButton(
                        onPressed: () {
                        //  print('Received click');
                        },
                        child: Text(menuItem.price, style: TextStyle(color: Colors.deepOrange.withOpacity(0.5)),),
                      ),
                    ),
                  ],
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}
