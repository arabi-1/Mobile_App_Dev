import 'package:come_back_steps_page/steps_provider.dart';
import 'package:come_back_steps_page/vertical_bar_chart.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:nb_utils/nb_utils.dart';

class CountStepsPage extends StatefulWidget {
  const CountStepsPage({super.key});

  @override
  State<CountStepsPage> createState() => _CountStepsPageState();
}

class _CountStepsPageState extends State<CountStepsPage> {
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<StepsProvider>();
    return Scaffold(
      backgroundColor: Color(0xFF0B0F19),
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Colors.transparent,

        title: Padding(
          padding: const EdgeInsets.only(top: 20, left: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RichText(
                  text: TextSpan(
                    text: '',
                    style: DefaultTextStyle.of(context).style,
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Good Evening,\n',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          decoration: TextDecoration.none,
                          height: 2,
                        ),
                      ),
                      TextSpan(
                        text: "Your steps average is ",
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontSize: 16,
                          color: Colors.white,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      TextSpan(
                        text: 'better ',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Colors.pinkAccent,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      TextSpan(
                        text: 'than yesterday.',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontSize: 16,
                          color: Colors.white,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        foregroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 15),
            SizedBox(
              height: 250,
              width: 250,
              child: Stack(
                children: [
                  PieChart(
                    PieChartData(
                      centerSpaceRadius: 70,
                      startDegreeOffset: 270,
                      sectionsSpace: 3,
                      sections: [
                        PieChartSectionData(
                          radius: 20,
                          color: Color(0xFFEE538D),
                          value: 25,
                          showTitle: false,
                        ),
                        PieChartSectionData(
                          radius: 20,
                          color: Color(0xFF394398),
                          value: 60,
                          showTitle: false,
                        ),
                        PieChartSectionData(
                          radius: 20,
                          color: Colors.orange,
                          value: 15,
                          showTitle: false,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 40),
                  Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          provider.steps.toString(),
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      provider.stepGoal.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    Text(
                      'goal',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      provider.distanceKm.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    Text(
                      'km',
                      style: TextStyle(
                        color: Colors.deepOrangeAccent,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      provider.calories.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    Text(
                      'kcal',
                      style: TextStyle(
                        color: Colors.yellowAccent,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.indigo,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8, top: 8),
                            child: Text(
                              provider.waterMl.toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Text(
                              "${provider.waterMl * 250} ml",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    "Drink water",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 2),
                                IconButton(
                                  padding: EdgeInsets.zero,
                                  constraints: BoxConstraints(),
                                  onPressed: () {
                                    Provider.of<StepsProvider>(
                                      context,
                                      listen: false,
                                    ).addWater();
                                  },
                                  icon: Icon(
                                    Icons.add_outlined,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Container(
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.lightGreen,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8, top: 8),
                            child: Text(
                              provider.weight_count.toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Text(
                              "${provider.weight_count} kg",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    "Drink water",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 5),
                                IconButton(
                                  padding: EdgeInsets.zero,
                                  constraints: BoxConstraints(),
                                  onPressed: () {
                                    Provider.of<StepsProvider>(
                                      context,
                                      listen: false,
                                    ).countWeight();
                                  },
                                  icon: Icon(
                                    Icons.add_outlined,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(height: 10),
                  VerticalBarChart(month: 'Feb', height: 1),
                  SizedBox(width: 2, height: 5),
                  VerticalBarChart(month: 'Mar', height: 0.4),
                  SizedBox(width: 2, height: 5),
                  VerticalBarChart(month: 'Apr', height: 0.3),
                  SizedBox(width: 2, height: 5),
                  VerticalBarChart(month: 'May', height: 0.2),
                  SizedBox(width: 2, height: 5),
                  VerticalBarChart(month: 'Jun', height: 0.2),
                  SizedBox(width: 2, height: 5),
                  VerticalBarChart(month: 'Jul', height: 0.8),
                  SizedBox(width: 2, height: 5),
                  VerticalBarChart(month: 'Aug', height: 0.7),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
