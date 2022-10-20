import 'package:demo/app/core/app_resources.dart';
import 'package:demo/app/pages/detail/detail.dart';
import 'package:demo/app/pages/my_document/my_document.dart';
import 'package:demo/app/pages/settings/settings.dart';
import 'package:demo/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../core/app_router.dart';
import '../../services/navigation_service.dart';
import '../../widgets/bottom_navigate_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIdx = 0;

  Widget _buildAppButton() {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.colorInchworm,
      ),
      padding: const EdgeInsets.all(8.0),
      child: IconButton(
        icon: const Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIdx,
        children: const [MyDocument(), Settings()],
      ),
      bottomNavigationBar: AppBottomNavigationBar(
        onTabChanged: (index) {
          setState(() {
            _currentIdx = index;
          });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _buildAppButton(),
    );
  }
}
