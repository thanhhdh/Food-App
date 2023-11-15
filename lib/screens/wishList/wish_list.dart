import 'package:flutter/material.dart';
import 'package:food_order_app/config/colors.dart';
import 'package:food_order_app/models/product_model.dart';
import 'package:food_order_app/models/review_cart.dart';
import 'package:food_order_app/providers/reviewCart_provider.dart';
import 'package:food_order_app/providers/wish_list_provider.dart';
import 'package:food_order_app/widgets/single_item.dart';
import 'package:provider/provider.dart';

class WishList extends StatefulWidget {
  @override
  State<WishList> createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  WishListProvider? wishListProvider;

  // ------ SHOW DIALOG ---------
  showAlertDialog(BuildContext context, ProductModel delete) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("No"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = TextButton(
      child: Text("Yes"),
      onPressed: () {
        wishListProvider!.deleteWishList(delete.productId);
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Remove Item"),
      content: Text("Are you remove product item?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    wishListProvider = Provider.of(context);
    wishListProvider!.getWishListData();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "WishList",
          style: TextStyle(color: textColor, fontSize: 18),
        ),
        backgroundColor: primaryColor,
      ),
      body: ListView.builder(
        itemCount: wishListProvider!.getWishList.length,
        itemBuilder: (context, index) {
          ProductModel data = wishListProvider!.getWishList[index];
          return Column(
            children: [
              SizedBox(
                height: 10,
              ),
              SingleItem(
                isBool: true,
                wishList: true,
                productImage: data.productImage!,
                productName: data.productName!,
                productPrice: data.productPrice!,
                productId: data.productId!,
                productQuantity: data.productQuantity!,
                onDelete: () {
                  showAlertDialog(context, data);
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
