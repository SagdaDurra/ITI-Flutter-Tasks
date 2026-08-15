import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_flutter/Core/Images/images_path.dart';
import 'package:iti_flutter/Data/Requests/Popular_Chefs_Request.dart';
import 'package:iti_flutter/Presentation/Cubits/popular_chefs_cubit.dart';
import 'package:iti_flutter/Presentation/Screens/MenuScreen_Carousel.dart';
import 'package:iti_flutter/Presentation/Screens/OrderProgress.dart';
import 'package:iti_flutter/Presentation/Screens/PaymentScreen.dart';
import 'package:iti_flutter/Presentation/Screens/Popular_Chefs_Screen.dart';
import 'package:iti_flutter/Presentation/Screens/ProfileScreen.dart';
import 'package:iti_flutter/Presentation/Widgets/HomeCards.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:iti_flutter/Presentation/Screens/Bottomnavbar.dart';
import 'package:share_plus/share_plus.dart';



class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  // void _incrementCounter() {
  //   setState(() {
  //     _counter++;
  //   });
  // }
// Theme.of(context).colorScheme.inversePrimary ---->
  // iconTheme: IconThemeData(color: Colors.white ,) ----->
  // leading: Icon(Icons.notifications_none , color: Colors.white , size: 30,  ) ----->
  @override
  Widget build(BuildContext context) {

    // must put it in before the app bar in mobile screens but in
    // big screens we put it in the body specific in scaffold
    return Scaffold(
      // must be put in scaffold
        drawer:
        // very important to use Drawer class in this case to use its properities
          Drawer(
              width: 250,
                  child: Column(
                       mainAxisAlignment: MainAxisAlignment.start,
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children:[
                         Padding(
                             padding: EdgeInsets.only(top: 50, bottom: 20 ,left: 10 ),
                           child: Text("Menu" , style : TextStyle(color: Colors.black , fontSize: 25 , fontWeight: FontWeight.bold), )
                       ),
                         // Expanded ----> take the rest space in the drawer
                         Expanded(
                           // take width of the drawer
                           child: SizedBox(
                             width: 250,
                             child: SidebarX(
                               // extended (true)-----> makes the drawer labels appear
                               // // (false ) ---> makes the drawer labels disappear
                               // and make the icons as a column
                               //SidebarXController(selectedIndex: 0, extended: false) ---->
                               //selectedIndex: 0 ----> the item that is been selected first time
                               //opening the drawer
                               // dont have width || color
                               controller: SidebarXController(selectedIndex: 0, extended: true),
                               // to modify labels
                               theme: SidebarXTheme(
                                 textStyle: TextStyle(
                                   fontSize: 20,
                                   fontWeight: FontWeight.bold,
                                 ),
                                 // to make the icons in the left when extend is false
                                 itemPadding: const EdgeInsets.only(
                                   right: 150,
                                 ),
                               ),
                               items: [
                                  SidebarXItem(icon: Icons.home, label: 'Home'),
                                 // no const (specific in ontap || navigator) ?? ---->
                                 SidebarXItem(
                                   icon: Icons.person,
                                   label: 'Profile',
                                   onTap: () {
                                     Navigator.push(
                                       context,
                                       MaterialPageRoute(
                                         builder: (context) => Profilescreen(),
                                       ),
                                     );
                                   },),
                                 SidebarXItem(icon: Icons.menu_book,
                                   label: 'Menu',
                                   onTap: () {
                                     Navigator.push(
                                       context,
                                       MaterialPageRoute(
                                         builder: (context) => MenuscreenCarousel(),
                                       ),
                                     );
                                   },),
                                 SidebarXItem(icon: Icons.speed,
                                   label: 'Order Progress',
                                   onTap: () {
                                     Navigator.push(
                                       context,
                                       MaterialPageRoute(
                                         builder: (context) => orderprogress(),
                                       ),
                                     );
                                   },),
                                 SidebarXItem(icon: Icons.navigation_sharp,
                                   label: 'Bottom Bar',
                                  // onTap: () async {
                                  //   if (BottombarIsOpen) {
                                  //     Navigator.pop(context);
                                  //     BottombarIsOpen = false;
                                  //   } else {
                                  //     BottombarIsOpen = true;
                                  //     await Navigator.push(
                                  //       context,
                                  //       MaterialPageRoute(
                                  //         builder: (context) => BottomNavBar(),
                                  //       ),
                                  //     );
                                  //     BottombarIsOpen = false;
                                  //   }
                                  // },
                                     // dont click it more than one time
                                     // i want to know the reason of this problem?????
                                   onTap: (){
                                     Navigator.push(
                                       context,
                                       MaterialPageRoute(
                                         builder: (context) => BottomNavBar(),
                                       ),
                                     );
                                   }
                                     ),
                                 SidebarXItem(icon: Icons.bookmark, label: 'Popular Chefs',
                                   onTap: () {
                                     Navigator.push(
                                       context,
                                       MaterialPageRoute(
                                         //builder: (context) => Popular_Chefs_Model(), before blocprovider
                                         builder: (context) => BlocProvider(
                                         create: (context) => PopularChefsCubit(),
                                         child: Popular_Chefs_Model(),
                                       ),
                                       ),
                                     );
                                   },
                                 ),
                               ],
                             ),
                           ),
                         ),
                      ],
                            ),
             ),

      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text("Food App" , style: TextStyle(color: Colors.white , fontSize: 25 , fontWeight: FontWeight.bold), ) ,
        centerTitle: false,
        // make all the appbar icons white
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        // if want to control only the drawer icon
        //leading: Builder(
        //   builder: (context) {
        //     return IconButton(
        //       icon: Icon(
        //         Icons.menu,
        //         color: Colors.white,
        //       ),
        //       onPressed: () {
        //         Scaffold.of(context).openDrawer();
        //       },
        //     );
        //   },
        // ),


        // the thing i want to move it wrap it with positioned not all the parent
        actions:[
          Stack(
            children: [
              IconButton(onPressed: (){} , icon: Icon(Icons.notifications_none , color: Colors.white , size: 30,  ) ,),
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  height: 15,
                  width: 15,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                    //boxshape : shape of the container another option
                  ), //alignment: Alignment.topRight ----> doesnt work cause parent is controlling (stack)
                  child: Center (
                    child: Text("3" , style: TextStyle(color: Colors.white , fontSize: 10 , fontWeight: FontWeight.bold), ),
                  ),
                ),
              )
            ],
          ),
         //SizedBox(width: 10) ,

         //IconButton(onPressed: (){
         //  Navigator.push(context, MaterialPageRoute(builder: (context) => Profilescreen()));
         //} , icon: Icon(Icons.person_rounded , color: Colors.white , size: 30,  ) ,),

         //SizedBox(width: 10) ,

         //IconButton(onPressed: (){
         //  Navigator.push(context, MaterialPageRoute(builder: (context) => MenuscreenCarousel()));
         //} , icon: Icon(Icons.menu_book , color: Colors.white , size: 30,  ) ,),
          // this is for text there is a one for files
          //import 'package:share_plus/share_plus.dart';
          // import 'package:cross_file/cross_file.dart';
          // final params = ShareParams( text: 'Great picture',
          // files: [XFile('${directory.path}/image.jpg')], );
          // final result = await SharePlus.instance.share(params);
          // if (result.status == ShareResultStatus.success)
          // { print('Thank you for sharing the picture!');
          // still i want to study it
          IconButton(onPressed: () async {
            {
              final result = await SharePlus.instance.share(
                ShareParams(
                  text: 'Check out my Food App!',
                ),
              );
              if (result.status == ShareResultStatus.success) {
                print('Shared successfully!');
              }
            } ;
          } , icon: Icon(Icons.share , color: Colors.white , size: 30,  ) ,),

        ],


      ),

      body:
      // i will try margin later ??
      // this stack for the cart and checkout button card
      Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Material(
                    elevation: 2,
                    child: Container(
                      height: 150,
                      width: 400,
                      //color: Colors.deepPurple ---> we write color only one time,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                  color: Colors.deepPurple[400],
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: Icon(Icons.store_mall_directory_outlined , color: Colors.white , size: 70,  ),
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Delicious Restaurant" , style: TextStyle(color: Colors.black , fontSize: 20 , fontWeight: FontWeight.bold), )
                                , Row(
                                  children: [
                                    Icon(Icons.star_rate_rounded , color: Colors.amber , size: 20,  ),
                                    Text(" 4.8" , style: TextStyle(color: Colors.black , fontSize: 20 , fontWeight: FontWeight.bold), ) ,
                                    Text("  (230 reviews)" , style: TextStyle(color: Colors.grey , fontSize: 20 , fontWeight: FontWeight.bold), ) ,
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.shopping_bag_outlined , color: Colors.deepPurpleAccent , size: 20,  ),
                                    Text(" 1,250+ Orders" , style: TextStyle(color: Colors.grey , fontSize: 20 , fontWeight: FontWeight.bold), ) ,
                                  ],
                                ),
                              ],
                            ),
                          ]
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15) ,

                SizedBox(
                  height: 100,
                  child: Material(
                    elevation: 2,
                    // we will change the Listview.sperated with list view bc we will
                    // return objects from Home cards widgets (reusable widget)
                    
                    
                    //child: ListView.separated(itemBuilder: (context , index) {
                    //  return Container(
                    //      width: 100 ,
                    //      height :100 ,
                    //      decoration: BoxDecoration(
                    //        color: Colors.deepPurple[100] ,
                    //        borderRadius: BorderRadius.circular(20),
                    //      ),
                    //      margin: EdgeInsets.only(right: 10 , left: 10),
//
                    //      child:Center(
                    //        child: Column(
                    //          mainAxisAlignment: MainAxisAlignment.center, // this control the container of pizza icon and pizza text
                    //          children: [
                    //            Container(
                    //              height: 50,
                    //              width: 50,
//
                    //              decoration: BoxDecoration(
                    //                color: Colors.deepPurple[400] ,
                    //                borderRadius: BorderRadius.circular(10),
                    //                shape: BoxShape.rectangle ,
                    //              ),
                    //              child: Icon(Icons.local_pizza , color: Colors.white , size: 30,  ),
//
                    //            ),
                    //            Text("Pizza" , style: TextStyle(color: Colors.black , fontSize: 20 , fontWeight: FontWeight.bold), ) ,
                    //          ],
                    //        ),
                    //      )
                    //  ) ;
                    //}, separatorBuilder: (context , index) {
                    //  return SizedBox(width: 10) ;
                    //}, itemCount: 5 , scrollDirection: Axis.horizontal,
                    //),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        // must put photos in the pubspec.yaml
                        Homecards(childr:Image.asset("assets/images/burger.png" , fit: BoxFit.cover,) , child: Text("Burger" , style: TextStyle(color: Colors.black , fontSize: 20 , fontWeight: FontWeight.bold), )),
                        Homecards(childr:Image.asset(ImagesPath.pizza, fit: BoxFit.cover,) , child: Text("Pizza" , style: TextStyle(color: Colors.black , fontSize: 20 , fontWeight: FontWeight.bold), )),
                        Homecards(childr:Image.asset(ImagesPath.chicken ,fit: BoxFit.cover ) , child: Text("Chicken" , style: TextStyle(color: Colors.black , fontSize: 20 , fontWeight: FontWeight.bold), )),
                        Homecards(childr:Image.asset(ImagesPath.cake , fit: BoxFit.cover) , child: Text("Cake" , style: TextStyle(color: Colors.black , fontSize: 20 , fontWeight: FontWeight.bold), )),
                        Homecards(childr:Image.asset(ImagesPath.drinks , fit: BoxFit.cover) , child: Text("Drinks" , style: TextStyle(color: Colors.black , fontSize: 20 , fontWeight: FontWeight.bold), )),
                      ],
                    ),
                    
                  ),
                ),
                Column(
                  children: [
                    SizedBox(height: 15) ,
                    Align(child: Padding(child: Text("Popular Items" , style: TextStyle(color: Colors.black , fontSize: 25 , fontWeight: FontWeight.bold),  )
                      ,padding: EdgeInsets.only(left: 10),)
                      ,alignment: Alignment.centerLeft,),
                    SizedBox(height: 10) ,
                    // the list of popular items fixed
                    Material(
                      elevation: 2,
                      child: Container(
                        height: 100,
                        width: 400,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        margin: EdgeInsets.all(5),

                        child: Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                color: Colors.orange[200],
                                borderRadius: BorderRadius.circular(20),
                              ),
                              margin: EdgeInsets.all(10),
                              child: Icon(Icons.lunch_dining , color: Colors.white , size: 40,  ),
                            ),
                            SizedBox(width: 15),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Cheese Burger" , style: TextStyle(color: Colors.black , fontSize: 20 , fontWeight: FontWeight.bold), ),
                                Text("Juicy beef patty with\ncheese,lettuce,and sauce" ,style: TextStyle(color: Colors.grey , fontSize: 15 , fontWeight: FontWeight.bold),)
                              ],
                            ),
                            SizedBox(width: 35),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text("\$6.99" ,style: TextStyle(color: Colors.deepPurple , fontSize: 20 , fontWeight: FontWeight.bold),),
                                Container(
                                  margin: EdgeInsets.only(left :10),
                                  height: 40,
                                  width: 70,
                                  decoration: BoxDecoration(
                                    color: Colors.deepPurpleAccent,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child:
                                  Center(child:Text("Add" ,style: TextStyle(color: Colors.white , fontSize: 20 , fontWeight: FontWeight.bold),)),
                                ),
                              ],
                            ),

                          ],
                        ),
                      ),
                    ),

                    Material(
                      elevation: 2,
                      child: Container(
                        height: 100,
                        width: 400,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        margin: EdgeInsets.all(10),
                        child: Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                color: Colors.red[200],
                                borderRadius: BorderRadius.circular(20),
                              ),
                              margin: EdgeInsets.all(10),
                              child: Icon(Icons.local_pizza , color: Colors.white , size: 40,  ),
                            ),
                            SizedBox(width: 15),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Pepperoni Pizza" , style: TextStyle(color: Colors.black , fontSize: 20 , fontWeight: FontWeight.bold), ),
                                Text("Pizza with pepperoni\ntoppings and mozzarella" ,style: TextStyle(color: Colors.grey , fontSize: 15 , fontWeight: FontWeight.bold),)
                              ],
                            ),
                            SizedBox(width: 35),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text("\$8.99" ,style: TextStyle(color: Colors.deepPurple , fontSize: 20 , fontWeight: FontWeight.bold),),
                                Container(
                                  margin: EdgeInsets.only(left :10),
                                  height: 40,
                                  width: 70,
                                  decoration: BoxDecoration(
                                    color: Colors.deepPurpleAccent,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child:
                                  Center(child:Text("Add" ,style: TextStyle(color: Colors.white , fontSize: 20 , fontWeight: FontWeight.bold),)),
                                ),
                              ],
                            ),

                          ],
                        ),

                      ),
                    ),

                    Material(
                      elevation: 2,
                      child: Container(
                        height: 100,
                        width: 400,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        margin: EdgeInsets.all(10),
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                color: Colors.brown[200],
                                borderRadius: BorderRadius.circular(20),
                              ),
                              margin: EdgeInsets.all(10),
                              child: Icon(Icons.kebab_dining_rounded , color: Colors.white , size: 40,  ),
                            ),
                            SizedBox(width: 15),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Fried Chicken" , style: TextStyle(color: Colors.black , fontSize: 20 , fontWeight: FontWeight.bold), ),
                                Text("Crispy fried chicken\nwith special sauce" ,style: TextStyle(color: Colors.grey , fontSize: 15 , fontWeight: FontWeight.bold),)
                              ],
                            ),
                            SizedBox(width: 67),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text("\$7.49" ,style: TextStyle(color: Colors.deepPurple , fontSize: 20 , fontWeight: FontWeight.bold),),
                                Container(
                                  margin: EdgeInsets.only(left :10),
                                  height: 40,
                                  width: 70,
                                  decoration: BoxDecoration(
                                    color: Colors.deepPurpleAccent,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child:
                                  Center(child:Text("Add" ,style: TextStyle(color: Colors.white , fontSize: 20 , fontWeight: FontWeight.bold),)),
                                ),
                              ],
                            ),

                          ],
                        ),
                      ),
                    ),

                    Material(
                      elevation: 2,
                      child: Container(
                        height: 100,
                        width: 400,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        margin: EdgeInsets.all(10),
                        child: Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                color: Colors.purple[200],
                                borderRadius: BorderRadius.circular(20),
                              ),
                              margin: EdgeInsets.all(10),
                              child: Icon(Icons.cake , color: Colors.white , size: 40,  ),
                            ),
                            SizedBox(width: 15),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Chocolate Cake" , style: TextStyle(color: Colors.black , fontSize: 20 , fontWeight: FontWeight.bold), ),
                                Text("Rich chocolate cake\nwith creamy layers" ,style: TextStyle(color: Colors.grey , fontSize: 15 , fontWeight: FontWeight.bold),)
                              ],
                            ),
                            SizedBox(width: 62),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text("\$4.99" ,style: TextStyle(color: Colors.deepPurple , fontSize: 20 , fontWeight: FontWeight.bold),),
                                Container(
                                  margin: EdgeInsets.only(left :10),
                                  height: 40,
                                  width: 70,
                                  decoration: BoxDecoration(
                                    color: Colors.deepPurpleAccent,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child:
                                  Center(child:Text("Add" ,style: TextStyle(color: Colors.white , fontSize: 20 , fontWeight: FontWeight.bold),)),
                                ),
                              ],
                            ),

                          ],
                        ),
                      ),
                    ),

                    Material(
                      elevation: 2,
                      child: Container(
                        height: 100,
                        width: 400,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        margin: EdgeInsets.all(10),
                        child: Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                color: Colors.yellow[200],
                                borderRadius: BorderRadius.circular(20),
                              ),
                              margin: EdgeInsets.all(10),
                              child: Icon(Icons.local_drink_rounded , color: Colors.white , size: 40,  ),
                            ),
                            SizedBox(width: 15),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Fresh Lemonade" , style: TextStyle(color: Colors.black , fontSize: 20 , fontWeight: FontWeight.bold), ),
                                Text("Refreshing lemonade\nwith mint" ,style: TextStyle(color: Colors.grey , fontSize: 15 , fontWeight: FontWeight.bold),)
                              ],
                            ),
                            SizedBox(width: 53),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text("\$2.99" ,style: TextStyle(color: Colors.deepPurple , fontSize: 20 , fontWeight: FontWeight.bold),),
                                Container(
                                  margin: EdgeInsets.only(left :10),
                                  height: 40,
                                  width: 70,
                                  decoration: BoxDecoration(
                                    color: Colors.deepPurpleAccent,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child:
                                  Center(child:Text("Add" ,style: TextStyle(color: Colors.white , fontSize: 20 , fontWeight: FontWeight.bold),)),
                                ),
                              ],
                            ),

                          ],
                        ),
                      ),
                    ),

                  ],
                ),

                SizedBox(height: 15) ,
                Align(child: Padding(child: Text("Customer Reviews" , style: TextStyle(color: Colors.black , fontSize: 25 , fontWeight: FontWeight.bold),  )
                  ,padding: EdgeInsets.only(left: 10),)
                  ,alignment: Alignment.centerLeft,),
                SizedBox(height: 7) ,
                Material(
                  elevation: 2,
                  child: Container(
                    width: 400,
                    height: 400,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    margin: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.person_pin , color: Colors.deepPurple[400] , size: 70,  ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Mohamed Ali" , style: TextStyle(color: Colors.black , fontSize: 20 , fontWeight: FontWeight.bold), ),
                                Row(
                                  children: [
                                    Icon(Icons.star_rate_rounded , color: Colors.amber , size: 20,  ),
                                    Icon(Icons.star_rate_rounded , color: Colors.amber , size: 20,  ),
                                    Icon(Icons.star_rate_rounded , color: Colors.amber , size: 20,  ),
                                    Icon(Icons.star_rate_rounded , color: Colors.amber , size: 20,  ),
                                    Icon(Icons.star_rate_rounded , color: Colors.amber , size: 20,  ),
                                    SizedBox(width: 140) ,
                                    Text("2 days ago" , style: TextStyle(color: Colors.grey , fontSize: 15 , fontWeight: FontWeight.bold), ) ,
                                  ],
                                ),
                                Text("Very Good !" , style: TextStyle(color: Colors.grey , fontSize: 15 , fontWeight: FontWeight.bold), ) ,
                              ],

                            ),
                          ],
                        ),
                        SizedBox(height: 10) ,
                        Text("----------------------------------------------------------------------------------------------" , style: TextStyle(color: Colors.grey),),

                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.person_pin , color: Colors.deepPurple[400] , size: 70,  ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Ahmed Samy" , style: TextStyle(color: Colors.black , fontSize: 20 , fontWeight: FontWeight.bold), ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start ,
                                  children: [
                                    Icon(Icons.star_rate_rounded , color: Colors.amber , size: 20,  ),
                                    Icon(Icons.star_rate_rounded , color: Colors.amber , size: 20,  ),
                                    Icon(Icons.star_rate_rounded , color: Colors.amber , size: 20,  ),
                                    Icon(Icons.star_rate_rounded , color: Colors.amber , size: 20,  ),
                                    Icon(Icons.star_rate_rounded , color: Colors.grey , size: 20,  ),
                                    SizedBox(width: 140) ,
                                    Text("1 week ago" , style: TextStyle(color: Colors.grey , fontSize: 15 , fontWeight: FontWeight.bold), ) ,
                                  ],
                                ),

                                Text("Nice Food" , style: TextStyle(color: Colors.grey , fontSize: 15 , fontWeight: FontWeight.bold), ) ,
                              ],

                            ),
                          ],
                        ),

                        SizedBox(height: 10) ,
                        Text("----------------------------------------------------------------------------------------------" ,style: TextStyle(color: Colors.grey),),

                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.person_pin , color: Colors.deepPurple[400] , size: 70,  ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Sara Mahmoud" , style: TextStyle(color: Colors.black , fontSize: 20 , fontWeight: FontWeight.bold),),
                                Row(
                                  children: [
                                    Icon(Icons.star_rate_rounded , color: Colors.amber , size: 20,  ),
                                    Icon(Icons.star_rate_rounded , color: Colors.amber , size: 20,  ),
                                    Icon(Icons.star_rate_rounded , color: Colors.amber , size: 20,  ),
                                    Icon(Icons.star_rate_rounded , color: Colors.amber , size: 20,  ),
                                    Icon(Icons.star_rate_rounded , color: Colors.amber , size: 20,  ),
                                    SizedBox(width: 130) ,
                                    Text("2 weeks ago" , style: TextStyle(color: Colors.grey , fontSize: 15 , fontWeight: FontWeight.bold), )
                                    ,
                                  ],
                                ),
                                Text("Excellent service and taste" , style: TextStyle(color: Colors.grey , fontSize: 15 , fontWeight: FontWeight.bold), ) ,
                              ],

                            ),

                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 100) ,

              ],
            ),

          ),
          Positioned(
            bottom: 20,
            left: 10,
            right: 10,
            child: Container(
              height: 100,
              width: 400,
              decoration: BoxDecoration(
                color: Colors.deepPurple[400],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Icon(
                          Icons.shopping_cart_outlined,
                          color: Colors.deepPurple,
                          size: 50,
                        ),
                      ),

                      Positioned(
                        top: 4,
                        right: 4,
                        child: Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Center(
                            child: Text(
                              "5",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(width: 10),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Total Items : 5 " , style: TextStyle(color: Colors.white , fontSize: 18 , fontWeight: FontWeight.bold), ),
                      Text("Total Price : \$31.45 " , style: TextStyle(color: Colors.white , fontSize: 13 , fontWeight: FontWeight.bold), ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 33),
                    width: 132,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Text("Checkout" , style: TextStyle(color: Colors.black , fontSize: 17 , fontWeight: FontWeight.bold), ),
                          ),
                        ),
                        IconButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Paymentscreen()),);
                      }, icon: Icon(Icons.shopping_cart_outlined , color: Colors.black , size: 20,  ),)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      // when want to put thing in a scrollable page we use stack that wrap the page with the card

    );
  }

}
