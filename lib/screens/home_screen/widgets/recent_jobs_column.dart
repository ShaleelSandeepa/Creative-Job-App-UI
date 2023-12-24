import 'package:flutter/material.dart';
import 'package:job_app_ui/services/get_data.dart';

class RecentJobsColumn extends StatelessWidget {
  const RecentJobsColumn({
    super.key,
    required this.data,
    required this.size,
  });

  final GetData data;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(data.getJobData().length, (index) {
        return Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            width: size.width,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: ListTile(
                leading: Container(
                  width: 50,
                  height: 50,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 1.5,
                      ),
                      color: data.getJobData()[index].primary,
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage(data.getJobData()[index].logo),
                        fit: BoxFit.cover,
                      )),
                ),
                title: Text(
                  data.getJobData()[index].title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  "${data.getJobData()[index].companyName} - ${data.getJobData()[index].type}",
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
                trailing: Text(
                  data.getJobData()[index].time,
                  style: const TextStyle(fontSize: 12),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
