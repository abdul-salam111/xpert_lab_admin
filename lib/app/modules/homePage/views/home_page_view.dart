import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../appConst/index.dart';
import '../../../commonWidgets/index.dart';
import '../../../routes/app_pages.dart';
import '../../index.dart';

class HomePageView extends GetView<HomePageController> {
  const HomePageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: SizedBox(
          width: 90.w,
          child: Drawer(
            child: Column(
              children: [
                appMainLogoForDrawer(),
                Divider(
                  height: 50.h,
                ),
                dNButton(iconName: homeicon, tabname: "Home", onPressed: () {}),
                dNButton(
                    iconName: addtest,
                    tabname: "Add New Test",
                    onPressed: () {
                      Get.toNamed(Routes.ADDNEWTEST);
                    }),
                dNButton(
                    iconName: addnewtestCategory,
                    tabname: "Add Category",
                    onPressed: () {
                      Get.toNamed(Routes.ADD_CATEGORY);
                    }),
                dNButton(
                    iconName: bookingicon,
                    tabname: "Active Bookings",
                    onPressed: () {
                      Get.toNamed(Routes.ACTIVE_BOOKINGS);
                    }),
                dNButton(
                    iconName: feedbacks,
                    tabname: "Feedbacks",
                    onPressed: () {
                      Get.toNamed(Routes.FEEDBACKS);
                    }),
                Expanded(child: Container()),
                dNButton(
                    iconName: settings, tabname: "Settings", onPressed: () {}),
                dNButton(iconName: logout, tabname: "Logout", onPressed: () {}),
                20.heightBox
              ],
            ),
          ),
        ).box.clip(Clip.antiAlias).rightRounded(value: 20.r).make(),
        backgroundColor: whitecolor,
        appBar: AppBar(
          elevation: 2,
          title: Row(
            children: [
              appMainLogo(color: darkBlue, height: 90.h),
              Expanded(child: Container()),
              TextField(
                cursorHeight: 25.h,
                style: const TextStyle(color: greenColor),
                cursorColor: greyColor,
                decoration: InputDecoration(
                    suffixIcon: const Icon(
                      Icons.search,
                      color: greyColor,
                    ),
                    isDense: true,
                    hintText: "What are you looking for?",
                    hintStyle: const TextStyle(color: greyColor),
                    fillColor: whitecolor,
                    filled: true,
                    hoverColor: whitecolor,
                    border: InputBorder.none,
                    focusColor: greyColor,
                    focusedBorder: enableborderforsearch,
                    enabledBorder: enableborderforsearch),
              )
                  .box
                  .outerShadowMd
                  .clip(Clip.antiAlias)
                  .width(200.w)
                  .height(50.h)
                  .rounded
                  .make(),
              Expanded(child: Container()),
            ],
          ),
          actions: [
            Padding(
              padding: defaultPadding,
              child: CircleAvatar(
                child: Image.asset(applogo),
              ),
            )
          ],
          iconTheme: const IconThemeData(color: darkBlue),
          backgroundColor: whitecolor,
        ),
        body: Padding(
          padding: const EdgeInsets.all(50),
          child: Column(
            crossAxisAlignment: crossstart,
            children: [
              20.heightBox,
              "Welcome Back"
                  .text
                  .fontFamily(montserratRegular)
                  .size(30.sp)
                  .make(),
              5.heightBox,
              "Danish!".text.fontFamily(montserratBold).size(35.sp).make(),
              20.heightBox,
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: defaultPadding,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: crossstart,
                      children: [
                        Padding(
                          padding: defaultPadding,
                          child: "Active Users"
                              .text
                              .fontFamily(montserratSemibold)
                              .size(20.sp)
                              .make(),
                        ),
                        Center(
                          child: SizedBox(
                            width: 300.w,
                            height: 300.h,
                            child: PieChart(PieChartData(
                                centerSpaceRadius: 0,
                                borderData: FlBorderData(show: false),
                                sectionsSpace: 2,
                                sections: [
                                  PieChartSectionData(
                                    value: 35,
                                    title: "${controller.totalUsers} users",
                                    titlePositionPercentageOffset: 0.5,
                                    titleStyle: TextStyle(
                                        color: whitecolor,
                                        fontSize: 20.sp,
                                        fontFamily: montserratBold),
                                    color: bluesh,
                                    radius: 130,
                                  ),
                                  PieChartSectionData(
                                    value: 5,
                                    showTitle: false,
                                    color: whitecolor,
                                    radius: 130,
                                  )
                                ])),
                          ),
                        )
                      ],
                    )
                        .box
                        .height(600.h)
                        .width(150.w)
                        .color(verylightgrey)
                        .rounded
                        .make(),
                  ),
                  SizedBox(
                    height: 600.h,
                    width: 300.w,
                    child: Padding(
                      padding: defaultPadding,
                      child: Column(
                        crossAxisAlignment: crossstart,
                        children: [
                          Padding(
                            padding: padding12,
                            child: "Tests Analytics"
                                .text
                                .fontFamily(montserratSemibold)
                                .size(20.sp)
                                .make(),
                          ),
                          20.heightBox,
                          AspectRatio(
                            aspectRatio: 2,
                            child: LineChart(LineChartData(
                                lineBarsData: [
                                  LineChartBarData(
                                    spots: const [
                                      FlSpot(0, 3),
                                      FlSpot(2.6, 2),
                                      FlSpot(4.9, 5),
                                      FlSpot(6.8, 2.5),
                                      FlSpot(8, 4),
                                      FlSpot(9.5, 3),
                                      FlSpot(11, 4),
                                    ],
                                    belowBarData: BarAreaData(
                                        color: bluesh.withOpacity(0.8),
                                        show: true),
                                    isCurved: true,
                                    dotData: const FlDotData(show: true),
                                    color: darkBlue,
                                    barWidth: 3,
                                  )
                                ],
                                gridData: FlGridData(
                                    drawHorizontalLine: false,
                                    drawVerticalLine: false),
                                titlesData: FlTitlesData(
                                    show: true,
                                    leftTitles: AxisTitles(
                                        axisNameWidget: const Text("Test Done"),
                                        sideTitles: SideTitles(
                                          showTitles: true,
                                          reservedSize: 30,
                                          interval: 1,
                                          getTitlesWidget: (value, meta) {
                                            int text = 0;
                                            switch (value.toInt()) {
                                              case 0:
                                                text = 5;
                                                break;
                                              case 1:
                                                text = 6;
                                                break;
                                              case 2:
                                                text = 8;
                                                break;
                                              case 3:
                                                text = 12;
                                                break;
                                              case 4:
                                                text = 13;
                                                break;
                                              case 5:
                                                text = 19;
                                                break;
                                              case 6:
                                                text = 25;
                                                break;
                                            }
                                            return Text(text.toString());
                                          },
                                        )),
                                    bottomTitles: AxisTitles(
                                        axisNameWidget: const Text("Days"),
                                        sideTitles: SideTitles(
                                          showTitles: true,
                                          reservedSize: 30,
                                          interval: 1,
                                          getTitlesWidget: (value, meta) {
                                            String text = '';
                                            switch (value.toInt()) {
                                              case 0:
                                                text = 'Mon';
                                                break;
                                              case 1:
                                                text = 'Tue';
                                                break;
                                              case 2:
                                                text = 'Wed';
                                                break;
                                              case 3:
                                                text = 'Thu';
                                                break;
                                              case 4:
                                                text = 'Fri';
                                                break;
                                              case 5:
                                                text = 'Sat';
                                                break;
                                              case 6:
                                                text = 'Sun';
                                                break;
                                            }
                                            return Text(text);
                                          },
                                        )),
                                    rightTitles: const AxisTitles(
                                        sideTitles:
                                            SideTitles(showTitles: false)),
                                    topTitles: const AxisTitles(
                                        sideTitles:
                                            SideTitles(showTitles: false))))),
                          )
                        ],
                      ).box.color(verylightgrey).rounded.make(),
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }

  Widget bottomTitles(double value, TitleMeta meta) {
    const style = TextStyle(fontSize: 10);
    String text;
    switch (value.toInt()) {
      case 0:
        text = 'Apr';
        break;
      case 1:
        text = 'May';
        break;
      case 2:
        text = 'Jun';
        break;
      case 3:
        text = 'Jul';
        break;
      case 4:
        text = 'Aug';
        break;
      default:
        text = '';
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(text, style: style),
    );
  }

  Widget leftTitles(double value, TitleMeta meta) {
    if (value == meta.max) {
      return Container();
    }
    const style = TextStyle(
      fontSize: 10,
    );
    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(
        meta.formattedValue,
        style: style,
      ),
    );
  }
}
