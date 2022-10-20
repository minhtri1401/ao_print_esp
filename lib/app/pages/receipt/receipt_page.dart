import 'package:demo/app/core/app_resources.dart';
import 'package:demo/app/pages/receipt/bloc/receipt_bloc.dart';
import 'package:demo/app/services/navigation_service.dart';
import 'package:demo/domain/entities/receipt_entity.dart';
import 'package:demo/setup.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class Receipt extends StatelessWidget {
  const Receipt({super.key});

  Widget _storeInfo(String header) {
    return Text(
      header,
      style: regularSFTextStyle(size: 14.sp, color: AppColors.colorArsenic),
    );
  }

  Widget _headerRow(String header) {
    return Text(
      header,
      style: mediumSFTextStyle(
        size: 10.sp,
        color: AppColors.colorArsenic,
      ),
    );
  }

  Widget _buildReceiptItemSection() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      height: 165.h,
      width: double.infinity,
      color: AppColors.colorSilverSand,
      child: BlocBuilder<ReceiptBloc, ReceiptState>(
        builder: (context, state) {
          return Column(
            children: [
              SizedBox(height: 15.h),
              Container(
                width: double.infinity,
                height: 25.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4.w),
                ),
                child: Row(
                  children: [
                    const Spacer(flex: 1),
                    Expanded(flex: 1, child: _headerRow("QTY")),
                    Expanded(flex: 3, child: _headerRow("ITEM")),
                    Expanded(flex: 1, child: _headerRow("RICE")),
                    Expanded(flex: 1, child: _headerRow("Total")),
                    const Spacer(flex: 1)
                  ],
                ),
              ),
              SizedBox(height: 3.h),
              Expanded(
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: state.receipts.length,
                  separatorBuilder: (_, index) {
                    return SizedBox(height: 4.h);
                  },
                  itemBuilder: (_, index) {
                    return ItemReceipt(
                      qty: state.receipts[index].qty,
                      item: state.receipts[index].item,
                      rice: state.receipts[index].price,
                      total: state.receipts[index].total,
                    );
                  },
                ),
              ),
              SizedBox(height: 3.h),
              InkWell(
                onTap: () {
                  context
                      .read<ReceiptBloc>()
                      .add(AddReceiptEvent(ReceiptEntity()));
                },
                child: DottedBorder(
                  color: AppColors.colorSilverSand,
                  borderType: BorderType.RRect,
                  radius: Radius.circular(5.r),
                  padding: EdgeInsets.all(0.w),
                  strokeWidth: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.r),
                      color: Colors.white,
                    ),
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                    width: double.infinity,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Add new item",
                        style: mediumSFTextStyle(
                          size: 14.sp,
                          color: AppColors.colorArsenic,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
            ],
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator.get<ReceiptBloc>()..add(InitialEvent()),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          leading: InkWell(
            onTap: () {
              locator.get<NavigationService>().goBack();
            },
            child: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.white,
          title: Text(
            "new receipt".toUpperCase(),
            style: boldSFTextStyle(color: Colors.black, size: 14.sp)
                .copyWith(fontStyle: FontStyle.italic),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: TextButton(
                onPressed: () {},
                child: Text("Print".toUpperCase(),
                    style: regularSFTextStyle(
                      size: 14.sp,
                      color: AppColors.colorInchworm,
                    ).copyWith(fontStyle: FontStyle.italic)),
              ),
            ),
          ],
        ),
        body: SafeArea(
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(AppIcons.imgLogo),
                    Text(
                      "your store name".toUpperCase(),
                      style: boldSFTextStyle(
                        size: 14.sp,
                        color: AppColors.colorDarkJungle,
                      ).copyWith(fontStyle: FontStyle.italic),
                    ),
                    SizedBox(height: 11.h),
                    _storeInfo("Your store address"),
                    _storeInfo("Store telephone number"),
                    _storeInfo("Store website link"),
                    SizedBox(height: 20.h),
                    _buildReceiptItemSection(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ItemReceipt extends StatelessWidget {
  const ItemReceipt({
    super.key,
    required this.qty,
    required this.item,
    required this.rice,
    required this.total,
  });

  final int qty;
  final String item;
  final double rice;
  final double total;

  Widget _headerRow(String header) {
    return Text(
      header,
      style: mediumSFTextStyle(
        size: 10.sp,
        color: AppColors.colorArsenic,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 40.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4.w),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: SvgPicture.asset('assets/icons/ic_remove.svg'),
          ),
          Expanded(flex: 1, child: _headerRow("$qty")),
          Expanded(flex: 3, child: _headerRow(item)),
          Expanded(flex: 1, child: _headerRow("$rice")),
          Expanded(flex: 1, child: _headerRow("$total")),
          Expanded(flex: 1, child: SvgPicture.asset('assets/icons/ic_edit.svg'))
        ],
      ),
    );
  }
}
