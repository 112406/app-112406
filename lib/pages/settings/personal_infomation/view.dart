import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare_app/common/index.dart';
import 'package:intl/intl.dart';
import 'package:validatorless/validatorless.dart';

import 'index.dart';

class PersonalInfomationPage extends GetView<PersonalInfomationController> {
  const PersonalInfomationPage({Key? key}) : super(key: key);

  // 主視圖
  Widget _buildView(BuildContext context) {
    final tName = TextEditingController(text: UserService.to.profile.name);
    final tHeight = TextEditingController(text: UserService.to.profile.height);
    final tWeight = TextEditingController(text: UserService.to.profile.weight);
    final tBirth =
        TextEditingController(text: UserService.to.profile.dateOfBirth);
    return SingleChildScrollView(
        child: Column(
      children: [
        Form(
          child: Column(
            children: [
              /// Name
              TextWidget.textsm(
                LocaleKeys.userName.tr,
                weight: FontWeight.w900,
              ).alignLeft().paddingBottom(8).paddingTop(80),
              TextFormField(
                controller: tName,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.blue60),
                    borderRadius:
                        BorderRadius.all(Radius.circular(AppRadius.input)),
                  ),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 8, 0),
                    child: IconWidget.svg(
                      AssetsMonotoneSvgs.userSv22g,
                      color: AppColors.onSurface,
                    ),
                  ),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: IconWidget.svg(
                      AssetsMonotoneSvgs.editSvg33,
                      color: AppColors.onSurface,
                    ),
                  ),
                ),
              ).paddingBottom(16),

              /// height
              TextWidget.textsm(
                LocaleKeys.settingPersonalInfomationHeight.tr,
                weight: FontWeight.w900,
              ).alignLeft().paddingBottom(8),
              TextFormField(
                controller: tHeight,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.blue60),
                    borderRadius:
                        BorderRadius.all(Radius.circular(AppRadius.input)),
                  ),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 8, 0),
                    child: IconWidget.svg(
                      AssetsMonotoneSvgs.userSv22g,
                      color: AppColors.onSurface,
                    ),
                  ),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: IconWidget.svg(
                      AssetsMonotoneSvgs.editSvg33,
                      color: AppColors.onSurface,
                    ),
                  ),
                ),
              ).paddingBottom(16),

              /// weight
              TextWidget.textsm(
                LocaleKeys.settingPersonalInfomationWeight.tr,
                weight: FontWeight.w900,
              ).alignLeft().paddingBottom(8),
              TextFormField(
                controller: tWeight,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.blue60),
                    borderRadius:
                        BorderRadius.all(Radius.circular(AppRadius.input)),
                  ),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 8, 0),
                    child: IconWidget.svg(
                      AssetsMonotoneSvgs.userSv22g,
                      color: AppColors.onSurface,
                    ),
                  ),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: IconWidget.svg(
                      AssetsMonotoneSvgs.editSvg33,
                      color: AppColors.onSurface,
                    ),
                  ),
                ),
              ).paddingBottom(16),

              /// birth
              TextWidget.textsm(
                LocaleKeys.settingPersonalInfomationDateOfBirth.tr,
                weight: FontWeight.w900,
              ).alignLeft().paddingBottom(8),
              TextFormField(
                controller: tBirth,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.blue60),
                    borderRadius:
                        BorderRadius.all(Radius.circular(AppRadius.input)),
                  ),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 8, 0),
                    child: IconWidget.svg(
                      AssetsMonotoneSvgs.calendarSvg17,
                      color: AppColors.onSurface,
                    ),
                  ),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: IconWidget.svg(
                      AssetsSolidSvgs.chevronDownMdSvg37,
                      color: AppColors.onSurface,
                    ),
                  ),
                ),
                onTap: () async {
                  DateTime? pickedDate = (await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                  ));
                  tBirth.text = DateFormat('yyyy-MM-dd')
                      .format(pickedDate ?? DateTime.now());
                },
              ).paddingBottom(16),

              // -- Form Submit Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    final userData = UserProfileModel(
                      name: tName.text.trim(),
                      height: tHeight.text.trim(),
                      weight: tWeight.text.trim(),
                      dateOfBirth: tBirth.text.trim(),
                    );
                    await controller.updateRecordName(userData);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                      side: BorderSide.none,
                      shape: const StadiumBorder()),
                  child: const Text('UPDATE',
                      style: TextStyle(color: Colors.white)),
                ),
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ],
    )
        // .toColumn(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        // )
        // .paddingHorizontal(AppSpace.page),
        ).paddingHorizontal(AppSpace.page);
  }
  // Widget _buildView() {
  //   return SingleChildScrollView(
  //     child: FutureBuilder(
  //         future: controller.getUserData(),
  //         builder: (context, snapshot) {
  //           if (snapshot.connectionState == ConnectionState.done) {
  //             if (snapshot.hasData) {
  //               UserProfileModel userData = snapshot.data as UserProfileModel;

  //               final tName = TextEditingController(text: userData.name);
  //               final tHeight = TextEditingController(text: userData.height);
  //               final tWeight = TextEditingController(text: userData.weight);
  //               final tBirth =
  //                   TextEditingController(text: userData.dateOfBirth);

  //               return Column(
  //                 children: [
  //                   Form(
  //                     child: Column(
  //                       children: [
  //                         /// Name
  //                         TextWidget.textsm(
  //                           LocaleKeys.userName.tr,
  //                           weight: FontWeight.w900,
  //                         ).alignLeft().paddingBottom(8).paddingTop(80),
  //                         TextFormField(
  //                           controller: tName,
  //                           decoration: InputDecoration(
  //                             border: OutlineInputBorder(
  //                               borderSide: BorderSide(color: AppColors.blue60),
  //                               borderRadius: BorderRadius.all(
  //                                   Radius.circular(AppRadius.input)),
  //                             ),
  //                             prefixIcon: Padding(
  //                               padding: const EdgeInsets.fromLTRB(16, 0, 8, 0),
  //                               child: IconWidget.svg(
  //                                 AssetsMonotoneSvgs.userSv22g,
  //                                 color: AppColors.onPrimary,
  //                               ),
  //                             ),
  //                             suffixIcon: Padding(
  //                               padding: const EdgeInsets.only(right: 16),
  //                               child: IconWidget.svg(
  //                                 AssetsMonotoneSvgs.editSvg33,
  //                                 color: AppColors.onPrimary,
  //                               ),
  //                             ),
  //                           ),
  //                         ).paddingBottom(16),

  //                         /// height
  //                         TextWidget.textsm(
  //                           LocaleKeys.settingPersonalInfomationHeight.tr,
  //                           weight: FontWeight.w900,
  //                         ).alignLeft().paddingBottom(8),
  //                         TextFormField(
  //                           controller: tHeight,
  //                           decoration: InputDecoration(
  //                             border: OutlineInputBorder(
  //                               borderSide: BorderSide(color: AppColors.blue60),
  //                               borderRadius: BorderRadius.all(
  //                                   Radius.circular(AppRadius.input)),
  //                             ),
  //                             prefixIcon: Padding(
  //                               padding: const EdgeInsets.fromLTRB(16, 0, 8, 0),
  //                               child: IconWidget.svg(
  //                                 AssetsMonotoneSvgs.userSv22g,
  //                                 color: AppColors.onPrimary,
  //                               ),
  //                             ),
  //                             suffixIcon: Padding(
  //                               padding: const EdgeInsets.only(right: 16),
  //                               child: IconWidget.svg(
  //                                 AssetsMonotoneSvgs.editSvg33,
  //                                 color: AppColors.onPrimary,
  //                               ),
  //                             ),
  //                           ),
  //                         ).paddingBottom(16),

  //                         /// weight
  //                         TextWidget.textsm(
  //                           LocaleKeys.settingPersonalInfomationWeight.tr,
  //                           weight: FontWeight.w900,
  //                         ).alignLeft().paddingBottom(8),
  //                         TextFormField(
  //                           controller: tWeight,
  //                           decoration: InputDecoration(
  //                             border: OutlineInputBorder(
  //                               borderSide: BorderSide(color: AppColors.blue60),
  //                               borderRadius: BorderRadius.all(
  //                                   Radius.circular(AppRadius.input)),
  //                             ),
  //                             prefixIcon: Padding(
  //                               padding: const EdgeInsets.fromLTRB(16, 0, 8, 0),
  //                               child: IconWidget.svg(
  //                                 AssetsMonotoneSvgs.userSv22g,
  //                                 color: AppColors.onPrimary,
  //                               ),
  //                             ),
  //                             suffixIcon: Padding(
  //                               padding: const EdgeInsets.only(right: 16),
  //                               child: IconWidget.svg(
  //                                 AssetsMonotoneSvgs.editSvg33,
  //                                 color: AppColors.onPrimary,
  //                               ),
  //                             ),
  //                           ),
  //                         ).paddingBottom(16),

  //                         /// birth
  //                         TextWidget.textsm(
  //                           LocaleKeys.settingPersonalInfomationDateOfBirth.tr,
  //                           weight: FontWeight.w900,
  //                         ).alignLeft().paddingBottom(8),
  //                         TextFormField(
  //                           controller: tBirth,
  //                           decoration: InputDecoration(
  //                             border: OutlineInputBorder(
  //                               borderSide: BorderSide(color: AppColors.blue60),
  //                               borderRadius: BorderRadius.all(
  //                                   Radius.circular(AppRadius.input)),
  //                             ),
  //                             prefixIcon: Padding(
  //                               padding: const EdgeInsets.fromLTRB(16, 0, 8, 0),
  //                               child: IconWidget.svg(
  //                                 AssetsMonotoneSvgs.calendarSvg17,
  //                                 color: AppColors.onPrimary,
  //                               ),
  //                             ),
  //                             suffixIcon: Padding(
  //                               padding: const EdgeInsets.only(right: 16),
  //                               child: IconWidget.svg(
  //                                 AssetsSolidSvgs.chevronDownMdSvg37,
  //                                 color: AppColors.onPrimary,
  //                               ),
  //                             ),
  //                           ),
  //                           onTap: () async {
  //                             DateTime? pickedDate = (await showDatePicker(
  //                               context: context,
  //                               initialDate: DateTime.now(),
  //                               firstDate: DateTime(1900),
  //                               lastDate: DateTime.now(),
  //                             ));
  //                             tBirth.text = DateFormat('yyyy-MM-dd')
  //                                 .format(pickedDate ?? DateTime.now());
  //                           },
  //                         ).paddingBottom(16),

  //                         // -- Form Submit Button
  //                         SizedBox(
  //                           width: double.infinity,
  //                           child: ElevatedButton(
  //                             onPressed: () async {
  //                               final userData = UserProfileModel(
  //                                 name: tName.text.trim(),
  //                                 height: tHeight.text.trim(),
  //                                 weight: tWeight.text.trim(),
  //                                 dateOfBirth: tBirth.text.trim(),
  //                               );
  //                               await controller.updateRecordName(userData);
  //                             },
  //                             style: ElevatedButton.styleFrom(
  //                                 backgroundColor: Colors.amber,
  //                                 side: BorderSide.none,
  //                                 shape: const StadiumBorder()),
  //                             child: const Text('UPDATE',
  //                                 style: TextStyle(color: Colors.white)),
  //                           ),
  //                         ),
  //                         const SizedBox(height: 12),
  //                       ],
  //                     ),
  //                   ),
  //                 ],
  //               );
  //             } else if (snapshot.hasError) {
  //               return Center(child: Text(snapshot.error.toString()));
  //             } else {
  //               return const Center(child: Text('Something went wrong.'));
  //             }
  //           } else {
  //             return const Center(child: CircularProgressIndicator());
  //           }
  //         }),
  //   ).paddingHorizontal(AppSpace.page);
  // }

  Widget profileView() {
    return const Stack(
      children: [
        Positioned(
          top: 280.0,
          child: CircleAvatar(
            radius: 32,
            backgroundColor: Colors.white,
            child: Icon(Icons.person_outline_rounded),
          ),
        )
        // Positioned(
        //     bottom: 1,
        //     right: 1,
        //     child: Container(
        //       height: 30,
        //       width: 30,
        //       decoration: const BoxDecoration(
        //           color: Colors.amber,
        //           borderRadius: BorderRadius.all(Radius.circular(20))),
        //       child: const Icon(
        //         Icons.edit,
        //         color: Colors.deepPurple,
        //         size: 20,
        //       ),
        //     ))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PersonalInfomationController>(
      init: PersonalInfomationController(),
      id: "personal_infomation",
      builder: (_) {
        return Scaffold(
          // appBar: AppBar(
          //   backgroundColor: Colors.deepPurple,
          //   centerTitle: true,
          //   title: const Text(
          //     'Personal Information',
          //     style: TextStyle(
          //         fontSize: 17, color: Colors.white, letterSpacing: 0.53),
          //   ),
          //   shape: const RoundedRectangleBorder(
          //     borderRadius: BorderRadius.vertical(
          //       bottom: Radius.circular(30),
          //     ),
          //   ),
          //   // bottom: PreferredSize(
          //   //     preferredSize: const Size.fromHeight(110.0),
          //   //     child: getAppBottomView()),
          // ),
          appBar: PreferredSize(
              preferredSize: Size(MediaQuery.of(context).size.width,
                  AppBar().preferredSize.height + 80),
              child: Stack(
                children: [
                  Container(
                    color: Theme.of(context).primaryColor,
                    height: AppBar().preferredSize.height + 80,
                    width: MediaQuery.of(context).size.width,
                  ),
                  Positioned(
                    child: AppBar(
                      title: const Text(
                        'Personal Information',
                        style: TextStyle(
                            fontSize: 17,
                            color: Colors.white,
                            letterSpacing: 0.53),
                      ),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(30),
                        ),
                      ),
                    ),
                  ),
                  // const Positioned(
                  //   top: 150,
                  //   right: 20,
                  //   left: 20,
                  //   child: CircleAvatar(
                  //     radius: 32,
                  //     backgroundColor: Colors.white,
                  //     child: Icon(Icons.person_outline_rounded),
                  //   ),
                  // ),
                ],
              )),
          body: _buildView(context),
        );
      },
    );
  }
// AppBar().preferredSize.height
  // _appBar(height) => PreferredSize(
  //     preferredSize: Size(MediaQuery.of(context).size.width, height + 80),
  //     child: Stack(
  //       children: [
  //         Container(
  //           color: Theme.of(context).primaryColor,
  //           height: height + 80,
  //           width: MediaQuery.of(context).size.width,
  //         ),
  //         Positioned(child: AppBar())
  //       ],
  //     ));

  // Widget _appBar(height) => PreferredSize(
  //     preferredSize: Size(MediaQuery.of(context).size.width, height + 80),
  //     child: Stack(
  //       children: [
  //         Container(
  //           color: Theme.of(context).primaryColor,
  //           height: height + 80,
  //           width: MediaQuery.of(context).size.width,
  //         ),
  //         Positioned(child: AppBar())
  //       ],
  //     ));

  // Widget getAppBottomView() {
  //   return Container(
  //     padding: const EdgeInsets.only(left: 30, bottom: 20),
  //     child: Row(
  //       children: [
  //         getProfileView(),
  //         // Container(
  //         //   margin: const EdgeInsets.only(left: 20),
  //         //   child: const Column(
  //         //     crossAxisAlignment: CrossAxisAlignment.start,
  //         //     children: [
  //         //       Text(
  //         //         'Hubert Wong',
  //         //         style: TextStyle(
  //         //             fontSize: 22,
  //         //             fontWeight: FontWeight.w700,
  //         //             color: Colors.white),
  //         //       ),
  //         //       Text(
  //         //         'hubert.wong@mail.com',
  //         //         style: TextStyle(
  //         //           fontSize: 13,
  //         //           color: Colors.white,
  //         //         ),
  //         //       ),
  //         //       Text(
  //         //         '+1 1254 251 241',
  //         //         style: TextStyle(
  //         //           fontSize: 13,
  //         //           color: Colors.white,
  //         //         ),
  //         //       ),
  //         //     ],
  //         //   ),
  //         // )
  //       ],
  //     ),
  //   );
  // }

  // Widget getProfileView() {
  //   return const Stack(
  //     children: [
  //       Positioned(
  //         top: 180.0,
  //         child: CircleAvatar(
  //           radius: 32,
  //           backgroundColor: Colors.white,
  //           child: Icon(Icons.person_outline_rounded),
  //         ),
  //       )
  //       // CircleAvatar(
  //       //   radius: 32,
  //       //   backgroundColor: Colors.white,
  //       //   child: Icon(Icons.person_outline_rounded),
  //       // ),
  //       // Positioned(
  //       //     bottom: 1,
  //       //     right: 1,
  //       //     child: Container(
  //       //       height: 30,
  //       //       width: 30,
  //       //       decoration: const BoxDecoration(
  //       //           color: Colors.amber,
  //       //           borderRadius: BorderRadius.all(Radius.circular(20))),
  //       //       child: const Icon(
  //       //         Icons.edit,
  //       //         color: Colors.deepPurple,
  //       //         size: 20,
  //       //       ),
  //       //     ))
  //     ],
  //   );
  // }
}
