import 'package:flutter/material.dart';
import 'package:food_order_app/config/colors.dart';
import 'package:food_order_app/providers/product_provider.dart';
import 'package:food_order_app/providers/user_provider.dart';
import 'package:food_order_app/screens/home/drawer_side.dart';
import 'package:food_order_app/screens/product_overview/product_overview.dart';
import 'package:food_order_app/screens/review_cart/review_cart.dart';
import 'package:food_order_app/screens/search/search.dart';
import 'package:provider/provider.dart';
import 'single_products.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ProductProvider? productProvider;

  Widget _buildHerbsProduct(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: 5,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Herbs Seasonings'),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) =>
                          Search(search: productProvider!.getAllProductSearch),
                    ),
                  );
                },
                child: const Text(
                  'View all',
                  style: TextStyle(color: Colors.grey),
                ),
              )
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: productProvider!.getHerbsProductDataList
                .map((herbsProductData) {
              return SingleProducts(
                  productId: herbsProductData.productId!,
                  productImage: herbsProductData.productImage!,
                  productName: herbsProductData.productName!,
                  productPrice: herbsProductData.productPrice!,
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ProductOverview(
                          productId: herbsProductData.productId!,
                          productName: herbsProductData.productName!,
                          productImage: herbsProductData.productImage!,
                          productPrice: herbsProductData.productPrice!,
                        ),
                      ),
                    );
                  });
            }).toList(),
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
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        Search(search: productProvider!.getAllProductSearch),
                  ));
                },
                child: Text(
                  'View All',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: productProvider!.getFreshProductDataList
                .map((freshProductData) {
              return SingleProducts(
                  productId: freshProductData.productId!,
                  productImage: freshProductData.productImage!,
                  productName: freshProductData.productName!,
                  productPrice: freshProductData.productPrice!,
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ProductOverview(
                          productId: freshProductData.productId!,
                          productName: freshProductData.productName!,
                          productImage: freshProductData.productImage!,
                          productPrice: freshProductData.productPrice!,
                        ),
                      ),
                    );
                  });
            }).toList(),
          ),
        )
      ],
    );
  }

  Widget _buildRootProduct(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Root Product'),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        Search(search: productProvider!.getAllProductSearch),
                  ));
                },
                child: Text(
                  'View All',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children:
                productProvider!.getRootProductDataList.map((rootProductData) {
              return SingleProducts(
                  productId: rootProductData.productId!,
                  productImage: rootProductData.productImage!,
                  productName: rootProductData.productName!,
                  productPrice: rootProductData.productPrice!,
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ProductOverview(
                          productId: rootProductData.productId!,
                          productName: rootProductData.productName!,
                          productImage: rootProductData.productImage!,
                          productPrice: rootProductData.productPrice!,
                        ),
                      ),
                    );
                  });
            }).toList(),
          ),
        )
      ],
    );
  }

  @override
  void initState() {
    ProductProvider productProvider = Provider.of(context, listen: false);
    productProvider.fetchHerbsProductData();
    productProvider.fetchFreshProductData();
    productProvider.fetchRootProductData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    productProvider = Provider.of(context);
    UserProvider userProvider = Provider.of(context);
    userProvider.getUserData();
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 219, 218, 218),
      drawer: DrawerSide(
        userProvider: userProvider,
      ),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          'Home',
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        actions: [
          CircleAvatar(
            radius: 12,
            backgroundColor: primaryColor,
            child: IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Search(
                        search: productProvider!.getAllProductSearch,
                      ),
                    ),
                  );
                },
                icon: Icon(
                  Icons.search,
                  size: 18,
                  color: Colors.black,
                )),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ReviewCart()));
              },
              child: CircleAvatar(
                backgroundColor: primaryColor,
                radius: 12,
                child: Icon(
                  Icons.shop,
                  size: 18,
                  color: Colors.black,
                ),
              ),
            ),
          )
        ],
        backgroundColor: primaryColor,
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
          _buildRootProduct(context),
        ]),
      ),
    );
  }
}
