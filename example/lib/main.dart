import 'package:flutter/material.dart';
import 'package:m3_carousel/m3_carousel.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> images = [
      {"image": "assets/i1.png", "title": "Android"},
      {"image": "assets/i2.png", "title": "IOS"},
      {"image": "assets/i3.png", "title": "Windows"},
      {"image": "assets/i4.png", "title": "Mac"},
      {"image": "assets/i5.png", "title": "Linux"},
      {"image": "assets/i6.png", "title": "Others"},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Material Design 3 Carousel'),
      ),
      body: Container(
        width: double.maxFinite,
        height: 200,
        padding: const EdgeInsets.all(10),
        child: M3Carousel(
          visible: 3,
          borderRadius: 20,
          slideAnimationDuration: 500,
          titleFadeAnimationDuration: 300,
          childClick: (int index) {
            print("Clicked $index");
          },
          totalSubCount: images.length * 100,
          initIndex: 0,
          titleBuilder: (context, index, activeIndex) {
            return Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                colors: [Colors.transparent, Colors.black.withOpacity(0.5)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: AnimatedOpacity(
                  opacity: index == activeIndex ? 1 : 0,
                  duration: const Duration(
                    milliseconds: 300,
                  ),
                  child: Text(
                    images[index % images.length]["title"] ?? 'abc',
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.clip,
                  ),
                ),
              ),
            );
          },
          itemBuilder: (context, index, activeIndex) {
            print("Image URL: $index");
            return buildMainChild(images[index % images.length]["image"]);
          },
          children: const [],
        ),
      ),
    );
  }

  Widget? buildMainChild(String? imageURL) {
    if (imageURL == null) {
      return null;
    }
    return Image.asset(
      imageURL,
      fit: BoxFit.cover,
      width: double.maxFinite,
      height: double.maxFinite,
    );
  }
}
