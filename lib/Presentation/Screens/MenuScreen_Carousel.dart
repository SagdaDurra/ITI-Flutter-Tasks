import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:iti_flutter/Core/Images/images_path.dart';
import 'package:pinch_zoom/pinch_zoom.dart';


class MenuscreenCarousel extends StatefulWidget{
  const MenuscreenCarousel({super.key});
  @override
  State<MenuscreenCarousel> createState() => _MenuscreenCarouselState();
}

class _MenuscreenCarouselState extends State<MenuscreenCarousel> {

  List <Widget>? images = [Image.asset(ImagesPath.burger2 , fit: BoxFit.cover) , Image.asset(ImagesPath.pizza2 ,fit: BoxFit.cover) , Image.asset(ImagesPath.chicken2 ,fit: BoxFit.cover) , Image.asset(ImagesPath.cake2 , fit: BoxFit.cover) , Image.asset(ImagesPath.drinks2, fit: BoxFit.cover)];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu' , style: TextStyle(color: Colors.black , fontSize: 40 , fontWeight: FontWeight.bold), ),
      ),

      body: Column(
        children: [
          //Center(
          //  // carousel_slider: ^5.1.2 in pubsec.yaml
          //   child: CarouselSlider(
          //      options: CarouselOptions(height: 400.0),
          //      // this makes every photo in a sperated card
          //     // if i write like this ---->  body: Center(
          //     //         child: CarouselSlider(
          //     //           options: CarouselOptions(
          //     //             height: 400.0,
          //     //           ),
          //     //           items: images,
          //     //         ),
          //     //       ),
          //     //     );
          //     //   }
          //     // }
          //     // this wont put every photo in a sperated card so i will use map
          //      items: images?.map((image) {
          //        return Builder(
          //          builder: (BuildContext context) {
          //            return Container(
          //              //MediaQuery.of(context).size.width
          //              // MediaQuery ---> it takes info about the device and screen
          //              // context ----> means the position of the every widget
          //              // .of(context) ---> give me the info in this position and the
          //              // area around it
          //              // .of(context).size ----> bring the size of the screen
          //              // .of(context).size.width ----> bring the width of the screen
          //                width: MediaQuery.of(context).size.width,
          //                margin: EdgeInsets.symmetric(horizontal: 5.0),
          //                decoration: BoxDecoration(
          //                    color: Colors.amber
          //                ),
          //                child: GestureDetector(
          //                    onTap: () {
          //                      showDialog(
          //                        context: context,
          //                        builder: (context) {
          //                          return Dialog(
          //                            backgroundColor: Colors.black,
          //                            child: InteractiveViewer(
          //                              child: image,
          //                            ),
          //                          );
          //                        },
          //                      );
          //                    },
          //                ),
          //                    child: PinchZoom(maxScale: 2.5,
          //                      onZoomStart: (){print('Start zooming');},
          //                      onZoomEnd: (){print('Stop zooming');},),
//
//
          //                // dont forget to remove the text not a must
          //                child: ClipRRect(
          //                borderRadius: BorderRadius.circular(20),
          //                  child:image
          //                  ,)
          //            );
          //          },
          //        );
          //      }).toList(), // to return the map as a list bc items take list type
          //    )
          //),
          Center(
            child: CarouselSlider(
              options: CarouselOptions(
                height: 400.0,
              ),

              items: images?.map((image) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),

                      decoration: BoxDecoration(
                        color: Colors.amber,
                      ),
                      // still not well explained + wants to make it again ??
                      child: GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return Dialog(
                                backgroundColor: Colors.black,

                                child: PinchZoom(
                                  maxScale: 4.0,
                                  onZoomStart: () {
                                    print('Start zooming');
                                  },
                                  onZoomEnd: () {
                                    print('Stop zooming');
                                  },
                                  child: image,
                                ),
                              );
                            },
                          );
                        },

                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: image,
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
          )

        ],
      ),
    );
  }
}
