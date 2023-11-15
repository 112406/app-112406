import 'package:flutter/material.dart';
import 'package:healthcare_app/common/index.dart';

/// 功能展示項
class FunctionItemWidget extends StatelessWidget {
  // List<FunctionModel>? items = [
  //   FunctionModel(
  //     image: AssetsImages.heartratecardPng,
  //     title: LocaleKeys.ghomeFuncCardHeartRate.tr,
  //     desc: LocaleKeys.ghomeFuncCardHeartRateDesc.tr,
  //   ),
  //   FunctionModel(
  //     image: AssetsImages.bloodpressurecardPng,
  //     title: LocaleKeys.ghomeFuncCardBloodPressure.tr,
  //     desc: LocaleKeys.ghomeFuncCardBloodPressureDesc.tr,
  //   ),
  //   FunctionModel(
  //     image: AssetsImages.sleepcardPng,
  //     title: LocaleKeys.ghomeFuncCardSleep.tr,
  //     desc: LocaleKeys.ghomeFuncCardSleepDesc.tr,
  //   ),
  // ];

  // List listData = [
  //   {
  //     "title": LocaleKeys.ghomeFuncCardBloodPressure.tr,
  //     "desc": LocaleKeys.ghomeFuncCardBloodPressureDesc.tr,
  //     "image": AssetsImages.bloodpressurecardPng,
  //   },
  //   {
  //     "title": "AAA",
  //     "desc": "candy",
  //     "image": AssetsImages.sleepcardPng,
  //   }
  // ];

  const FunctionItemWidget({super.key});

  // FunctionItemWidget({super.key});

  // Widget _cardItem() {
  //   return card();
  // }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Row(
        children: [
          AspectRatio(
            aspectRatio: 16 / 13,
            child: Image.asset(
              AssetsImages.bloodpressurecardPng,
              fit: BoxFit.cover,
            ),
          ),
          const ListTile(
            title: Text("AAA"),
            subtitle: Text("candy"),
          )
        ],
      ),
    );

    // children: listData
    //     .map((item) => Card(
    //           margin: const EdgeInsets.all(10),
    //           child: Row(
    //             children: [
    //               AspectRatio(
    //                 aspectRatio: 16 / 13,
    //                 child: Image.asset(
    //                   item["image"],
    //                   fit: BoxFit.cover,
    //                 ),
    //               ),
    //               ListTile(
    //                 title: Text(item["title"]),
    //                 subtitle: Text(item["desc"]),
    //               )
    //             ],
    //           ),
    //         ))
    //     .toList(),
  }

  /// 點擊事件
  // final Function()? onTap;

  /// 商品資料模型
  // final ProductModel product;

  /// 圖片寬
  // final double? imgWidth;

  /// 圖片高
  // final double? imgHeight;

  // const ProductItemWidget(
  //   this.product, {
  //   Key? key,
  //   this.onTap,
  //   this.imgWidth,
  //   this.imgHeight,
  // }) : super(key: key);

  // Widget _buildView(BoxConstraints constraints) {
  //   var ws = <Widget>[
  //     // 圖片
  //     if (product.images?.isNotEmpty == true)
  //       ImageWidget.url(
  //         product.images?.first.src ?? "",
  //         fit: BoxFit.cover,
  //         width: imgWidth ?? constraints.minWidth,
  //         height: imgHeight,
  //       ),

  //     // 描述
  //     <Widget>[
  //       // 標題
  //       TextWidget.body2(product.name ?? ""),

  //       // 价格
  //       if (product.price != null)
  //         TextWidget.body2(
  //           product.price ?? "",
  //           weight: FontWeight.bold,
  //         ),
  //     ]
  //         .toColumn(
  //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //         )
  //         .paddingHorizontal(5)
  //         .expanded(),
  //   ];

  //   return ws
  //       .toColumn(
  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //       )
  //       // .backgroundColor(AppColors.onPrimary)
  //       .card(
  //         blurRadius: 5,
  //       )
  //       .padding(all: 5)
  //       .onTap(() {
  //     if (onTap != null) {
  //       onTap?.call();
  //     } else {
  //       Get.toNamed(
  //         RouteNames.goodsProductDetails,
  //         arguments: {
  //           "id": product.id,
  //         },
  //       );
  //     }
  //   });
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return LayoutBuilder(
  //     builder: (BuildContext context, BoxConstraints constraints) {
  //       // return _buildView(constraints);
  //     },
  //   );
  // }
}
