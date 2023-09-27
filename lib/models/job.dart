import 'package:flag/flag.dart';

enum Jobtype { fullTime, partTime, oneTime }

class Job {
  const Job(
      {required this.name,
      required this.flag,
      required this.rank,
      required this.annualSalary,
      required this.location,
      required this.jobtype,
      required this.description,
      required this.jobImage,
      required this.jobtitle});
  final String name;
  final Flag flag;
  final double rank;
  final String description;
  final String annualSalary;
  final String location;
  final Jobtype jobtype;
  final String jobImage;
  final String jobtitle;
}
