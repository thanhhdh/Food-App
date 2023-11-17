import 'package:flutter/material.dart';
import 'package:food_order_app/config/colors.dart';
import 'package:food_order_app/widgets/count.dart';

class SingleProducts extends StatelessWidget {
  final String productImage;
  final String productName;
  final int productPrice;
  final VoidCallback onTap;
  final String productId;
  SingleProducts({
    required this.productId,
    required this.productImage,
    required this.productName,
    required this.productPrice,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
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
              onTap: onTap,
              child: Container(
                height: 150,
                padding: EdgeInsets.all(5),
                width: double.infinity,
                child: Image.network(
                  productImage,
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
                      productName,
                      style: TextStyle(
                          color: textColor, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '$productPrice\$/50 Gram',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              showModalBottomSheet<void>(
                                context: context,
                                builder: (BuildContext context) {
                                  return Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      ListTile(
                                        title: new Text('50 Gram'),
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                      ),
                                      ListTile(
                                        title: new Text('500 Gram'),
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                      ),
                                      ListTile(
                                        title: new Text('1 Kg'),
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                      )
                                    ],
                                  );
                                },
                              );
                            },
                            child: Container(
                              padding: EdgeInsets.only(left: 5),
                              height: 30,
                              width: 50,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Row(
                                children: [
                                  Expanded(
                                      child: Text(
                                    '50 Gram',
                                    style: TextStyle(fontSize: 10),
                                  )),
                                  Icon(
                                    Icons.arrow_drop_down,
                                    size: 20,
                                    color: Color(0xffd0b84c),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Count(
                          productId: productId,
                          productImage: productImage,
                          productName: productName,
                          productPrice: productPrice,
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
