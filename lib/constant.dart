import 'package:flutter/material.dart';
import 'package:store_app3/widgets/drawer_widget.dart';

import 'views/cart_view.dart';
import 'views/favorite_view.dart';
import 'widgets/home_view_body.dart';

const List<Widget> widgets = [
  HomeViewBody(),
  FavoriteView(),
  CartView(),
  DrawerWidget(),
];
