import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_app/card.dart';
import 'package:fruits_app/color.dart';
import 'package:fruits_app/model.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> items = [
    "assets/banners/Slider 1.png",
    "assets/banners/Slider 2.png",
    "assets/banners/Slider 3.png",
  ];
  List<CategoryModel> categories = [
    CategoryModel(name: "Fruits", image: "assets/category/fruits.png"),
    CategoryModel(name: "Milk & Egg", image: "assets/category/milk & egg.png"),
    CategoryModel(name: "Vegetables", image: "assets/category/Vegetables.png"),
    CategoryModel(name: "Laundry", image: "assets/category/Laundry.png"),
    CategoryModel(name: "Fruits", image: "assets/category/fruits.png"),
  ];
  List<ProductModel> products = [
    ProductModel(
      name: 'banana',
      image: 'assets/fruits/banana.png',
      rate: '4.8',
      ratecount: '287',
      price: '3.99',
    ),
    ProductModel(
      name: 'Papper',
      image: 'assets/fruits/Pepper.png',
      rate: '4.8',
      ratecount: '287',
      price: '2.99',
    ),
    ProductModel(
      name: 'Orange',
      image: 'assets/fruits/orange.png',
      rate: '4.8',
      ratecount: '287',
      price: '3.99',
    ),
    ProductModel(
      name: 'Milk & Egg',
      image: 'assets/category/milk & egg.png',
      rate: '4.8',
      ratecount: '287',
      price: '3.99',
    ),
  ];
  List basketlist = [];

  void toggleselection(ProductModel product) {
    setState(() {
      if (basketlist.contains(product)) {
        basketlist.remove(product);
      } else {
        basketlist.add(product);
      }
    });
  }

  bool isSelected(ProductModel product) => basketlist.contains(product);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox.shrink(),
        leadingWidth: 0,
        title: Row(
          children: [
            SvgPicture.asset("assets/icons/Vector.svg"),

            SizedBox(width: 10),
            Text(
              "61 Hopper street..",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(width: 10),
            Icon(Icons.keyboard_arrow_down_outlined, size: 30),
            Spacer(),
            SvgPicture.asset("assets/icons/Vector (2).svg"),
          ],
        ),
      ),
      body: Column(
        children: [
          CarouselSlider.builder(
            itemCount: items.length,
            itemBuilder:
                (BuildContext context, int itemIndex, int pageViewIndex) =>
                    Image.asset(items[itemIndex]),
            options: CarouselOptions(
              height: 170,
              viewportFraction: 0.6,
              aspectRatio: 1,

              enableInfiniteScroll: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayCurve: Curves.linear,
              autoPlay: true,
              autoPlayAnimationDuration: Duration(seconds: 3),
              enlargeCenterPage: true,
            ),
          ),

          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(categories.length, (index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          shape: BoxShape.circle,
                        ),

                        width: 70,
                        height: 70,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            categories[index].image,
                            width: 60,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        categories[index].name,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Fruits",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                ),
                Text(
                  "See All",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: List.generate(products.length, (index) {
                  final item = products[index];
                  return ProuductItem(
                    name: item.name,
                    image: item.image,
                    rate: item.rate,
                    ratecount: item.ratecount,
                    price: item.price,
                    onTap: () => toggleselection(item),
                    icon:
                        isSelected(item) ? Icon(Icons.close) : Icon(Icons.add),
                  );
                }),
              ),
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              width: double.infinity,
              height: 77,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(7),
              ),

              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Row(
                  children: [
                    SizedBox(
                      width: 191,
                      child: ListView.builder(
                        itemCount: basketlist.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 4.0),
                            child: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(basketlist[index].image),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Spacer(),
                    Container(width: 2, height: 40, color: Colors.white),
                    SizedBox(width: 10),

                    Text(
                      "View Basket",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 10),

                    Badge(
                      label: Text(
                        basketlist.length.toString(),
                        style: TextStyle(fontSize: 13),
                      ),
                      backgroundColor: Colors.red,
                      largeSize: 14,
                      child: SvgPicture.asset(
                        "assets/icons/Vector (2).svg",
                        color: Colors.white,
                      ),
                    ),

                    SizedBox(width: 10),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 60),
        ],
      ),
    );
  }
}
