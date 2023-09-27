import 'package:flutter/material.dart';
import 'package:thaiapp/models/job.dart';

class SimilarJob extends StatelessWidget {
  const SimilarJob({super.key, required this.job});
  final Job job;

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    return Container(
      width: ((deviceWidth + deviceHeight) / 2) * 0.3,
      height: ((deviceWidth + deviceHeight) / 2) * 0.2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: FractionallySizedBox(
                        heightFactor: 0.55,
                        child: Image.asset(
                          job.jobImage,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Text(
                            job.name,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(
                          job.jobtitle,
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.3),
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, top: 20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.location_on,
                              size: 16, color: Colors.grey),
                          const SizedBox(
                            width: 15,
                          ),
                          Text(
                            job.location,
                            style: const TextStyle(color: Colors.black),
                          ),
                          const SizedBox(width: 15),
                          const Icon(Icons.work, size: 16, color: Colors.grey),
                          const SizedBox(width: 15),
                          Text(
                            job.jobtype == Jobtype.fullTime
                                ? "Full Time"
                                : (job.jobtype == Jobtype.partTime
                                    ? "Part Time"
                                    : "One Time"),
                            style: const TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          const Icon(Icons.money, size: 16, color: Colors.grey),
                          const SizedBox(
                            width: 15,
                          ),
                          Text(
                            job.annualSalary,
                            style: const TextStyle(color: Colors.black),
                          ),
                          const SizedBox(width: 15),
                          const Icon(Icons.timer, size: 16, color: Colors.grey),
                          const SizedBox(width: 15),
                          const Text(
                            "2 Days Ago",
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
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
