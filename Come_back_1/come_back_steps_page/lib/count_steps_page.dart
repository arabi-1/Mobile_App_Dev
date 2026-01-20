import 'package:come_back_steps_page/steps_provider.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:nb_utils/nb_utils.dart';

class CountStepsPage extends StatelessWidget {
  const CountStepsPage({super.key});

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

              SizedBox(
                height: 250,
                width: 250,
                child: Stack(
                  children: [
                    PieChart(
                      PieChartData(
                        centerSpaceRadius: 100,
                        startDegreeOffset: 270,
                        sections: [
                          PieChartSectionData(
                            color: Colors.pink,
                            value: 25,
                            showTitle: false,
                          ),
                          PieChartSectionData(
                            color: Colors.indigo,
                            value: 60,
                            showTitle: false,
                          ),
                          PieChartSectionData(
                            color: Colors.orange,
                            value: 15,
                            showTitle: false,
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: Column(
                        children: [Text(provider.steps.toString())],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        foregroundColor: Colors.black,
      ),
    );
  }
}
