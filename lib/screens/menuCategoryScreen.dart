import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sefler_menu/screens/screens.dart';
import 'package:sefler_menu/services/MenusService.dart';
import 'package:sefler_menu/style.dart';

class MenuCategoryScreen extends StatefulWidget {

  final restaurantID;

  MenuCategoryScreen({this.restaurantID});

  @override
  _MenuCategoryScreenState createState() => _MenuCategoryScreenState();

}

class _MenuCategoryScreenState extends State<MenuCategoryScreen> {

  MenusService _menusService = new MenusService();
  var pageIndex = 0;
  Future<bool> _checkMenuFound;

  List<dynamic> categoryMenuList = [
    'Chicken Menu',
    'Meat Menu',
    'Vegetarian Menu',
    'Pizzas',
    'Non-Alcoholic Drinks',
    'Alcoholic Drinks',
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _checkMenuFound = _menusService.getInfo('qrq');
  }

  @override
  Widget build(BuildContext context) {


    double windowHeight = MediaQuery.of(context).size.height;
    double windowWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: Colors.white10,
        body: Container(
          decoration: BoxDecoration(
                color: Colors.red,
                image: DecorationImage(
                    image: AssetImage('assets/images/sefler-menu-bg2.jpg'),
                    fit: BoxFit.cover,
                    colorFilter: new ColorFilter.mode(primaryColorDark.withOpacity(.8), BlendMode.srcOver),
                )
            ),
        //  child: _menuCategoryPage(context),
          child: FutureBuilder(
            future: _checkMenuFound,
            builder: (ctx, snapshot) {
              print(snapshot.data);

              if(snapshot.hasData){
                if(snapshot.data == true)
                  return _menuCategoryPage(context);
                else

                return Center(child: Text('No Data Found'),);
              }
              else {
                return  Center(child: CircularProgressIndicator(),);
              }
            },
          ),
        )
    );
  }



  Widget _menuCategoryPage(context) {

    double windowHeight = MediaQuery.of(context).size.height;
    double windowWidth = MediaQuery.of(context).size.width;

    return  Column(
      children: [
        Row(
          children: [
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(top: 40),
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
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
            Container(
                margin: EdgeInsets.only(top: windowHeight * 0.05 ),
                child: Text('Indigo Bar',  style: TextStyle(fontWeight: FontWeight.bold,  fontSize: 40, color: Colors.white.withOpacity(0.7)))),
          ],
        ),
        Expanded(
          child: CarouselSlider(
            scrollDirection: Axis.vertical,
            // height: 100,
            viewportFraction: 0.2,
            aspectRatio: 1.0,
            // aspectRatio: 2.0,
            // viewportFraction: 0.9,
            initialPage: 0,
            enableInfiniteScroll: false,
            autoPlay: false,
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            onPageChanged: (index) {
              setState(() {
                pageIndex = index;
              });
            },

            items: categoryMenuList.map((index) {
              return Builder(
                builder: (BuildContext context) {
                  return _category(context, index);
                },
              );
            }).toList(),
          ),
        ),
      ],
    );
  }




  Widget _category(context, index) {


    double windowHeight = MediaQuery.of(context).size.height;
    double windowWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> MenuCategoryDetailScreen()));
        //print('print here');
        },
      child: Container(
        //height: 300,
        margin: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white10,
          borderRadius: BorderRadius.all( Radius.circular(20)),
        ),
        child: GestureDetector(
          child: Center(
            child: Text(' $index',  style: TextStyle(color: Colors.white, fontSize: 20,)),
          ),
        ),
      ),
    );
  }


}