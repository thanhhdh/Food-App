import 'package:flutter/material.dart';
import 'package:food_order_app/config/colors.dart';
import 'package:food_order_app/models/product_model.dart';
import 'package:food_order_app/widgets/count.dart';
import 'package:food_order_app/widgets/product_unit.dart';

class SingleProducts extends StatefulWidget {
  final String productImage;
  final String productName;
  final int productPrice;
  final VoidCallback onTap;
  final String productId;
  final ProductModel? productUnit;
  SingleProducts({
    required this.productId,
    required this.productImage,
    required this.productName,
    required this.productPrice,
    required this.onTap,
    this.productUnit,
  });

  @override
  State<SingleProducts> createState() => _SingleProductsState();
}

class _SingleProductsState extends State<SingleProducts> {
  var unitData;
  var firstValue;

  @override
  Widget build(BuildContext context) {
    widget.productUnit!.productUnit!.firstWhere((element) {
      setState(() {
        firstValue = element;
      });
      return true;
    });
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(children: [
        Container(
          margin: EdgeInsets.only(right: 10),
          height: 230,
          width: 165,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            GestureDetector(
              onTap: widget.onTap,
              child: Container(
                height: 150,
                padding: EdgeInsets.all(5),
                width: double.infinity,
                child: Image.network(
                  widget.productImage,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.productName,
                      style: TextStyle(
                          color: textColor, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '${widget.productPrice}\$/${unitData == null ? firstValue : unitData}',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: ProductUnit(
                            onTap: () {
                              showModalBottomSheet<void>(
                                context: context,
                                builder: (BuildContext context) {
                                  return Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: widget.productUnit!.productUnit!
                                        .map<Widget>((data) {
                                      return Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 10, horizontal: 10),
                                            child: InkWell(
                                              onTap: () async {
                                                setState(() {
                                                  unitData = data;
                                                });
                                                Navigator.of(context).pop();
                                              },
                                              child: Text(
                                                data,
                                                style: TextStyle(
                                                    color: primaryColor,
                                                    fontSize: 18),
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    }).toList(),
                                  );
                                },
                              );
                            },
                            title: unitData == null ? firstValue : unitData,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Count(
                          productId: widget.productId,
                          productImage: widget.productImage,
                          productName: widget.productName,
                          productPrice: widget.productPrice,
                          productUnit: unitData == null ? firstValue : unitData,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ]),
        ),
      ]),
    );
  }
}
