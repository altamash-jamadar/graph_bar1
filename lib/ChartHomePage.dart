import 'package:flutter/material.dart';
import 'package:graphs_bar/HorizontalBarChartWidget.dart';
class ChartHomePage extends StatelessWidget {
  ChartHomePage({Key? key}) : super(key: key);

  final List<String> months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'];
  final List<double> amounts = [5000, 12500, 3000, 6000, 9000, 7000];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Horizontal Bar Chart'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: HorizontalBarChartWidget(
          months: months,
          amounts: amounts,
          highlightedIndex: 1, 
        ),
      ),
    );
  }
}
