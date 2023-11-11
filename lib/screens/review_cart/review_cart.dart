import 'package:flutter/material.dart';
import 'package:food_order_app/config/colors.dart';
import 'package:food_order_app/models/review_cart.dart';
import 'package:food_order_app/providers/reviewCart_provider.dart';
import 'package:food_order_app/widgets/single_item.dart';
import 'package:provider/provider.dart';

class ReviewCart extends StatelessWidget {
  const ReviewCart({super.key});

  @override
  Widget build(BuildContext context) {
    ReviewCartProvider reviewCartProvider = Provider.of(context);
    reviewCartProvider.getReviewCartData();
    return Scaffold(
      bottomNavigationBar: ListTile(
        title: Text("Total Amount"),
        subtitle: Text(
          "\$ 170.00",
          style: TextStyle(color: Colors.green[900]),
        ),
        trailing: Container(
          width: 160,
          child: MaterialButton(
            child: Text("Submit"),
            color: primaryColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            onPressed: () {},
          ),
        ),
      ),
      appBar: AppBar(
        title: Text(
          "Review Cart",
          style: TextStyle(color: textColor, fontSize: 18),
        ),
        backgroundColor: primaryColor,
      ),
      body: reviewCartProvider.getReviewCartDataList.isEmpty
          ? Center(
              child: Text("Cart Empty"),
            )
          : ListView.builder(
              itemCount: reviewCartProvider.getReviewCartDataList.length,
              itemBuilder: (context, index) {
                ReviewCartModel data =
                    reviewCartProvider.getReviewCartDataList[index];
                return Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    SingleItem(
                      isBool: true,
                      productImage: data.cartImage!,
                      productName: data.cartName!,
                      productPrice: data.cartPrice!,
                      productId: data.cartId!,
                      productQuantity: data.cartQuantity!,
                    ),
                  ],
                );
              },
            ),
    );
  }
}
