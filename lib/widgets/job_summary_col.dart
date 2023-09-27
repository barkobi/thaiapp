import 'package:flutter/material.dart';
import 'package:thaiapp/models/job.dart';
import 'package:thaiapp/widgets/job_summary_item.dart';

class JobSummaryAndApply extends StatelessWidget {
  const JobSummaryAndApply(
      {super.key,
      required this.jobtype,
      required this.location,
      required this.salary});
  final String location;
  final Jobtype jobtype;
  final String salary;
  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            fixedSize: Size(deviceWidth * 0.3, deviceHeight * 0.065),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          child: Text(
            "Apply To Job",
            style: TextStyle(fontSize: deviceWidth * 0.015),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: deviceHeight * 0.05),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8), topRight: Radius.circular(8))),
            width: deviceWidth * 0.3,
            height: deviceHeight * 0.085,
            child: Padding(
              padding: EdgeInsets.only(
                left: deviceWidth * 0.025,
                top: deviceHeight * 0.085 * 0.3,
              ),
              child: const Text(
                "Job Summary",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8)),
              color: Colors.grey[200]),
          width: deviceWidth * 0.3,
          height: deviceHeight * 0.4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: deviceWidth * 0.025,
                ),
                child: JobSummaryItem(
                  headline: "Location",
                  data: location,
                  icon: const Icon(Icons.location_on,
                      size: 16, color: Colors.blue),
                ),
              ),
              SizedBox(height: deviceHeight * 0.01),
              Padding(
                padding: EdgeInsets.only(
                  left: deviceWidth * 0.025,
                ),
                child: JobSummaryItem(
                  headline: "Job Type",
                  data: jobtype == Jobtype.fullTime
                      ? "Full Time"
                      : (jobtype == Jobtype.partTime
                          ? "Part Time"
                          : "One Time"),
                  icon: const Icon(Icons.work, size: 16, color: Colors.blue),
                ),
              ),
              SizedBox(height: deviceHeight * 0.01),
              Padding(
                padding: EdgeInsets.only(
                  left: deviceWidth * 0.025,
                ),
                child: JobSummaryItem(
                  headline: "Salary",
                  data: salary,
                  icon: const Icon(Icons.attach_money,
                      size: 16, color: Colors.blue),
                ),
              ),
              SizedBox(height: deviceHeight * 0.01),
              Padding(
                padding: EdgeInsets.only(
                  left: deviceWidth * 0.025,
                ),
                child: const JobSummaryItem(
                  headline: "Date Posted",
                  data: "Sep 21, 2023",
                  icon:
                      Icon(Icons.calendar_today, size: 16, color: Colors.blue),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
