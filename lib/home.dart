import 'dart:convert';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vikretag/changelanguage.dart';
import 'package:vikretag/model/updateprofile.dart';
import 'package:vikretag/product.dart';

import 'About us.dart';
import 'My Address.dart';
import 'feedback.dart';
import 'feedback1.dart';
import 'help.dart';
import 'main.dart';
import 'model/items.dart';
import 'model/subcat.dart';
import 'model/vendor.dart';
import 'model/vendor.dart';
import 'order.dart';
import 'search.dart';
import 'splash screen.dart';
import 'user profile.dart';
import 'user support.dart';
import 'package:http/http.dart' as http;
import 'util/constant.dart';
import 'dart:convert';
import 'dart:io';
void main(List<String> args)
{
  runApp(new MaterialApp(
    debugShowCheckedModeBanner:false,
  ));
}
class MyApp5 extends StatefulWidget{
  final String user_id;

  MyApp5({Key? key,required this.user_id}):super(key:key);
  @override
  _MyAppState createState()=>_MyAppState();

}
class _MyAppState extends State<MyApp5> {
  late String user_id,
      phone = "8269055504",
      Name = "kharid dar",
      img,
      name,
      item;
  late String h, n, m, l, p, a;
  late int pp;

  List<Vender>list5 = [];
  List<Category>list = [];
  List<Subcategory>list1 = [];
  var list2 = [];
  var list4=[];
  List<String>list3 = [];


  final _scaffoldKey = GlobalKey<ScaffoldState>();

  Future<updateprofile> fetchAlbum() async {
    var response = await http
        .get(Uri.parse(
        'http://vikretag.com/API/index.php/user/?user_id=' + widget.user_id));
    // Name=updateprofile.fromJson(json.decode(response.body)).name;
    if (response.statusCode == 200) {
      user_id = updateprofile
          .fromJson(json.decode(response.body))
          .user_id;
      phone = updateprofile
          .fromJson(json.decode(response.body))
          .phone;
      Name = updateprofile
          .fromJson(json.decode(response.body))
          .name;

      list4.insert(0,Name);
      list4.insert(1,phone);
//print(phone);


      // If the server did return a 200 OK response,
      // then parse the JSON.
    } else {
      Fluttertoast.showToast(
          msg: "k",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.white,
          textColor: Colors.black,
          fontSize: 16.0
      );
    }
    return updateprofile.fromJson(jsonDecode(response.body));
    // If the server did not return a 200 OK response,
    // then throw an exception.
  }

  void initState() {
    super.initState();
    fetchAlbum();
    get_category();
    get_category1();
    get_category3();
    name = Name;
  }

  get_category() async {
    //
    // print('apį');
    var response = await http.get(
        Uri.parse('http://vikretag.com/API/index.php/Product/category'));

    print('response=========$response');
    if (response.statusCode == 200) {
      setState(() {

      });
      list.clear();
      list.addAll(categoryitems
          .fromJson(json.decode(response.body))
          .category);

      String listr = jsonEncode(list[0].toJson());
      print(listr);
      final k = json.decode(listr);
      h = k['img'];
      n = k['name'];
      print(n);
      //print(h);
      // _loder=true;


      listr = jsonEncode(list[1].toJson());
      print(listr);
      final kh = json.decode(listr);
      m = kh['img'];
      l = kh['name'];

      print(l);
      //print(h);
      // _loder=true;


      listr = jsonEncode(list[2].toJson());
      print(listr);
      final kj = json.decode(listr);
      a = kj['img'];
      p = kj['name'];
      print(l);
      //print(h);
      // _loder=true;


    } else {

    }
    return Category.fromJson(json.decode(response.body));
  }

  get_category1() async {
    //
    // print('apį');
    var response = await http.get(Uri.parse(
        'http://vikretag.com/API/index.php/Product/subcategory?category_id=1'));

    print('response=========$response');
    if (response.statusCode == 200) {
      setState(() {

      });
      list1.clear();
      list1.addAll(sub
          .fromJson(json.decode(response.body))
          .subcategory);

      String listr1 = jsonEncode(list1[0].toJson());
      final kj = json.decode(listr1);
      list2.insert(0, kj['img']);
      list3.insert(0, kj['name']);
      print(list2[0]);

      listr1 = jsonEncode(list1[1].toJson());
      final kux = json.decode(listr1);
      list2.insert(1, kux['img']);
      list3.insert(1, kux['name']);

      listr1 = jsonEncode(list1[2].toJson());
      final ke = json.decode(listr1);
      list2.insert(2, ke['img']);
      list3.insert(2, ke['name']);

      listr1 = jsonEncode(list1[3].toJson());
      final kef = json.decode(listr1);
      list2.insert(3, kef['img']);
      list3.insert(3, kef['name']);

      listr1 = jsonEncode(list1[4].toJson());
      final item = json.decode(listr1);
      list2.insert(4, item['img']);
      list3.insert(4, item['name']);

      listr1 = jsonEncode(list1[5].toJson());
      final kww = json.decode(listr1);
      list2.insert(5, kww['img']);
      list3.insert(5, kww['name']);

      listr1 = jsonEncode(list1[6].toJson());
      final q = json.decode(listr1);
      list2.insert(6, q['img']);
      list3.insert(6, q['name']);


      //print(h);
      // _loder=true;


    } else {

    }
    return Subcategory.fromJson(json.decode(response.body));
  }

  get_category3() async {
    //
    // print('apį');
    var response = await http.get(
        Uri.parse(
            'http://vikretag.com/API/index.php/User/nearByVender?lat=23.384482&log=76.1680985&user_id=11'));

    print('response=========$response');
    print('j');
    if (response.statusCode == 200) {
      setState(() {

      });
      print('j');
      _map();
      Text("k");
      pp = 1;
      list5.clear();
      list5.addAll(vendor
          .fromJson(json.decode(response.body))
          .vender);
    } else {
      pp = 0;
      print("k");
    }
    return Vender.fromJson(json.decode(response.body));
  }


  @override
  Widget build(BuildContext context) {
    //final screenwidth=MediaQuery.of(context).size.width;
    //final safearea=MediaQuery.of(context).padding.left+MediaQuery.of(context).padding.right;
    //final blocksizehorizontal=screenwidth/100;
    //final m=(screenwidth-safearea)/100;
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        titleSpacing: 15,
        leading: GestureDetector(
          onTap: () {
            get_category1();
            _scaffoldKey.currentState!.openDrawer();
          },
          child: Icon(Icons.menu, color: primaryColor,),

        ),

        title: Text("Change Location",
            style: TextStyle(color: Colors.black, fontSize: 14)),
        // bottom: PreferredSize(child:Center(
        //   child: Container(width: size.width*0.7,height: 30,margin: EdgeInsets.only(bottom: 10),
        //   decoration: BoxDecoration(
        //     borderRadius: BorderRadius.circular(12),
        //     color: Colors.white,
        //     border: Border.all(color: defaultColor)
        //   ),
        //    child:Row(
        //      children: [
        //        Icon(Icons.search),
        //        title(_currLanguageClass.search,color: defaultColor),
        //      ],
        //    ),
        //   ),
        // ) ,preferredSize: Size.fromHeight(40),),

        actions: [


          IconButton(
            onPressed: () {
              get_category3();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => search()),
              );
            },
            icon: Icon(
              Icons.edit_location_outlined,
              color: Colors.black,
            ),

          ),


          IconButton(


            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => search()),
              );
            },
            icon: Icon(
              Icons.search,
              color: primaryColor,
            ),

          ),


          Container(
            width: 90,
            height: 40,
            child: FittedBox(
              fit: BoxFit.contain,
              child: Image.asset('assest/logo.png'),
            ),
          ),
          SizedBox(width: 10),
          // IconButton(
          //     onPressed: () =>
          //         Navigator.of(context).pushNamed(MyRoutes.Cart_ROUTE),
          //     icon: Icon(
          //       Icons.shopping_cart,
          //       color: primaryColor,
          //     )),
          // IconButton(
          //     onPressed: null,
          //     icon: Icon(
          //       Icons.notifications,
          //       color: primaryColor,
          //
          //     )),

        ],
      ),

      drawer: new Drawer(
        child: ListView(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                var route = new MaterialPageRoute(
                  builder: (BuildContext context) =>
                  new userprofile(
                      user_id: widget.user_id.toString()),
                );
                Navigator.of(context).push(route);
              },
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: primaryColor,

                ),
                accountName: Text(name, style: new TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: Colors.black), textDirection: TextDirection.rtl),
                accountEmail: Text(list4[1], style: new TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: Colors.black), textDirection: TextDirection.rtl,),
                currentAccountPicture: new Container(
                  width: 1000,
                  height: 200,
                  decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black,
                    image: new DecorationImage(
                      image: new AssetImage("assest/profile.png"),

                    ),
                  ),
                ),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Order()),
                );
              },
              leading: Icon(
                Icons.shopping_cart,
                color: primaryColor,

              ),
              title: Text("My Orders",
                  style: new TextStyle(fontSize: 20, color: Colors.black)),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => address()),
                );
              },
              leading: Icon(Icons.location_city,
                  color: primaryColor),
              title: Text("My Address",
                  style: new TextStyle(fontSize: 20, color: Colors.black)),
            ),
            ListTile(
              leading: Icon(Icons.dashboard,
                  color: primaryColor),
              title: Text("Dashboard",
                  style: new TextStyle(fontSize: 20, color: Colors.black)),
            ),
            ListTile(
              leading: Icon(Icons.collections,
                  color: primaryColor),
              title: Text("Refer & Earn",
                  style: new TextStyle(fontSize: 20, color: Colors.black)),
            ),
            ListTile(
              leading: Icon(Icons.support,
                  color: primaryColor),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => help()),
                );
              },
              title: Text("Help",
                  style: new TextStyle(fontSize: 20, color: Colors.black)),
            ),
            ListTile(
              leading: Icon(Icons.language,
                  color: primaryColor),
              onTap: () {

              },
              title: Text("Change Language",
                  style: new TextStyle(fontSize: 20, color: Colors.black)),
            ),
            ListTile(
              leading: Icon(Icons.share,
                  color: primaryColor),
              title: Text("Share",
                  style: new TextStyle(fontSize: 20, color: Colors.black)),
            ),
            ListTile(
              leading: Icon(Icons.support,
                color: primaryColor,),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => user()),
                );
              },
              title: Text("User Support",
                  style: new TextStyle(fontSize: 20, color: Colors.black)),
            ),
            ListTile(

              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              leading: Icon(Icons.ac_unit,
                  color: primaryColor),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => GettingStartedScreen()),
                );
              },
              title: Text("About Us",
                  style: new TextStyle(fontSize: 20, color: Colors.black)),
            ),
            ListTile(
              leading: Icon(Icons.feedback,
                  color: primaryColor),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => feed()),
                );
              },
              title: Text("Feeback",
                  style: new TextStyle(fontSize: 20, color: Colors.black)),
            ),
            ListTile(
              leading: Icon(Icons.logout,
                  color: Colors.red),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyApp()),
                );
              },
              title: Text("SignOut",
                  style: new TextStyle(fontSize: 20, color: Colors.red)),
            ),
          ],
        ),
      ),

      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(

          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            Padding(
              padding: EdgeInsets.only(top: 50, left: 0),
              child: Text(' Categories',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.justify),
            ),
            Padding(
              padding: EdgeInsets.only(top: 30, left: 0),
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: 130,
                    height: 150,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: primaryColor, width: 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => product()),);
                        },
                        child: Center(
                          child: Column(
                            children: <Widget>[

                              Image.network(
                                'http://vikretag.com/API/uploads/' + list2[0],
                                height: 120,
                                width: 130,),
                              Text(n),

                            ],

                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 130,
                    height: 150,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: primaryColor, width: 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => product()),);
                        },
                        child: Center(
                          child: Column(
                            children: <Widget>[


                              Image.network(
                                "http://vikretag.com/API/uploads/" + m,
                                height: 120,
                                width: 130,),
                              Text(l),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 130,
                    height: 150,

                    child: Card(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: primaryColor, width: 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => product()),);
                        },
                        child: Center(
                          child: Column(
                            children: <Widget>[

                              Image.network(
                                  'http://vikretag.com/API/uploads/' + a,
                                  height: 120,
                                  width: 130),
                              Text(p),

                            ],
                          ),
                        ),
                      ),
                    ),

                  ),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.only(top: 50, left: 0),
              child: Text(' Sub Categories',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.justify),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[

                  Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 0, left: 20),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => product()),
                            );
                          },
                          child: Container(
                            height: 150,
                            width: 80,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              image: DecorationImage(
                                image: NetworkImage(
                                    'http://vikretag.com/API/uploads/' +
                                        list2[0]),
                                fit: BoxFit.cover,
                              ),
                              border: Border.all(
                                color: primaryColor,
                                width: 1,
                              ),
                            ), //borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 0, left: 20),
                        child: Text(list3[0]),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 0, left: 20),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => product()),
                            );
                          },
                          child: Container(
                            height: 150,
                            width: 80,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              image: DecorationImage(
                                image: NetworkImage(
                                    'http://vikretag.com/API/uploads/' +
                                        list2[1]),
                                fit: BoxFit.cover,
                              ),
                              border: Border.all(
                                color: primaryColor,
                                width: 1,
                              ),
                              //borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 0, left: 20),
                        child: Text(list3[1]),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 0, left: 20),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => product()),
                            );
                          },
                          child: Container(
                            height: 150,
                            width: 80,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              image: DecorationImage(
                                image: NetworkImage(
                                    'http://vikretag.com/API/uploads/' +
                                        list2[2]),
                                fit: BoxFit.cover,
                              ),
                              border: Border.all(
                                color: primaryColor,
                                width: 1,
                              ),
                              //borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 0, left: 20),
                        child: Text(list3[2]),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 0, left: 20),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => product()),
                            );
                          },
                          child: Container(
                            height: 150,
                            width: 80,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              image: DecorationImage(
                                image: NetworkImage(
                                    'http://vikretag.com/API/uploads/' +
                                        list2[3]),
                                fit: BoxFit.cover,
                              ),
                              border: Border.all(
                                color: primaryColor,
                                width: 1,
                              ),
                              //borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 0, left: 20),
                        child: Text(list3[3]),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 0, left: 20),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => product()),
                            );
                          },
                          child: Container(
                            height: 150,
                            width: 80,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              image: DecorationImage(
                                image: NetworkImage(
                                    'http://vikretag.com/API/uploads/' +
                                        list2[4]),
                                fit: BoxFit.cover,
                              ),
                              border: Border.all(
                                color: primaryColor,
                                width: 1,
                              ),
                              //borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 0, left: 20),
                        child: Text(list3[4]),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 0, left: 20),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => product()),
                            );
                          },
                          child: Container(
                            height: 150,
                            width: 80,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              image: DecorationImage(
                                image: NetworkImage(
                                    'http://vikretag.com/API/uploads/' +
                                        list2[5]),
                                fit: BoxFit.cover,
                              ),
                              border: Border.all(
                                color: primaryColor,
                                width: 1,
                              ),
                              //borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 0, left: 20),
                        child: Text(list3[5]),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 10, left: 20),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => product()),
                            );
                          },
                          child: Container(
                            height: 150,
                            width: 80,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              image: DecorationImage(
                                image: NetworkImage(
                                    'http://vikretag.com/API/uploads/' +
                                        list2[6]),
                                fit: BoxFit.cover,
                              ),
                              border: Border.all(
                                color: primaryColor,
                                width: 1,
                              ),
                              //borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 0, left: 20),
                        child: Text(list3[6]),
                      ),
                    ],
                  ),
                ],
              ),
            ),
      Padding(
        padding: EdgeInsets.only(top: 30, left: 20),
child:Text("Sorry no vertag found near you",style: new TextStyle(fontSize: 20, color: Colors.red)),
      ),
          ],
        ),
      ),

    );
  }

  Widget _map() {

      return Padding(
        padding: EdgeInsets.only(top: 30, left: 20),
        child: Text("no vikretag found near you"),

      );

    }



  }





