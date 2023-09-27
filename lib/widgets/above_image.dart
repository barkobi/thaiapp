import 'package:flutter/material.dart';
import 'package:flag/flag.dart';

class AboveImageTexts extends StatelessWidget {
  const AboveImageTexts(
      {super.key,
      required this.jobImage,
      required this.rank,
      required this.jobName});
  final String jobImage;
  final double rank;
  final String jobName;

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: deviceWidth * 0.55,
          height: deviceHeight * 0.35,
          decoration: const BoxDecoration(color: Colors.transparent),
          child: Row(
            children: [
              Container(
                width: deviceHeight * 0.2,
                height: deviceHeight * 0.2,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8)),
                child: Image.asset(jobImage),
              ),
              const SizedBox(width: 20),
              SizedBox(
                height: deviceHeight * 0.2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Job Role",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                    ),
                    const Text(
                      "About The Employer",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(Icons.food_bank),
                        const SizedBox(width: 10),
                        Text(
                          jobName,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Flag.fromCode(
                          FlagsCode.IL,
                          height: 20,
                          width: 20,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          "Israel",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(width: 20),
                        Container(
                          width: 25,
                          height: 30,
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                            shape: BoxShape.rectangle,
                            color: Colors.orange,
                          ),
                          child: Text(
                            '${rank.round()}',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Row(
                          children: List.generate(
                            5,
                            (index) {
                              IconData iconData =
                                  index < rank ? Icons.star : Icons.star_border;
                              Color color =
                                  index < rank ? Colors.orange : Colors.grey;
                              return Icon(
                                iconData,
                                color: color,
                              );
                            },
                          ),
                        ),
                        const SizedBox(width: 20),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4)),
                          width: 90,
                          height: 35,
                          child: Row(children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(4),
                                      bottomLeft: Radius.circular(4))),
                              width: 30,
                              child: Icon(
                                Icons.check,
                                size: 20,
                              ),
                            ),
                            Container(
                              decoration:
                                  BoxDecoration(color: Colors.green[300]),
                              width: 60,
                              child: Text("Verified"),
                            )
                          ]),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          height: deviceHeight * 0.15,
          width: deviceWidth * 0.15,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 4,
                offset: const Offset(0, 3),
              ),
            ],
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Annual Salary",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text(
                "\$35k - \$38k",
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
