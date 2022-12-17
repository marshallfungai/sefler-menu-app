import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants/globals.dart';
import '../http/httpRestaurant.dart';
import '../screens/screens.dart';
import '../services/MenusService.dart';
import '../style.dart';

class MenuCategoryScreen extends StatefulWidget {
  final restaurantDataURL;
  MenuCategoryScreen({this.restaurantDataURL});

  @override
  _MenuCategoryScreenState createState() => _MenuCategoryScreenState();
}

class _MenuCategoryScreenState extends State<MenuCategoryScreen> {
  MenusService _menusService = new MenusService();
  late Future<bool> _checkMenuFound;

  var pageIndex = 0;
  late Box<dynamic> menuBox;
  late List<dynamic> categoryMenuList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //_checkMenuFound = processMenuData();
    //print('we are here');
  }

  Future<List> processMenuData() async {
    menuBox = await Hive.openBox('restaurantDataURL');
    List catList = await _menusService.getCatList(
        restaurantDataURL: widget.restaurantDataURL, HiveBox: menuBox);
    return catList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white10,
        body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.black,
          ),
          child: FutureBuilder(
            future: processMenuData(),
            builder: (ctx, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (snapshot.connectionState == ConnectionState.none &&
                  snapshot.data == null) {
                return const Center(
                  child: Text(
                    'No Data Found 1',
                    style: TextStyle(color: Colors.white),
                  ),
                );
              }

              if (snapshot.connectionState == ConnectionState.done &&
                  snapshot.data == false) {
                return const Center(
                  child: Text(
                    'No Data Found 2',
                    style: TextStyle(color: Colors.white),
                  ),
                );
              }
              return _menuCategoryPage(context, snapshot.data);
            },
          ),
        ));
  }

  Widget _menuCategoryPage(context, categoryList) {
    double windowHeight = MediaQuery.of(context).size.height;
    double windowWidth = MediaQuery.of(context).size.width;
    final FixedExtentScrollController _controller =
        FixedExtentScrollController();

    return Column(
      children: [
        Container(
          child: Row(
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
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      if (widget.restaurantDataURL.contains('reload')) {
                        Navigator.pop(context);
                      } else {
                        launchUrl(Uri.parse(indigoWebsite));
                      }
                    },
                  ),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(
                      top: windowHeight * 0.05, left: windowWidth * 0.1),
                  child: Text(restaurantName,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.white.withOpacity(0.7)))),
            ],
          ),
        ),
        Container(
          height: windowHeight * .25,
          width: windowWidth * .9,
          margin: EdgeInsets.only(top: 10),
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              image: DecorationImage(
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(.5), BlendMode.srcOver),
                  image: AssetImage(tempBannerBG),
                  fit: BoxFit.cover)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                restaurantName,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 13.0,
                ),
              ),
              Text(
                restaurantDesc,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.6),
                  fontSize: 16.0,
                ),
              ),
              Divider(
                color: Colors.white.withOpacity(0.1),
              ),
              Row(
                children: [
                  const Text(
                    'Open : ',
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    open_time + ' - ' + close_time,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 11.0,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: categoryList.length,
            itemBuilder: (BuildContext context, int index) {
              return _category(context, categoryList[index]);
            },
          ),
        ),
      ],
    );
  }

  Widget _category(context, menuCat) {
    double windowHeight = MediaQuery.of(context).size.height;
    double windowWidth = MediaQuery.of(context).size.width;

    String menu_name = menuCat['name'];
    int menuCat_id = menuCat['id'];
    String menu_desc = "menuCat['description']";
    List<int> with_subcategories = [38, 36, 40, 143, 210, 163];

    return GestureDetector(
      onTap: () {
        if (with_subcategories.contains(menuCat_id)) {
          String api = widget.restaurantDataURL +
              '&reload&parent=' +
              menuCat_id.toString();
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      MenuCategoryScreen(restaurantDataURL: api)));
        } else {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MenuCategoryDetailScreen(
                      menuCat_id: menuCat_id, menuName: menu_name)));
        }
      },
      child: Container(
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
              width: windowWidth * 0.8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(menu_name,
                      style:
                          const TextStyle(color: Colors.white, fontSize: 20)),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.white.withOpacity(0.6),
            )
          ],
        ),
      ),
    );
  }

  String getCapitalizeString({required String str}) {
    var words = str.split(" ");
    var newWords = words.map<String>((word) {
      return word[0].toUpperCase() + word.substring(1);
    });
    return newWords.join(' ');
  }
}
