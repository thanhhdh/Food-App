import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  Widget singleProducts() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      height: 230,
      width: 160,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Expanded(
            flex: 2,
            child: Image.network(
                'https://png.pngtree.com/png-clipart/20191030/ourlarge/pngtree-set-of-fresh-mint-leaf-on-transparent-png-image_1915764.jpg')),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Fresh Basil',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                Text(
                  '50\$/50 Gram',
                  style: TextStyle(color: Colors.grey),
                ),
                Row(
                  children: [
                    Expanded(
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
                    )),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                        child: Container(
                      height: 30,
                      width: 50,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.remove,
                              size: 15,
                              color: Color(0xffd0b84c),
                            ),
                            Text(
                              '1',
                              style: TextStyle(
                                  color: Color(0xffd0b84c),
                                  fontWeight: FontWeight.bold),
                            ),
                            Icon(
                              Icons.add,
                              size: 15,
                              color: Color(0xffd0b84c),
                            )
                          ]),
                    )),
                  ],
                )
              ],
            ),
          ),
        ),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 219, 218, 218),
      drawer: const Drawer(),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          'Home',
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        actions: const [
          CircleAvatar(
            radius: 12,
            backgroundColor: Color(0xffd4d181),
            child: Icon(
              Icons.search,
              size: 17,
              color: Colors.black,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: CircleAvatar(
              backgroundColor: Color(0xffd4d181),
              radius: 12,
              child: Icon(
                Icons.shop,
                size: 17,
                color: Colors.black,
              ),
            ),
          )
        ],
        backgroundColor: const Color(0xffd6b738),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: ListView(children: [
          Container(
            height: 150,
            decoration: BoxDecoration(
                image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        'https://as1.ftcdn.net/v2/jpg/06/04/86/32/1000_F_604863201_e9Yxf2njJbh0qn7Jx8pWRmrWCiwcfCst.jpg')),
                color: Colors.red,
                borderRadius: BorderRadius.circular(10)),
            child: Row(children: [
              Expanded(
                  child: Container(
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 120, bottom: 10),
                    child: Container(
                      height: 50,
                      width: 70,
                      decoration: const BoxDecoration(
                          color: Color(0xffd1ad17),
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(50),
                              bottomLeft: Radius.circular(50))),
                      child: const Center(
                        child: Text(
                          'Vegi',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              shadows: [
                                BoxShadow(
                                    color: Colors.green,
                                    blurRadius: 10,
                                    offset: Offset(3, 3)),
                              ]),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    '30% OFF',
                    style: TextStyle(
                        fontSize: 40,
                        color: Colors.yellow[100],
                        fontWeight: FontWeight.bold),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      'On all vegetables products',
                      style: TextStyle(color: Colors.yellow),
                    ),
                  )
                ]),
              )),
              Expanded(child: Container()),
            ]),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              vertical: 5,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Herbs Seasonings'),
                Text(
                  'View all',
                  style: TextStyle(color: Colors.grey),
                )
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                singleProducts(),
                singleProducts(),
                singleProducts(),
                singleProducts(),
                singleProducts(),
                singleProducts(),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              vertical: 5,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Fresh Fruits'),
                Text(
                  'View all',
                  style: TextStyle(color: Colors.grey),
                )
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                singleProducts(),
                singleProducts(),
                singleProducts(),
                singleProducts(),
                singleProducts(),
                singleProducts(),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
