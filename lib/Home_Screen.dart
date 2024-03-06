import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class Home_Screen extends StatefulWidget {
  @override
  _Home_ScreenState createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  List<String> images = ['assets/1.jpg', 'assets/2.jpg', 'assets/3.jpg', 'assets/4.jpg', 'assets/5.jpg'];
  late PageController _pageController;
  int _currentPage = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPage);
    _startTimer();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_currentPage < images.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.lightBlueAccent, // Blue background color
                ),
                Expanded(
                  child: Container(
                    color: Colors.lightGreenAccent, // Red background color
                  ),
                ),
              ],
            ),
            Center(
              child: Column(
                children: [
                  SizedBox(height: 60,),
                  Container(
                    width: 350, // You can adjust width as needed
                    height: 140, // You can adjust height as needed
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0), // Adjust the radius as needed
                    ),
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: images.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Image.asset(
                          images[index],
                          fit: BoxFit.cover, // Adjust image fit as needed
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 30,),
                  Container(
                    width: 350, // You can adjust width as needed
                    height: 140, // You can adjust height as needed
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0), // Adjust the radius as needed
                    ),

                  ),
                  SizedBox(height: 30,),
                  Container(
                    width: 350, // You can adjust width as needed
                    height: 290, // You can adjust height as needed
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0), // Adjust the radius as needed
                    ),
                    child: GridView.count(
                      primary: false,
                      padding: const EdgeInsets.all(20),
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 10,
                      crossAxisCount: 3,
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.all(8),
                          height: 20,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: Colors.grey.shade200, boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade100,
                              spreadRadius: 1,
                              blurRadius: 1,
                                offset: const Offset(0,0)
                            )
                          ]),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          color: Colors.teal[200],
                          child: const Text('Heed not the rabble'),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          color: Colors.teal[300],
                          child: const Text('Sound of screams but the'),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          color: Colors.teal[400],
                          child: const Text('Who scream'),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          color: Colors.teal[500],
                          child: const Text('Revolution is coming...'),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          color: Colors.teal[600],
                          child: const Text('Revolution, they...'),
                        ),
                      ],
                    )
                  ),
                ],
              ),
            )
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_basket),
              label: 'Orders',
            ),
          ],
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
        ),
      ),
    );
  }
}
