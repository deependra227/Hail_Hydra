import 'package:flutter/material.dart';
import 'package:demo1/menuModel.dart';
import 'doctor_page.dart';

//class MenuViewModel {
//  List<Menu> menuItems;
//
//  MenuViewModel({this.menuItems});
//
//  getMenuItems() {
//    return menuItems = <Menu>[
//      Menu(
//          title: "Doctor 1",
//          menuColor: Color(0xff050505),
//          image: 'assets/doctor1.jpg',
//          site: ''),
//
//    ];
//  }
//}

class Menu1{
  static List<Menu> menuList =[
    Menu(
      id: 1,
      title: "Doctor 1",
          menuColor: Color(0xff050505),
          image: 'assets/doctor1.jpg',
          site: ''),

    Menu(
      id: 9,
    title: "Doctor 9",
    menuColor: Color(0xff050505),
    image: 'assets/doctor1.jpg',
    site: '/doctor_page'),

  Menu(
    id: 2,
  title: "Doctor 2",
  menuColor: Color(0xff050505),
  image: 'assets/doctor1.jpg',
  site: ''),
  Menu(
    id: 3,
  title: "Doctor 3",
  menuColor: Color(0xff050505),
  image: 'assets/doctor1.jpg',
  site: ''),

  Menu(
  title: "Doctor 4",
  menuColor: Color(0xff050505),
  image: 'assets/doctor1.jpg',
  site: ''),

  Menu(
  title: "Doctor 5",
  menuColor: Color(0xff050505),
  image: 'assets/doctor1.jpg',
  site: ''),
  Menu(
  title: "Doctor 6",
  menuColor: Color(0xff050505),
  image: 'assets/doctor1.jpg',
  site: ''),

  Menu(
  title: "Doctor 7",
  menuColor: Color(0xff050505),
  image: 'assets/doctor1.jpg',
  site: ''),

  Menu(
  title: "Doctor 8",
  menuColor: Color(0xff050505),
  image: 'assets/doctor1.jpg',
  site: '')

    ];
}

