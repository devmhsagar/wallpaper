import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List WallpaperImages = [
    "assets/images/wallpaper-1.jpg",
    "assets/images/wallpaper-2.jpg",
    "assets/images/wallpaper-3.jpg",
    "assets/images/wallpaper-4.jpg",
  ];

  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 50, left: 20, right: 20),
        child: Column(
          children: [
            Row(
              children: [
                Material(
                  elevation: 5,
                  borderRadius: BorderRadius.circular(50),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset(
                      'assets/images/mahdee.jpg',
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 80,
                ),
                const Text(
                  "Wallify",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontFamily: "Poppins",
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            CarouselSlider.builder(
              itemCount: WallpaperImages.length,
              itemBuilder: (context, index, realIndex) {
                final res = WallpaperImages[index];
                return buildImage(res, index);
              },
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height / 1.5,
                viewportFraction: 1,
                autoPlay: false,
                enlargeCenterPage: true,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
                onPageChanged: (index, reason) =>
                    setState(() => activeIndex = index),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(child: buildIndicator()),
          ],
        ),
      ),
    );
  }

  Widget buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: 4,
        effect: const ExpandingDotsEffect(
          dotWidth: 10,
          dotHeight: 10,
          activeDotColor: Colors.blue,
          dotColor: Colors.grey,
        ),
      );
  Widget buildImage(String urlImage, int index) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        height: MediaQuery.of(context).size.height / 1.5,
        width: MediaQuery.of(context).size.width,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.asset(
              urlImage,
              fit: BoxFit.cover,
            )),
      );
}
