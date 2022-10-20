import 'package:demo/app/core/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../main.dart';

class NestedPage extends StatelessWidget {
  const NestedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Nested Page")),
      body: TextButton(
        child: Text("Navigate to page detail"),
        onPressed: () {
          navigationService.pushNamed(AppRoute.pageDetail);
        },
      ),
    );
  }
}
