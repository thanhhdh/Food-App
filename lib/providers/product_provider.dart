import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_order_app/models/product_model.dart';

class ProductProvider with ChangeNotifier {
  ProductModel? productModel;

  List<ProductModel> search = [];
  productModels(QueryDocumentSnapshot element) {
    productModel = ProductModel(
      productImage: element.get("productImage"),
      productName: element.get("productName"),
      productPrice: element.get("productPrice"),
    );
    search.add(productModel!);
  }

  // ------- Herb Product -------------
  List<ProductModel> herbsProductList = [];

  fetchHerbsProductData() async {
    List<ProductModel> newList = [];
    QuerySnapshot value =
        await FirebaseFirestore.instance.collection("HerbsProduct").get();
    value.docs.forEach((element) {
      productModels(element);
      newList.add(productModel!);
    });
    herbsProductList = newList;
    notifyListeners();
  }

  List<ProductModel> get getHerbsProductDataList {
    return herbsProductList;
  }

  // ------- Fresh Product -------------
  List<ProductModel> freshProductList = [];

  fetchFreshProductData() async {
    List<ProductModel> newList = [];
    QuerySnapshot value =
        await FirebaseFirestore.instance.collection("FreshProduct").get();
    value.docs.forEach((element) {
      productModels(element);
      newList.add(productModel!);
    });
    freshProductList = newList;
    notifyListeners();
  }

  List<ProductModel> get getFreshProductDataList {
    return freshProductList;
  }

  // ------- Root Product -------------
  List<ProductModel> rootProductList = [];

  fetchRootProductData() async {
    List<ProductModel> newList = [];
    QuerySnapshot value =
        await FirebaseFirestore.instance.collection("RootProduct").get();
    value.docs.forEach((element) {
      productModels(element);
      newList.add(productModel!);
    });
    rootProductList = newList;
    notifyListeners();
  }

  List<ProductModel> get getRootProductDataList {
    return rootProductList;
  }

  // ------------ SEARCH RETURN-----------------
  List<ProductModel> get getAllProductSearch {
    return search;
  }
}
