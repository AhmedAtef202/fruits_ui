import 'package:flutter/material.dart';

class ProuductItem extends StatelessWidget {
  const ProuductItem({
    super.key,
    required this.image,
    required this.name,
    required this.price,
    required this.rate,
    required this.ratecount,
    required this.onTap,
    required this.icon,
  });

  final String image;
  final String name;
  final String price;
  final String rate;
  final String ratecount;
  final Function()? onTap;
  final Widget icon;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: 140,
                  height: 120,
                  padding: EdgeInsets.all(10),
                  child: Image.asset(image, width: 120, fit: BoxFit.cover),
                ),
                Positioned(
                  bottom: 6,
                  right: 5,
                  child: GestureDetector(
                    onTap: onTap,

                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 14,
                      child: icon,
                    ),
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset("assets/icons/star.png", width: 15),
                    SizedBox(width: 5),
                    Text(
                      "$rate ($ratecount)",
                      style: TextStyle(fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
                SizedBox(height: 10),

                Text("\$$price", style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
