import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_order_app/config/colors.dart';
import 'package:food_order_app/models/product_model.dart';
import 'package:food_order_app/widgets/count.dart';
import 'package:food_order_app/providers/reviewCart_provider.dart';
import 'package:provider/provider.dart';

class SingleItem extends StatefulWidget {
  bool isBool = false;
  bool? wishList = false;
  String productImage;
  String productName;
  int productPrice;
  String productId;
  int? productQuantity;
  Function()? onDelete;
  var productUnit;
  SingleItem({
    required this.isBool,
    required this.productImage,
    required this.productName,
    required this.productPrice,
    required this.productId,
    this.productQuantity,
    this.onDelete,
    this.wishList,
    this.productUnit,
  });

  @override
  State<SingleItem> createState() => _SingleItemState();
}

class _SingleItemState extends State<SingleItem> {
  ReviewCartProvider? reviewCartProvider;

  int? count;
  getCount() {
    setState(() {
      count = widget.productQuantity;
    });
  }

  @override
  void initState() {
    getCount();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    getCount();
    reviewCartProvider = Provider.of<ReviewCartProvider>(context);
    reviewCartProvider!.getReviewCartData();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        children: [
          Expanded(
              child: Container(
            height: 100,
            child: Center(
              child: Image.network(widget.productImage),
            ),
          )),
          Expanded(
            child: Container(
              height: 100,
              child: Column(
                mainAxisAlignment: widget.isBool == false
                    ? MainAxisAlignment.spaceAround
                    : MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Text(
                        widget.productName,
                        style: TextStyle(
                            color: textColor, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '${widget.productPrice}\$/50 Gram',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  widget.isBool == false
                      ? GestureDetector(
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
                            margin: EdgeInsets.only(right: 15),
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            height: 35,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Row(children: [
                              Expanded(
                                child: Text(
                                  "50 Gram",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 14),
                                ),
                              ),
                              Center(
                                child: Icon(
                                  Icons.arrow_drop_down,
                                  size: 20,
                                  color: primaryColor,
                                ),
                              )
                            ]),
                          ),
                        )
                      : Text(widget.productUnit)
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 100,
              padding: widget.isBool == false
                  ? EdgeInsets.symmetric(horizontal: 15, vertical: 32)
                  : EdgeInsets.only(left: 15, right: 15),
              child: widget.isBool == false
                  ? Count(
                      productId: widget.productId,
                      productImage: widget.productImage,
                      productName: widget.productName,
                      productPrice: widget.productPrice,
                    )
                  : Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: widget.onDelete,
                            child: Icon(
                              Icons.delete,
                              size: 30,
                              color: Colors.black54,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          widget.wishList == false
                              ? Container(
                                  height: 25,
                                  width: 70,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            if (count == 1) {
                                              Fluttertoast.showToast(
                                                msg: "You reach minimum limit",
                                              );
                                            } else {
                                              setState(() {
                                                count = count! - 1;
                                              });
                                              reviewCartProvider!
                                                  .updateReviewCartData(
                                                cartId: widget.productId,
                                                cartImage: widget.productImage,
                                                cartName: widget.productName,
                                                cartPrice: widget.productPrice,
                                                cartQuantity: count,
                                              );
                                            }
                                          },
                                          child: Icon(
                                            Icons.remove,
                                            color: primaryColor,
                                            size: 20,
                                          ),
                                        ),
                                        Text(
                                          "$count",
                                          style: TextStyle(
                                            color: primaryColor,
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            if (count! < 5) {
                                              setState(() {
                                                count = count! + 1;
                                              });
                                              reviewCartProvider!
                                                  .updateReviewCartData(
                                                cartId: widget.productId,
                                                cartImage: widget.productImage,
                                                cartName: widget.productName,
                                                cartPrice: widget.productPrice,
                                                cartQuantity: count,
                                              );
                                            }
                                          },
                                          child: Icon(
                                            Icons.add,
                                            color: primaryColor,
                                            size: 20,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              : Container(),
                        ],
                      ),
                    ),
            ),
          ),
          widget.isBool == false
              ? Container()
              : Divider(
                  height: 1,
                  color: Colors.black45,
                )
        ],
      ),
    );
  }
}
