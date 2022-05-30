// @dart=2.9

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oudarticle/cubit/article_cubit.dart';
import 'package:oudarticle/cubit/payment_cubit.dart';
import 'package:oudarticle/cubit/user_cubit.dart';
import 'package:oudarticle/pages/home_page.dart';
import 'package:oudarticle/pages/splash_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ArticleCubit()),
        BlocProvider(create: (context) => UserCubit()),
        BlocProvider(create: (context) => PaymentCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          "/": (context) => SpalshPage(),
          "/home": (context) => HomePage()
        },
      ),
    );
  }
}
