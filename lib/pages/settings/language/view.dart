import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare_app/common/index.dart';

import 'index.dart';

class LanguagePage extends GetView<LanguageController> {
  const LanguagePage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    // return ListView.separated(
    //     itemBuilder: (BuildContext context, int index){
    //       return ListTile(
    //         title: Text(""),
    //         onTap: (){
    //           controller.onLanguageSelected(index);
    //         },
    //       );
    //     },
    //     separatorBuilder: (BuildContext context, int index){
    //       return const Divider();
    //     },
    //     itemCount: 3);
    return ListTile(
      onTap: controller.onLanguageSelected,
      title: Text(
        "語言 : ${ConfigService.to.locale.toLanguageTag()}",
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LanguageController>(
      init: LanguageController(),
      id: "language",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("language")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
