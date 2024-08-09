import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:hive/models/items_model.dart';
import 'package:hive/screens/ai_monetring_screen.dart';
import 'package:hive/screens/status_page.dart';
import 'package:hive/utils/colors.dart';
import 'package:hive/utils/size_confing.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    SizeConfing().init(context);

    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        index: _currentIndex,
        height: SizeConfing.defaultSize! * 6.0,
        items: const [
          Icon(Icons.home, size: 30, color: Colors.white),
          Icon(Icons.equalizer, size: 30, color: Colors.white),
          Icon(Icons.videocam, size: 30, color: Colors.white),
        ],
        color: primaryColor,
        buttonBackgroundColor: primaryColor,
        backgroundColor: Colors.white,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 300),
        onTap: (index) {
          setState(
            () {
              _currentIndex = index;
            },
          );

          _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        },
      ),
      body: PageView(
        controller: _pageController,
        scrollDirection: Axis.horizontal,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: const [
          HomeBody(),
          RemoteControlScreen(),
          AiMonitoringScreen(),
        ],
      ),
    );
  }
}

class HomeBody extends StatelessWidget {
  const HomeBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: SizeConfing.defaultSize! * 5), // Adjusted height
        const PageTitle(title: 'HIVE'),
        const Expanded(
          child: ItemGrid(),
        ),
      ],
    );
  }
}

class PageTitle extends StatelessWidget {
  final String title;

  const PageTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.all(SizeConfing.defaultSize! * 1.0), // Adjusted padding
      child: Text(
        title,
        style: TextStyle(
          fontSize: SizeConfing.defaultSize! * 2.4, // Adjusted font size
          fontWeight: FontWeight.bold,
          color: primaryColor,
        ),
      ),
    );
  }
}

// Grid of Items
class ItemGrid extends StatelessWidget {
  const ItemGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding:
          EdgeInsets.all(SizeConfing.defaultSize! * 1.0), // Adjusted padding
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        return GridItem(
          item: items[index],
        );
      },
    );
  }
}

// Individual Grid Item
class GridItem extends StatelessWidget {
  const GridItem({super.key, required this.item});
  final ItemsModel item;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
            SizeConfing.defaultSize! * 1.0), // Adjusted border radius
      ),
      elevation: 4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: SizeConfing.screenHeight! * 0.18, // Adjusted height
            width: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(
                    SizeConfing.defaultSize! * 1.0), // Adjusted radius
                topRight: Radius.circular(
                    SizeConfing.defaultSize! * 1.0), // Adjusted radius
              ),
              child: Image.asset(
                item.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Adjusted height
          Padding(
            padding: EdgeInsets.only(
              top: SizeConfing.defaultSize! * .50,
              left: SizeConfing.defaultSize! * 1.0,
              right: SizeConfing.defaultSize! * 1.0,
              bottom: SizeConfing.defaultSize! * 0.2,
            ),
            child: Text(
              item.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              softWrap: true,
              style: TextStyle(
                fontSize: SizeConfing.defaultSize! * 1.6, // Adjusted font size
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
