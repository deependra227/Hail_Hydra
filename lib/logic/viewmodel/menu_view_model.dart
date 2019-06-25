import 'package:flutter/material.dart';
import 'package:flutter_uikit/model/menu.dart';
import 'package:flutter_uikit/utils/uidata.dart';

class MenuViewModel {
  List<Menu> menuItems;

  MenuViewModel({this.menuItems});

  getMenuItems() {
    return menuItems = <Menu>[
      Menu(
          title: "Doctor 1",
          menuColor: Color(0xff050505),
          icon: Icons.person,
          image: UIData.doctor1,
          items: ["View Profile", "Profile 2", "Profile 3", "Profile 4"],
          address: UIData.dc1),
      Menu(
          title: "Doctor 2"  ,
          menuColor: Color(0xffc8c4bd),
          icon: Icons.person,
          image: UIData.doctor2,
          items: [
            "Shopping List",
            "Shopping Details",
            "Product Details",
            "Shopping 4"],
           address: UIData.dc2),
      Menu(
          title: "Doctor 3",
          menuColor: Color(0xffc7d8f4),
          icon: Icons.person,
          image: UIData.doctor3,
          items: ["Login With OTP", "Login 2", "Sign Up", "Login 4"],
          address: UIData.doctor),

      Menu(
          title: "Doctor 4",
          menuColor: Color(0xff7f5741),
          icon: Icons.person,
          image: UIData.doctor4,
          items: ["Feed", "Tweets", "Timeline 3", "Timeline 4"]),
      Menu(
          title: "Doctor 5",
          menuColor: Color(0xff261d33),
          icon: Icons.person,
          image: UIData.doctor5,
          items: ["Dashboard 1", "Dashboard 2", "Dashboard 3", "Dashboard 4"]),
      Menu(
          title: "Doctor 6",
          menuColor: Color(0xff2a8ccf),
          icon: Icons.person,
          image: UIData.doctor6,
          items: ["Device Settings", "Settings 2", "Settings 3", "Settings 4"]),
      Menu(
          title: "Doctor 7",
          menuColor: Color(0xffe19b6b),
          icon: Icons.person,
          image: UIData.doctor7,
          items: ["No Search Result", "No Internet", "No Item 3", "No Item 4"]),
      Menu(
          title: "Doctor 8",
          menuColor: Color(0xffddcec2),
          icon: Icons.person,
          image: UIData.doctor8,
          items: ["Credit Card", "Payment Success", "Payment 3", "Payment 4"]),
    ];
  }
}
