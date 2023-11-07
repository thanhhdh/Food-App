import 'package:flutter/material.dart';
import 'package:food_order_app/screens/home/drawer_side.dart';
import 'package:food_order_app/screens/product_overview/product_overview.dart';
import 'single_products.dart';

class HomeScreen extends StatelessWidget {
  Widget _buildHerbsProduct(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(
            vertical: 5,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Herbs Seasonings'),
              Text(
                'View all',
                style: TextStyle(color: Colors.grey),
              )
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SingleProducts(
                  productImage:
                      ('https://freepngdesign.com/content/uploads/images/hamburger-8183.png'),
                  productName: 'Hamburger',
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ProductOverview(
                          productName: "Hamburger",
                          productImage:
                              "https://freepngdesign.com/content/uploads/images/hamburger-8183.png",
                        ),
                      ),
                    );
                  }),
              SingleProducts(
                  productImage:
                      ('https://freepngdesign.com/content/uploads/images/hamburger-8183.png'),
                  productName: 'Hamburger',
                  onTap: () {}),
              SingleProducts(
                  productImage:
                      ('https://freepngdesign.com/content/uploads/images/hamburger-8183.png'),
                  productName: 'Hamburger',
                  onTap: () {}),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildFreshProduct(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Fresh Product'),
              Text(
                'View All',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SingleProducts(
                  productImage:
                      'https://cdn.britannica.com/17/196817-050-6A15DAC3/vegetables.jpg',
                  productName: 'Fresh',
                  onTap: () {}),
              SingleProducts(
                  productImage:
                      'https://cdn.britannica.com/17/196817-050-6A15DAC3/vegetables.jpg',
                  productName: 'Fresh',
                  onTap: () {}),
              SingleProducts(
                  productImage:
                      'https://cdn.britannica.com/17/196817-050-6A15DAC3/vegetables.jpg',
                  productName: 'Fresh',
                  onTap: () {}),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildRootProduct(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(
            vertical: 5,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('Fresh Fruits'),
              Text(
                'View all',
                style: TextStyle(color: Colors.grey),
              )
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SingleProducts(
                  productImage:
                      'https://cdn.britannica.com/17/196817-050-6A15DAC3/vegetables.jpg',
                  productName: 'Herbs',
                  onTap: () {}),
              SingleProducts(
                  productImage:
                      'https://cdn.britannica.com/17/196817-050-6A15DAC3/vegetables.jpg',
                  productName: 'Herbs',
                  onTap: () {}),
              SingleProducts(
                  productImage:
                      'https://cdn.britannica.com/17/196817-050-6A15DAC3/vegetables.jpg',
                  productName: 'Herbs',
                  onTap: () {}),
            ],
          ),
        )
      ],
    );
  }

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 219, 218, 218),
      drawer: DrawerSide(),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          'Home',
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        actions: const [
          CircleAvatar(
            radius: 12,
            backgroundColor: Color(0xffd4d181),
            child: Icon(
              Icons.search,
              size: 17,
              color: Colors.black,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: CircleAvatar(
              backgroundColor: Color(0xffd4d181),
              radius: 12,
              child: Icon(
                Icons.shop,
                size: 17,
                color: Colors.black,
              ),
            ),
          )
        ],
        backgroundColor: const Color(0xffd6b738),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: ListView(children: [
          Container(
            height: 150,
            decoration: BoxDecoration(
                image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        'https://as1.ftcdn.net/v2/jpg/06/04/86/32/1000_F_604863201_e9Yxf2njJbh0qn7Jx8pWRmrWCiwcfCst.jpg')),
                color: Colors.red,
                borderRadius: BorderRadius.circular(10)),
            child: Row(children: [
              Expanded(
                  child: Container(
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 120, bottom: 10),
                    child: Container(
                      height: 50,
                      width: 70,
                      decoration: const BoxDecoration(
                          color: Color(0xffd1ad17),
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(50),
                              bottomLeft: Radius.circular(50))),
                      child: const Center(
                        child: Text(
                          'Vegi',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              shadows: [
                                BoxShadow(
                                    color: Colors.green,
                                    blurRadius: 10,
                                    offset: Offset(3, 3)),
                              ]),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    '30% OFF',
                    style: TextStyle(
                        fontSize: 40,
                        color: Colors.yellow[100],
                        fontWeight: FontWeight.bold),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      'On all vegetables products',
                      style: TextStyle(color: Colors.yellow),
                    ),
                  )
                ]),
              )),
              Expanded(child: Container()),
            ]),
          ),
          _buildHerbsProduct(context),
          _buildFreshProduct(context),
        ]),
      ),
    );
  }
}
