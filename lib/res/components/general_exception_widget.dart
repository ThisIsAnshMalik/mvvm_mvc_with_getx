import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_mvc_with_getx/res/Colors/app_colors.dart';

class GeneralExceptionWidget extends StatefulWidget {
  final VoidCallback onTap;
  const GeneralExceptionWidget({Key? key, required this.onTap})
      : super(key: key);

  @override
  State<GeneralExceptionWidget> createState() => _GeneralExceptionWidgetState();
}

class _GeneralExceptionWidgetState extends State<GeneralExceptionWidget> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.error,
            color: AppColor.redColor,
            size: 70,
          ),
          SizedBox(
            height: height * 0.05,
          ),
          Text(
            'general_exception'.tr,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: height * 0.2,
          ),
          InkWell(
            onTap: widget.onTap,
            child: Container(
              height: height * 0.06,
              width: width * 0.6,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColor.primaryButtonColor,
              ),
              child: Center(
                child: Text(
                  'retry'.tr,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
