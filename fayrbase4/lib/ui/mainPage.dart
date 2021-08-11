import 'dart:ui';
import 'package:fayrbase4/db_helper/picture.dart';
import 'package:http/http.dart' as http;
import 'package:fayrbase4/IkkinchiPage.dart';
import 'package:fayrbase4/db_helper/dataBase_Helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List image = [1,2,3,4,5,6,7,8,9,10];
  List name = ["Colofdute","Lego Sipider _Kid","Pakahontis","PUB","Contire Stirice"];

 int? number = 10;
  DatabaseHelper? databaseHelper;
  List imageMemory = [];
 List images = [];
  List titleMemory = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var birinchi = "https://media.istockphoto.com/vectors/search-icon-red-background-square-white-line-vector-illustration-vector-id928656206?k=6&m=928656206&s=170667a&w=0&h=UxXNw0W7opDMYHBhO9WHOgi1DSYEQsd1VjlsXO1vRu4=";
   var ikkinchi = "https://previews.123rf.com/images/faysalfarhan/faysalfarhan1710/faysalfarhan171018613/88988388-home-icon-isolated-on-elegant-red-round-button-abstract-illustration.jpg";
     var uchinchi = "https://i.ya-webdesign.com/images/a-3d-cube-png-10.png";
    var tortinchi = "https://yt3.ggpht.com/a/AATXAJz19VwXcakGRmNdbEZuBTRbFwP88rt-08JJ9-Ak=s900-c-k-c0xffffffff-no-rj-mo";
    var beshinchi  = "https://st3.depositphotos.com/4326917/12569/v/950/depositphotos_125690640-stock-illustration-home-silhouette-illustration-white-icon.jpg";
    var bir =  "https://i.ytimg.com/vi/pG9oMU-7Tus/maxresdefault.jpg";
    var ikki = "https://images.hdqwalls.com/download/spider-verse-ps4-dlc-4k-u4-1080x2280.jpg";
    var uch = "https://i.ytimg.com/vi/t2g2uC8NqSU/maxresdefault.jpg";
    var tor =  "https://1.bp.blogspot.com/-6fRBW29kUUM/Xdkzfbu2mrI/AAAAAAAAAPQ/Bcvt4RoSjOAZ2RCf1WQpe5qxJMXRS6UcQCLcBGAsYHQ/s1600/941883.jpg";
    var besh =  "https://cdn.hipwallpaper.com/i/92/87/Yv0xFQ.jpg";
 List images = [
   bir,
   ikki,
   uch,
   tor,
   besh,
 ];
    imageMemory = [
      bir,
      ikki,
      uch,
      tor,
      besh,
      birinchi,
      ikkinchi,
      uchinchi,
      tortinchi,
      beshinchi,
    ];


    titleMemory = <Picture>[];
    databaseHelper = DatabaseHelper();

    rasmSaqla();




  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Container(
        height: 795,
        child: FutureBuilder<List<Picture>>(
          future: databaseHelper!.getPictures(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return snapshot.data!.length != 0
                  ?

              Container(
                child: Column(
                  children: [
                    Row(children: [
                      Container(
                        margin: EdgeInsets.only(top: 30,left: 30),
                        height: 60,
                        width: 180,
                        child: Stack(
                          children: [
                            Container(
                              margin: EdgeInsets.all( 5.0),
                              child: CircleAvatar(
                                backgroundImage: NetworkImage("https://media.istockphoto.com/vectors/search-icon-red-background-square-white-line-vector-illustration-vector-id928656206?k=6&m=928656206&s=170667a&w=0&h=UxXNw0W7opDMYHBhO9WHOgi1DSYEQsd1VjlsXO1vRu4="),
                                radius: 30,
                              ),

                            ),
                            Container(
                              margin: EdgeInsets.only(top: 12,left: 70,),
                              child: Text("Search",style: TextStyle(color: Colors.black54,fontSize: 25.0),),
                            )

                          ],
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 25,left: 100),
                        width: 80,
                        height: 90,

                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image:NetworkImage("https://i.pinimg.com/736x/a5/d7/e0/a5d7e0a91bffcc23d74ee76cc0d6e893--vector-character-illustration.jpg"),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(20)
                        ),
                      ),


                    ],),

                    Container(
                      margin: EdgeInsets.only(left: 30,top: 100),
                      child: Row(
                        children: [
                          Container(
                            child: Text(
                              name[0],style: TextStyle(
                              fontSize: 30,fontWeight: FontWeight.bold,
                            ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 100),
                            height: 100,
                            width: 80,
                            child: Image.memory(snapshot.data![7].picture!),),


                        ],

                      ),
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width,
                      height:420,
                      child:  StaggeredGridView.countBuilder(

                        padding: const EdgeInsets.all(30),
                        scrollDirection: Axis.horizontal,
                        crossAxisCount: 1,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 50,
                        itemCount:5,
                        itemBuilder: (BuildContext context, int index) =>
                            Container(

                             width:MediaQuery.of(context).size.width ,
                              height: image[index] % 2 == 0 ? 380 : 250,
                              child: Stack(
                                children: [
                                  Column(

                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(left: 20.0,top: 15,),
                                            child: OutlinedButton(

                                              style: OutlinedButton.styleFrom(backgroundColor: Colors.black54),
                                              onPressed: (){}, child: Text(
                                              "1.5k Playing",style: TextStyle(
                                                color: Colors.white),
                                            ),),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(right: 20.0,top: 15,),
                                            child: OutlinedButton(
                                              style: OutlinedButton.styleFrom(backgroundColor: Colors.orange),
                                              onPressed: () {  },
                                              child: Text(
                                                "Live",style: TextStyle(color: Colors.white),),

                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                            top:image[index] % 2 == 0 ? 240 : 100,left: 20,right: 20 ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              children: [
                                                Container(


                                                  child:   Text(
                                                    "Lego",style: TextStyle(color: Colors.white,fontSize: 25,),),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.only(left: 10),
                                                  child:Text("  Spider - Kid",style: TextStyle(color: Colors.white,fontSize: 25),),
                                                ),


                                              ],
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(left: 37),
                                              child: CircleAvatar(
                                                backgroundImage:MemoryImage(
                                                    snapshot.data![8].picture!),
                                             radius: 25,
                                              ),
                                            ),
                                          ],
                                        ),)
                                    ],
                                  )
                                ],
                              ),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: MemoryImage(snapshot.data![index].picture!),fit: BoxFit.cover),
                                  borderRadius: BorderRadius.circular(40)),

                            ),

                        staggeredTileBuilder: (int index) => StaggeredTile.fit(2),
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 20),
                          child: CircleAvatar(
                            backgroundImage: MemoryImage(snapshot.data![6].picture!,), radius: 30,),

                          ),


                        InkWell(
                          child: Container(
                            margin: EdgeInsets.only(left: 20),
                            child: Text(
                              "Home",style: TextStyle(
                                color: Colors.black,fontSize: 20),
                            ),
                          ),
                          onTap: (){
                            Navigator.pushReplacement(
                                context, MaterialPageRoute(
                                builder: (context)=>MainPage()));
                          },
                        ),
                        Container(

                            height: 40,
                            margin: EdgeInsets.only(left: 120),
                            child: Icon(Icons.tv_rounded,size: 40,color: Colors.black38,)
                        ),
                        Container(
                            height: 40,
                            child: Icon(Icons.ad_units_outlined,size: 40,color: Colors.black38)
                        ),
                        Container(
                            height: 40,
                            child: Icon(Icons.account_circle,size: 40,color: Colors.black38)
                        ),
                      ],
                    )
                  ],
                ),

              )
                  : CircularProgressIndicator();
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),

    );
  }
  Future rasmSaqla() async {
    for(var i = 0; i<imageMemory.length;i++){
      var image = await http.get(
        Uri.parse(imageMemory[i]),
      );
      var bytes = image.bodyBytes;



      Picture picture = Picture(picture: bytes );

      databaseHelper!.savePicture(picture);
      print("YOZILGAN PICTURE: " + picture.toString());
      print("rasimmi saqla    ishladi");

    }
    setState(() {});
  }
  Future Saqla() async {
    for(var i = 0; i<images.length;i++){
      var image = await http.get(
        Uri.parse(imageMemory[i]),

      );
      var bytes = image.bodyBytes;



      Picture picture = Picture(picture: bytes);

      databaseHelper!.savePicture(picture);
      print("YOZILGAN PICTURE: " + picture.toString());
      print("rasimmi saqla    ishladi");

    }
    setState(() {});
  }

}