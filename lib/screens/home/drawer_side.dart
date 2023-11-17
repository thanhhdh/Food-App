import 'package:flutter/material.dart';
import 'package:food_order_app/providers/user_provider.dart';
import 'package:food_order_app/screens/my_profile/my_profile.dart';
import 'package:food_order_app/screens/review_cart/review_cart.dart';
import 'package:food_order_app/screens/wishList/wish_list.dart';

class DrawerSide extends StatefulWidget {
  UserProvider? userProvider;
  DrawerSide({this.userProvider});
  @override
  State<DrawerSide> createState() => _DrawerSideState();
}

class _DrawerSideState extends State<DrawerSide> {
  @override
  Widget listTile(
      {IconData? iconData, String? title, required VoidCallback onTap}) {
    return ListTile(
      onTap: onTap,
      leading: Icon(iconData, size: 32),
      title: Text(title!, style: TextStyle(color: Colors.black45)),
    );
  }

  @override
  Widget build(BuildContext context) {
    var userData = widget.userProvider!.currentUserData;
    return Drawer(
      child: Container(
        color: Color(0xffd1ad17),
        child: ListView(
          children: [
            DrawerHeader(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white54,
                      radius: 43,
                      child: CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.red,
                        backgroundImage:
                            NetworkImage(userData!.userImage ?? ""),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Welcome"),
                        Text(userData.userName!),
                        Text(userData.userEmail!),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            listTile(
              iconData: Icons.home_outlined,
              title: "Home",
              onTap: () {},
            ),
            listTile(
              iconData: Icons.shop_outlined,
              title: "Review Cart",
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ReviewCart()),
                );
              },
            ),
            listTile(
              iconData: Icons.person_outlined,
              title: "My Profile",
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => MyProfile(
                      userProvider: widget.userProvider,
                    ),
                  ),
                );
              },
            ),
            listTile(
              iconData: Icons.notifications_outlined,
              title: "Notification",
              onTap: () {},
            ),
            listTile(
              iconData: Icons.star_outlined,
              title: "Rating & Review",
              onTap: () {},
            ),
            listTile(
              iconData: Icons.favorite_outlined,
              title: "Wishlist",
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => WishList()));
              },
            ),
            listTile(
              iconData: Icons.copy_outlined,
              title: "Raise a Complaint",
              onTap: () {},
            ),
            listTile(
              iconData: Icons.format_quote_outlined,
              title: "FAQs",
              onTap: () {},
            ),
            Container(
              height: 350,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Contact Support"),
                    SizedBox(
                      height: 10,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Text("Call Us:"),
                          SizedBox(
                            width: 10,
                          ),
                          Text("+123456789"),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Text("Mail Us:"),
                          SizedBox(
                            width: 10,
                          ),
                          Text("+123456789"),
                        ],
                      ),
                    )
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
