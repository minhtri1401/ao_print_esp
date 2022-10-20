import 'package:demo/app/core/app_resources.dart';
import 'package:demo/app/core/app_router.dart';
import 'package:demo/app/services/navigation_service.dart';
import 'package:demo/main.dart';
import 'package:demo/setup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyDocument extends StatelessWidget {
  const MyDocument({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorDarkJungle,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    "BLE",
                    style: boldSFTextStyle(
                      size: 36.sp,
                      color: AppColors.colorInchworm,
                    ).copyWith(fontStyle: FontStyle.italic),
                  ),
                ],
              ),
              SizedBox(height: 40.h),
              CardView(
                title: "Receipt",
                subTitle: "Create and print new receipt",
                imgAsset: AppIcons.imgReceipt,
                navigate: () {
                  locator
                      .get<NavigationService>()
                      .pushNamed(AppRoute.pageReceipt);
                },
              ),
              SizedBox(height: 20.h),
              CardView(
                title: "QR code",
                subTitle: "Create and print new QR code",
                imgAsset: AppIcons.imgQrCode,
                navigate: () {
                  Navigator.of(context).pushNamed(AppRoute.pageMySettings);
                },
              ),
              SizedBox(height: 20.h),
              CardView(
                title: "Bar Code",
                subTitle: "Create and print new receipt",
                imgAsset: AppIcons.imgBarCode,
                navigate: () {
                  Navigator.of(context).pushNamed(AppRoute.pageMySettings);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CardView extends StatelessWidget {
  const CardView(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.imgAsset,
      required this.navigate});

  final String title;
  final String subTitle;
  final String imgAsset;
  final VoidCallback? navigate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: SizedBox(
        height: 150.h,
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(3.w)),
              side: BorderSide(
                color: const Color(0x1AFFFFFF),
                width: 0.5.w,
              )),
          color: AppColors.colorArsenic,
          child: InkWell(
            onTap: navigate,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Image.asset(imgAsset),
                  ),
                ),
                SizedBox(width: 40.w),
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          title.toUpperCase(),
                          style: boldSFTextStyle(
                            color: Colors.white,
                            size: 24.sp,
                          ).copyWith(fontStyle: FontStyle.italic),
                        ),
                        SizedBox(height: 6.h),
                        Text(
                          subTitle,
                          style: regularSFTextStyle(
                            color: Colors.white,
                            size: 14.sp,
                          ).copyWith(fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
