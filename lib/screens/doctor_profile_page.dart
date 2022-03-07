import 'package:audacity_demo/screens/tabs/online_consultancy.dart';
import 'package:audacity_demo/screens/tabs/physical_checkup.dart';
import 'package:audacity_demo/widgets/doctor_summary.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:audacity_demo/config/app_color.dart';
// import 'package:flutter_svg/flutter_svg.dart';

class DoctorProfilePage extends StatelessWidget {
  const DoctorProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor.kBackgroundColor,
      appBar: AppBar(
        backgroundColor: AppColor.kBackgroundColor,
        elevation: 0.0,
        leading: Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
          size: 20,
        ),
        title: Text(
          'Doctor Profile',
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Icon(
              Icons.share,
              color: Colors.black,
              size: 20,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            DoctorSummary(),
            SizedBox(height: 8),
            Container(
              height: 1475,
              child: DefaultTabController(
                length: 2,
                child: Scaffold(
                  backgroundColor: AppColor.kBackgroundColor,
                  appBar: AppBar(
                    backgroundColor: AppColor.kBackgroundColor,
                    toolbarHeight: 80,
                    elevation: 0.0,
                    flexibleSpace: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Divider(),
                        TabBar(
                          indicatorColor: Colors.white,
                          labelColor: AppColor.primaryAppColor,
                          unselectedLabelColor: AppColor.primaryTextColor,
                          tabs: [
                            Tab(
                              icon: Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                      right: size.width * 0.09,
                                    ),
                                    child: Text(
                                      'Online Consultancy',
                                    ),
                                  ),
                                  VerticalDivider()
                                ],
                              ),
                            ),
                            Tab(
                              icon: Text(
                                'Physical Check Up',
                              ),
                            ),
                          ],
                        ),
                        Divider(),
                      ],
                    ),
                  ),
                  body: TabBarView(
                    children: [
                      OnlineConsultancy(),
                      PhysicalCheckup(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
