import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:staggered_view/models/globals.dart';
import 'package:staggered_view/view/screens/carouselview.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      "/": (context) => Strageview(),
      "carousel": (context) => CarouselView(),
    },
    // home: Strageview(),
  ));
}

class Strageview extends StatefulWidget {
  const Strageview({super.key});

  @override
  State<Strageview> createState() => _StrageviewState();
}

class _StrageviewState extends State<Strageview> {
  @override
  Widget build(BuildContext context) {
    return
        // Scaffold(
        //   appBar: AppBar(title: Text("Stragged View")),
        //   body: SingleChildScrollView(
        //     child: Padding(
        //       padding: const EdgeInsets.all(8.0),
        //       child: StaggeredGrid.count(
        //         crossAxisCount: 4,
        //         mainAxisSpacing: 2,
        //         crossAxisSpacing: 10,
        //         children: [
        //           StaggeredGridTile.count(
        //             crossAxisCellCount: 2,
        //             mainAxisCellCount: 3,
        //             child: Container(
        //                 padding: EdgeInsets.all(10),
        //                 decoration: BoxDecoration(
        //                     borderRadius: BorderRadius.circular(20),
        //                     color: Colors.grey),
        //                 child: Column(
        //                   children: [
        //                     Container(
        //                         height: 270,
        //                         decoration: BoxDecoration(
        //                             borderRadius: BorderRadius.circular(20),
        //                             color: Colors.blue),
        //                         child: Image.network(
        //                             "https://images.pexels.com/photos/1770809/pexels-photo-1770809.jpeg?auto=compress&cs=tinysrgb&w=800",
        //                             fit: BoxFit.contain)),
        //                     Text(
        //                       "Nature",
        //                       style: TextStyle(
        //                           fontSize: 20, fontWeight: FontWeight.w700),
        //                     ),
        //                   ],
        //                 )),
        //             // child: Tile(index:1),
        //           ),
        //           StaggeredGridTile.count(
        //             crossAxisCellCount: 2,
        //             mainAxisCellCount: 2,
        //             child: Container(
        //                 padding: EdgeInsets.all(10),
        //                 decoration: BoxDecoration(
        //                     borderRadius: BorderRadius.circular(20),
        //                     color: Colors.amber),
        //                 child: Column(
        //                   children: [
        //                     GestureDetector(
        //                       onTap: () {
        //                         Navigator.pushNamed(context, "carousel");
        //                       },
        //                       child: Container(
        //                           height: 165,
        //                           width: double.infinity,
        //                           decoration: BoxDecoration(
        //                             borderRadius: BorderRadius.circular(20),
        //                             // color: Colors.blue
        //                           ),
        //                           child: Image.network(
        //                               "https://images.pexels.com/photos/584165/pexels-photo-584165.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
        //                               fit: BoxFit.fill)),
        //                     ),
        //                     Text(
        //                       "Animals",
        //                       style: TextStyle(
        //                           fontSize: 20, fontWeight: FontWeight.w700),
        //                     ),
        //                   ],
        //                 )),
        //           ),
        //           StaggeredGridTile.count(
        //             crossAxisCellCount: 2,
        //             mainAxisCellCount: 3,
        //             child: Container(
        //                 padding: EdgeInsets.all(10),
        //                 decoration: BoxDecoration(
        //                     borderRadius: BorderRadius.circular(20),
        //                     color: Colors.red),
        //                 child: Column(
        //                   children: [
        //                     Container(
        //                         height: 270,
        //                         width: double.infinity,
        //                         decoration: BoxDecoration(
        //                           borderRadius: BorderRadius.circular(20),
        //                           // color: Colors.blue
        //                         ),
        //                         child: Image.network(
        //                             "https://images.pexels.com/photos/210243/pexels-photo-210243.jpeg?auto=compress&cs=tinysrgb&w=800",
        //                             fit: BoxFit.fill)),
        //                     Text(
        //                       "Mountains",
        //                       style: TextStyle(
        //                           fontSize: 20, fontWeight: FontWeight.w700),
        //                     ),
        //                   ],
        //                 )),
        //           ),
        //           StaggeredGridTile.count(
        //             crossAxisCellCount: 2,
        //             mainAxisCellCount: 2,
        //             child: Container(
        //               color: Colors.red,
        //             ),
        //           ),
        //           StaggeredGridTile.count(
        //             crossAxisCellCount: 4,
        //             mainAxisCellCount: 2,
        //             child: Container(
        //               color: Colors.black,
        //             ),
        //           ),
        //         ],
        //       ),
        //     ),
        //   ),
        // );
        Scaffold(appBar: AppBar(title: Text("Stragged View"),backgroundColor: Colors.black,),
        backgroundColor: Colors.blueGrey,
        body:  MasonryGridView.builder(
            padding: EdgeInsets.all(10),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            physics: BouncingScrollPhysics(),
            itemCount: categories.length,
            gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemBuilder: (context, i) {
              return Stack(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, 'carousel',
                          arguments: categories[i]);
                    },
                    child: Column(
                      children: [
                        Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            Container(
                              height: categories[i]['height'],
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.white,
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(
                                    categories[i]["image"],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              height: 40,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(15),
                                      bottomRight: Radius.circular(15)),
                                  color: Colors.grey.shade300),
                              child: Text(
                                "${categories[i]['name']}",
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          ],
                        ),
                        // Text(
                        //   "${categories[i]['name']}",
                        //   style: TextStyle(
                        //     color: Colors.blue,
                        //     fontSize: 30,
                        //     fontWeight: FontWeight.bold,
                        //   ),
                        // ),
                        SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                  ),
                  // GestureDetector(
                  //   onTap: () {
                  //     Navigator.pushNamed(context, 'detailpage',
                  //         arguments: categories[i]);
                  //   },
                  //   child: ClipRRect(
                  //     borderRadius: BorderRadius.only(
                  //       topLeft: Radius.circular(15),
                  //       topRight: Radius.circular(15),
                  //     ),
                  //     child: Container(alignment: Alignment.bottomCenter,
                  //       child: Text(categories[i]["name"],style: TextStyle(fontSize: 14),)),
                  //     // Image(
                  //     //   image: NetworkImage(
                  //     //     categories[i]['image'],),
                  //     //   fit: BoxFit.fill,
                  //     // ),
                  //   ),
                  // ),
                ],
              );
            }),);
   
  }
}
