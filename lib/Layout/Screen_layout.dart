import 'package:amazon_clone/Utils/constants.dart';
import 'package:flutter/material.dart';

class ScreenLayout extends StatefulWidget {
  const ScreenLayout({Key? key}) : super(key: key);

  @override
  State<ScreenLayout> createState() => _ScreenLayoutState();
}

class _ScreenLayoutState extends State<ScreenLayout> {
  PageController pageController =PageController();
  int currentpage =0;
  @override
  void dispose(){
    super.dispose();
    pageController.dispose();
  }
  changepage(int page){
    pageController.jumpToPage(page);
    setState(() {
      currentpage=page;
    });
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: PageView(
          controller:pageController,
          children:screens
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(border: Border(top:BorderSide(color: Colors.grey.shade400,width: 1) )),
          child: TabBar(
            indicator:const BoxDecoration(border: Border(top:BorderSide(color: Colors.cyan,width:4),),),
            indicatorSize: TabBarIndicatorSize.label,
            onTap:changepage,
            tabs: [
            Tab(child: Icon(Icons.home_outlined,color: currentpage==0?Colors.cyan:Colors.black ,),),
            Tab(child: Icon(Icons.account_circle ,color: currentpage==1?Colors.cyan:Colors.black),),
            Tab(child: Icon(Icons.shopping_cart_outlined,color: currentpage==2?Colors.cyan:Colors.black),),
            Tab(child: Icon(Icons.menu,color: currentpage==3?Colors.cyan:Colors.black),),
          ],),
        ),
      ),
    );
  }
}
