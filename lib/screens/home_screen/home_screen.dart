import 'package:flutter/material.dart';
import 'package:job_app_ui/screens/home_screen/widgets/app_bar.dart';
import 'package:job_app_ui/screens/home_screen/widgets/category_bar.dart';
import 'package:job_app_ui/screens/home_screen/widgets/greeting_bar.dart';
import 'package:job_app_ui/screens/home_screen/widgets/popular_jobs_raw.dart';
import 'package:job_app_ui/screens/home_screen/widgets/recent_jobs_column.dart';
import 'package:job_app_ui/screens/home_screen/widgets/search_bar.dart';
import 'package:job_app_ui/services/get_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GetData data = GetData();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomAppBar(),
                const SizedBox(
                  height: 15,
                ),
                const GreetingBar(),
                const SizedBox(
                  height: 20,
                ),
                CustomSearchBar(size: size),
                const SizedBox(
                  height: 20,
                ),
                const CategoryBar(
                  title: 'Pupular Jobs',
                ),
                const SizedBox(
                  height: 5,
                ),
                PupularJobsRaw(data: data, size: size),
                const SizedBox(
                  height: 15,
                ),
                const CategoryBar(
                  title: 'Recent Jobs',
                ),
                const SizedBox(
                  height: 10,
                ),
                RecentJobsColumn(data: data, size: size),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
