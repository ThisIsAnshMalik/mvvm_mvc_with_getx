import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_mvc_with_getx/data/app_exception.dart';
import 'package:mvvm_mvc_with_getx/data/responce/status.dart';
import 'package:mvvm_mvc_with_getx/res/components/general_exception_widget.dart';
import 'package:mvvm_mvc_with_getx/res/components/internet_exception_widget.dart';

import 'package:mvvm_mvc_with_getx/view_models/controller/home/home_view_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final homeController = Get.put(HomeController());

  @override
  void initState() {
    // TODO: implement initState
    homeController.userListApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () {
          switch (homeController.rxRequestStatus.value) {
            case Status.LOADING:
              return const Center(
                child: CircularProgressIndicator(),
              );

            case Status.ERROR:
              if (homeController.error.value == "No internet") {
                return InternetExceptionWidget(onTap: () {
                  homeController.retryUserListApi();
                });
              } else {
                return GeneralExceptionWidget(onTap: (() {
                  homeController.retryUserListApi();
                }));
              }

            case Status.COMPLETED:
              return ListView.builder(
                  itemCount: homeController.userList.value.data!.length,
                  itemBuilder: ((context, index) {
                    return Card(
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(homeController
                              .userList.value.data![index].avatar
                              .toString()),
                        ),
                        title: Text(homeController
                            .userList.value.data![index].firstName
                            .toString()),
                        subtitle: Text(homeController
                            .userList.value.data![index].email
                            .toString()),
                      ),
                    );
                  }));
          }
        },
      ),
    );
  }
}
