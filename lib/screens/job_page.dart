import 'package:flutter/material.dart';
import 'package:thaiapp/models/job.dart';
import 'package:thaiapp/widgets/Image_top.dart';
import 'package:thaiapp/widgets/job_description.dart';
import 'package:thaiapp/widgets/job_summary_col.dart';
import 'package:thaiapp/widgets/similar_job_wid.dart';

class JobPageTitle extends StatefulWidget {
  const JobPageTitle(
      {super.key, required this.job, required this.jobSuggestions});

  final Job job;
  final List<Job> jobSuggestions;

  @override
  State<JobPageTitle> createState() => _JobPageTitleState();
}

class _JobPageTitleState extends State<JobPageTitle> {
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
              widget.job.name,
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
                fixedSize: Size(deviceWidth * 0.17, deviceHeight * 0.065),
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
                child: ImageTopShader(
                  jobImage: widget.job.jobImage,
                  rank: widget.job.rank,
                  jobName: widget.job.name,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: deviceHeight * 0.2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  JobDescription(description: widget.job.description),
                  JobSummaryAndApply(
                      jobtype: widget.job.jobtype,
                      location: widget.job.location,
                      salary: widget.job.annualSalary),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: deviceHeight * 0.15,
                  left: deviceWidth * 0.05,
                  bottom: deviceHeight * 0.1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Similar jobs you may be interested:",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: deviceWidth,
                    height: ((deviceWidth + deviceHeight) / 2) * 0.215,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.jobSuggestions.length,
                      itemBuilder: (context, index) => Padding(
                        padding: EdgeInsets.only(
                            left: index == 0 ? 0 : deviceWidth * 0.07,
                            right: index == widget.jobSuggestions.length - 1
                                ? deviceWidth * 0.05
                                : 0),
                        child: SimilarJob(job: widget.jobSuggestions[index]),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
