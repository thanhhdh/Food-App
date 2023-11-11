import 'package:flutter/material.dart';
import 'package:food_order_app/config/colors.dart';
import 'package:food_order_app/models/product_model.dart';
import 'package:food_order_app/widgets/single_item.dart';

enum SinginCharacter { lowToHigh, highToLow, alphabetically }

class Search extends StatefulWidget {
  final List<ProductModel> search;
  Search({required this.search});
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String query = "";

  SinginCharacter _character = SinginCharacter.alphabetically;
  searchItem(String query) {
    List<ProductModel> searchFood = widget.search
        .where((element) =>
            element.productName!.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return searchFood;
  }

  @override
  Widget build(BuildContext context) {
    List<ProductModel> _searchItem = searchItem(query);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: textColor),
        title: Text(
          "Search",
          style: TextStyle(color: textColor),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.menu_rounded),
          ),
        ],
        backgroundColor: primaryColor,
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text("Items"),
          ),
          Container(
            height: 52,
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  query = value;
                });
              },
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none),
                  fillColor: Color(0xffc2c2c2),
                  filled: true,
                  hintText: "Search for item",
                  suffixIcon: Icon(Icons.search)),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Column(
            children: _searchItem.map((data) {
              return SingleItem(
                isBool: false,
                productImage: data.productImage!,
                productName: data.productName!,
                productPrice: data.productPrice!,
                productId: data.productId!,
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
