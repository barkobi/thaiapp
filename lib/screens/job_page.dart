import 'package:flutter/material.dart';
import 'package:thaiapp/data/data.dart';
import 'package:thaiapp/widgets/Image_top.dart';
import 'package:thaiapp/widgets/job_description.dart';
import 'package:thaiapp/widgets/job_summary_col.dart';

class JobPageTitle extends StatelessWidget {
  const JobPageTitle({super.key, required this.jobTitle});

  final String jobTitle;

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor.withAlpha(10),
      appBar: AppBar(
        backgroundColor: Theme.of(context).hintColor.withAlpha(100),
        toolbarHeight: deviceHeight * 0.125,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              jobTitle,
              style: TextStyle(
                color: Theme.of(context).secondaryHeaderColor,
                fontSize: deviceWidth * 0.02,
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                fixedSize: Size(deviceWidth * 0.2, deviceHeight * 0.065),
              ),
              child: Text(
                "Easy Apply",
                style: TextStyle(fontSize: deviceWidth * 0.015),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: deviceHeight * 0.115),
              child: Container(
                decoration: BoxDecoration(color: Colors.grey[300]),
                width: deviceWidth,
                child: const ImageTopShader(),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: deviceHeight * 0.2),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  JobDescription(),
                  JobSummaryAndApply(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
