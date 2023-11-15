import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_order_app/config/colors.dart';
import 'package:food_order_app/providers/wish_list_provider.dart';
import 'package:provider/provider.dart';

enum SigninCharacter {
  fill,
  outline,
}

class ProductOverview extends StatefulWidget {
  final String productImage;
  final String productName;
  final int productPrice;
  final String productId;
  ProductOverview({
    required this.productId,
    required this.productName,
    required this.productImage,
    required this.productPrice,
  });

  @override
  _ProductOverviewState createState() => _ProductOverviewState();
}

class _ProductOverviewState extends State<ProductOverview> {
  SigninCharacter _character = SigninCharacter.fill;

  Widget buttonNavigatorBar({
    Color? iconColor,
    Color? backgroundColor,
    Color? color,
    String? title,
    IconData? iconData,
    Function()? onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(20),
          color: backgroundColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                iconData,
                size: 17,
                color: iconColor,
              ),
              SizedBox(
                width: 5,
              ),
              Text(title!, style: TextStyle(color: color)),
            ],
          ),
        ),
      ),
    );
  }

  bool wishListBool = false;

  getWishListBool() {
    FirebaseFirestore.instance
        .collection("WishList")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("WishList")
        .doc(widget.productId)
        .get()
        .then((value) => {
              if (this.mounted)
                {
                  setState(() {
                    wishListBool = value.get("WishList");
                  })
                }
            });
  }

  @override
  Widget build(BuildContext context) {
    WishListProvider wishListProvider = Provider.of(context);
    getWishListBool();
    return Scaffold(
      bottomNavigationBar: Row(
        children: [
          buttonNavigatorBar(
            backgroundColor: textColor,
            color: Colors.white70,
            iconColor: Colors.grey,
            title: "Add to Wishlist",
            iconData:
                wishListBool == false ? Icons.favorite_outline : Icons.favorite,
            onTap: () {
              setState(() {
                wishListBool = !wishListBool;
              });
              if (wishListBool == true) {
                wishListProvider.addWishListData(
                  wishListId: widget.productId,
                  wishListImage: widget.productImage,
                  wishListName: widget.productName,
                  wishListPrice: widget.productPrice,
                  wishListQuantity: 2,
                );
              } else {
                wishListProvider.deleteWishList(widget.productId);
              }
            },
          ),
          buttonNavigatorBar(
              backgroundColor: primaryColor,
              color: textColor,
              iconColor: Colors.white70,
              title: "Go To Cart",
              iconData: Icons.shopping_cart_outlined),
        ],
      ),
      appBar: AppBar(
        iconTheme: IconThemeData(color: textColor),
        title: Text(
          "Product Overview",
          style: TextStyle(color: textColor),
        ),
        backgroundColor: primaryColor,
      ),
      body: Column(children: [
        Expanded(
          flex: 2,
          child: Container(
            width: double.infinity,
            child: Column(children: [
              ListTile(
                title: Text(widget.productName ?? ""),
                subtitle: Text("\$50"),
              ),
              Container(
                height: 250,
                padding: EdgeInsets.all(40.0),
                child: Image.network(widget.productImage ?? ""),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                width: double.infinity,
                child: Text(
                  'Available Options',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 3,
                          backgroundColor: Colors.green[700],
                        ),
                        Radio(
                          value: SigninCharacter.fill,
                          activeColor: Colors.green[700],
                          groupValue: _character,
                          onChanged: (value) {
                            setState(
                              () {
                                _character;
                              },
                            );
                          },
                        ),
                      ],
                    ),
                    Text("\$${widget.productPrice}"),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add,
                            size: 18,
                            color: primaryColor,
                          ),
                          Text(
                            'ADD',
                            style: TextStyle(color: primaryColor),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ]),
          ),
        ),
        Expanded(
            child: Container(
          padding: EdgeInsets.all(20),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "About this product",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
                style: TextStyle(fontSize: 16, color: textColor),
              ),
            ],
          ),
        ))
      ]),
    );
  }
}
