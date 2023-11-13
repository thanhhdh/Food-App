import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_order_app/models/review_cart.dart';

class ReviewCartProvider with ChangeNotifier {
  void addReviewCartData({
    String? cartId,
    String? cartImage,
    String? cartName,
    int? cartPrice,
    int? cartQuantity,
  }) async {
    FirebaseFirestore.instance
        .collection("ReviewCart")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("ReviewCart")
        .doc(cartId)
        .set({
      "cartId": cartId,
      "cartImage": cartImage,
      "cartName": cartName,
      "cartPrice": cartPrice,
      "cartQuantity": cartQuantity,
      "isAdd": true,
    });
  }

  void updateReviewCartData({
    String? cartId,
    String? cartImage,
    String? cartName,
    int? cartPrice,
    int? cartQuantity,
  }) async {
    FirebaseFirestore.instance
        .collection("ReviewCart")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("ReviewCart")
        .doc(cartId)
        .update({
      "cartId": cartId,
      "cartImage": cartImage,
      "cartName": cartName,
      "cartPrice": cartPrice,
      "cartQuantity": cartQuantity,
      "isAdd": true,
    });
  }

  List<ReviewCartModel> reviewCartDataList = [];
  void getReviewCartData() async {
    List<ReviewCartModel> newList = [];
    QuerySnapshot reviewCartValue = await FirebaseFirestore.instance
        .collection("ReviewCart")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("ReviewCart")
        .get();
    reviewCartValue.docs.forEach((element) {
      ReviewCartModel reviewCartModel = ReviewCartModel(
        cartId: element.get("cartId"),
        cartImage: element.get("cartImage"),
        cartName: element.get("cartName"),
        cartPrice: element.get("cartPrice"),
        cartQuantity: element.get("cartQuantity"),
      );
      newList.add(reviewCartModel);
    });
    reviewCartDataList = newList;
    notifyListeners();
  }

  List<ReviewCartModel> get getReviewCartDataList {
    return reviewCartDataList;
  }

  // ---------- Cart Delele Handle--------
  reviewCartDataDelete(cardId) {
    FirebaseFirestore.instance
        .collection("ReviewCart")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("ReviewCart")
        .doc(cardId)
        .delete();
    notifyListeners();
  }
}
