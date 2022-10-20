import 'package:demo/app/core/app_resources.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppBottomNavigationBar extends StatefulWidget {
  const AppBottomNavigationBar({super.key, required this.onTabChanged});
  final Function(int) onTabChanged;

  @override
  State<AppBottomNavigationBar> createState() => _AppBottomNavigationBarState();
}

class _AppBottomNavigationBarState extends State<AppBottomNavigationBar> {
  var _currentIdx = -1;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 107.h,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(23)),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Container(
                  color: AppColors.colorArsenic,
                  child: _BottomButton(
                    icon: SvgPicture.asset('assets/icons/ic_document.svg'),
                    title: 'My document',
                    onPressed: () {
                      setState(() {
                        _currentIdx = 0;
                      });
                      widget.onTabChanged.call(_currentIdx);
                    },
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  color: AppColors.colorArsenic,
                  child: _BottomButton(
                    icon: SvgPicture.asset('assets/icons/ic_setting.svg'),
                    title: 'Settingss',
                    onPressed: () {
                      setState(() {
                        _currentIdx = 1;
                      });
                      widget.onTabChanged.call(_currentIdx);
                    },
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class _BottomButton extends StatelessWidget {
  const _BottomButton({
    super.key,
    this.isHiglighted = false,
    this.onPressed,
    required this.title,
    required this.icon,
  });
  final Widget icon;
  final String title;
  final bool isHiglighted;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPressed?.call(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          icon,
          SizedBox(height: 7.h),
          Text(
            title,
            style: boldSFTextStyle(
              size: 12.sp,
              color: Colors.white,
            ).copyWith(fontStyle: FontStyle.italic),
          )
        ],
      ),
    );
  }
}
