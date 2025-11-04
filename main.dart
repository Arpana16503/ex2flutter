import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Offers & Discounts',
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Special Offers and Discount',
            style: TextStyle(fontSize: 20, letterSpacing: 5),
          ),
          backgroundColor: const Color.fromARGB(255, 86, 111, 209),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            MyListItem(
              productName: 'Mama Earth Skincare',
              originalPrice: 1900,
              discountPercent: 20,
              productImage: 'assets/images/mama.jpg',
            ),
            MyListItem(
              productName: 'Watch',
              originalPrice: 2740,
              discountPercent: 10,
              productImage: 'assets/images/watch.jpg',
            ),
            MyListItem(
              productName: 'String Light',
              originalPrice: 2740,
              discountPercent: 20,
              productImage: 'assets/images/light.jpg',
            ),
            
            MyListItem(
              productName: 'Fries and Burger',
              originalPrice: 740,
              discountPercent: 10,
              productImage: 'assets/images/fries.jpg',
            ),
            MyListItem(
              productName: 'Home Appliances',
              originalPrice: 23058,
              discountPercent: 30,
              productImage: 'assets/images/home.jpg',
            ),
            MyListItem(
              productName: 'Rhode Lipcare',
              originalPrice: 3000,
              discountPercent: 40,
              productImage: 'assets/images/rhode.jpg',
            ),
          ],
        ),
      ),
    );
  }
}

class MyListItem extends StatelessWidget {
  final String productName, productImage;
  final double originalPrice;
  final int discountPercent;

  MyListItem({
    super.key,
    required this.productName,
    required this.productImage,
    required this.originalPrice,
    required this.discountPercent,
  });

  final inrFormat = NumberFormat.currency(
    locale: 'en_IN',
    symbol: '₹',
    decimalDigits: 2,
  );

  @override
  Widget build(BuildContext context) {
    double discountedPrice =
        originalPrice - (originalPrice * discountPercent / 100);

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey, width: 0.5),
      ),
      elevation: 2,
      color: Colors.white,
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(12),
            color: Colors.grey[200],
            width: 200,
            height: 200,
            child: Image.asset(
              productImage,
              width: 160,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                productName,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Limited Time Offer!',
                style: TextStyle(
                  fontSize: 14,
                  color: const Color.fromARGB(255, 51, 105, 212),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    inrFormat.format(originalPrice),
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(
                    inrFormat.format(discountedPrice),
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5),
              Text(
                '$discountPercent% OFF',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.orange,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 60, 194, 243),
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                ),
                child: Text('Grab Offer', style: TextStyle(fontSize: 16)),
              )
            ],
          )
        ],
      ),
    );
  }
}

