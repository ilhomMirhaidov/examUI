import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';


class AsosoyPage extends StatefulWidget {
  const AsosoyPage({Key? key}) : super(key: key);
  @override
  _AsosoyPageState createState() => _AsosoyPageState();
}

class _AsosoyPageState extends State<AsosoyPage> {
  List image = [1,2,3,4,5,6,7,8,9,10];

  List images = [
    "https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8aHVtYW58ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80",
    "https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8aHVtYW58ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80",
    "https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8aHVtYW58ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80",
    "https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8aHVtYW58ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80",
    "https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8aHVtYW58ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StaggeredGridView.countBuilder(
        padding: const EdgeInsets.all(12.0),
        scrollDirection: Axis.horizontal,
        crossAxisCount: 2,
        mainAxisSpacing: 24,
        crossAxisSpacing: 12,
        itemCount: images.length,
        itemBuilder: (BuildContext context, int index) =>
            Container(
              height: image[index] % 2 == 0 ? 200 : 100,

              child: Image.network(images[index],fit: BoxFit.cover,),),
        staggeredTileBuilder: (int index) => StaggeredTile.fit(2),
      ),
    );
  }

}
