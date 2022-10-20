import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../main.dart';
import '../../core/app_router.dart';

class Detail extends StatelessWidget {
  const Detail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detail")),
      body: TextButton(
        child: Text("Navigate to Nested"),
        onPressed: () {
          Navigator.of(context).pushNamed(AppRoute.pageNested);
        },
      ),
    );
  }
}
