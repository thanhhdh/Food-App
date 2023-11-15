import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_order_app/models/product_model.dart';

class WishListProvider with ChangeNotifier {
  void addWishListData({
    String? wishListId,
    String? wishListImage,
    String? wishListName,
    int? wishListPrice,
    int? wishListQuantity,
  }) async {
    FirebaseFirestore.instance
        .collection("WishList")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("WishList")
        .doc(wishListId)
        .set({
      "wishListId": wishListId,
      "wishListImage": wishListImage,
      "wishListName": wishListName,
      "wishListPrice": wishListPrice,
      "wishListQuantity": wishListQuantity,
      "WishList": true,
    });
  }
// ----------Get WishList Data--------------

  List<ProductModel> wishList = [];

  getWishListData() async {
    List<ProductModel> newList = [];
    QuerySnapshot value = await FirebaseFirestore.instance
        .collection("WishList")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("WishList")
        .get();
    value.docs.forEach((element) {
      ProductModel productModel = ProductModel(
        productId: element.get("wishListId"),
        productName: element.get("wishListName"),
        productPrice: element.get("wishListPrice"),
        productImage: element.get("wishListImage"),
        productQuantity: element.get("wishListQuantity"),
      );
      newList.add(productModel);
    });
    wishList = newList;
    notifyListeners();
  }

  List<ProductModel> get getWishList {
    return wishList;
  }

  // --------- Delete WishList --------
  deleteWishList(wishListId) {
    FirebaseFirestore.instance
        .collection("WishList")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("WishList")
        .doc(wishListId)
        .delete();
    notifyListeners();
  }
}
