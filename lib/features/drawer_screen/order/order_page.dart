import 'package:e_commerce_project/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

import 'order_completed_tab.dart';
import 'order_to_received_tab.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            'Order',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Color(0xff1D1E20),
            ),
          ),
          centerTitle: true,
          bottom: TabBar(
            indicatorWeight: 1,
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(width: 2, color: AppColor.primaryColor),
              insets: EdgeInsets.symmetric(horizontal: 20),
            ),
            unselectedLabelColor: AppColor.grayColor,
            indicatorColor: AppColor.primaryColor,
            labelColor: AppColor.primaryColor,
            splashFactory: NoSplash.splashFactory,
            tabs: [
              Text(
                'Completed',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
              ),
              Text(
                'To received',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
              ),
            ],
          ),
        ),
        body: TabBarView(children: [OrderCompletedTab(), OrderToReceivedTab()]),
      ),
    );
  }
}
