import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iti_flutter/Presentation/Chatbot/GeminiChatBotScreen.dart';
import 'package:iti_flutter/Presentation/Screens/Client/Popular_Chefs_Details.dart';
import 'package:iti_flutter/Presentation/Screens/Home/HomeScreen.dart';
import 'package:iti_flutter/Presentation/Screens/Payment/PaymentScreen.dart';
import 'package:iti_flutter/Presentation/Screens/User/OrderProgress.dart';
import 'package:iti_flutter/Presentation/Screens/User/ProfileScreen.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
// Must be in screen alone
class BottomNavBar extends StatefulWidget{
  final num id ;
  const BottomNavBar({super.key , required this.id});
  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {

  @override
  final PersistentTabController _controller =
  PersistentTabController(initialIndex: 0);

  List<Widget> _buildScreens() {
    return [
      Popularchefsdetails(id : widget.id),
      Geminichatbotscreen(),
      //MyHomePage(title: '',),
      //Paymentscreen(),
      //Profilescreen(),
      //orderprogress(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.article),
        title: "Biography",
        activeColorPrimary: Colors.deepPurple,
        inactiveColorPrimary: Colors.grey,
      ),

      PersistentBottomNavBarItem(
        icon: const Icon(Icons.chat),
        title: "ChatBot",
        activeColorPrimary: Colors.deepPurple,
        inactiveColorPrimary: Colors.grey,
      ),

     // PersistentBottomNavBarItem(
     //   icon: const Icon(Icons.person),
     //   title: "Profile",
     //   activeColorPrimary: Colors.deepPurple,
     //   inactiveColorPrimary: Colors.grey,
     // ),
//
     // PersistentBottomNavBarItem(
     //   icon: const Icon(Icons.motorcycle_rounded),
     //   title: "Order Progress",
     //   activeColorPrimary: Colors.deepPurple,
     //   inactiveColorPrimary: Colors.grey,
     // ),



    ];
  }

Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen on a non-scrollable screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardAppears: true,
      //
      //popBehaviorOnSelectedNavBarItemPress: PopActionScreensType.all,
      padding: const EdgeInsets.only(top: 8),
      backgroundColor: Color(0xE2CEAEFF),
      isVisible: true,
      animationSettings: const NavBarAnimationSettings(
        navBarItemAnimation: ItemAnimationSettings( // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 400),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimationSettings( // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          duration: Duration(milliseconds: 200),
          screenTransitionAnimationType: ScreenTransitionAnimationType.fadeIn,
        ),
      ),
      confineToSafeArea: true,
      navBarHeight: kBottomNavigationBarHeight,
      navBarStyle: NavBarStyle.style1, // Choose the nav bar style with this property
    );
}


}