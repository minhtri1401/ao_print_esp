import 'package:demo/app/core/app_router.dart';
import 'package:demo/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Settings")),
      body: IconButton(
        icon: Icon(Icons.logo_dev),
        onPressed: () => {
          Navigator.of(context).pushNamed(AppRoute.pageNested),
        },
      ),
    );
  }
}
