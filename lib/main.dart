import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Curved Line Chart Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const RevenueChartPage(),
    );
  }
}

class CurvedLineChart extends StatelessWidget {
  final List<String> labels;
  final List<double> values;
  final String yAxisLabel;
  final String xAxisLabel;
  final Color lineColor;
  final double lineWidth;
  final bool showDots;
  final double curveSmoothness;

  const CurvedLineChart({
    Key? key,
    required this.labels,
    required this.values,
    this.yAxisLabel = '',
    this.xAxisLabel = '',
    this.lineColor = Colors.orange,
    this.lineWidth = 3,
    this.showDots = false,
    this.curveSmoothness = 0.3,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final maxY = (values.reduce((a, b) => a > b ? a : b) * 1.2).ceilToDouble();
    final lastIndex = labels.length - 1;

    return LineChart(
      LineChartData(
        minX: 0,
        maxX: lastIndex.toDouble(),
        minY: 0,
        maxY: maxY,
        gridData: FlGridData(
          show: true,
          drawVerticalLine: false,
          horizontalInterval: maxY / 4,
          getDrawingHorizontalLine: (y) => FlLine(
            color: Colors.grey.shade300,
            strokeWidth: 1,
            dashArray: [5, 5],
          ),
        ),
        borderData: FlBorderData(
          show: true,
          border: const Border(
            left: BorderSide(color: Colors.blueGrey, width: 1),
            bottom: BorderSide(color: Colors.blueGrey, width: 1),
            top: BorderSide.none,
            right: BorderSide.none,
          ),
        ),
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(
            axisNameWidget: Text(
              yAxisLabel,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
            axisNameSize: 16,
            sideTitles: SideTitles(
              showTitles: true,
              interval: maxY / 4,
              reservedSize: 50,
              getTitlesWidget: (value, meta) => Text(
                value.toInt().toString(),
                style: const TextStyle(fontSize: 10),
              ),
            ),
          ),
          bottomTitles: AxisTitles(
            axisNameWidget: Text(
              xAxisLabel,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
            axisNameSize: 16,
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 32,
              getTitlesWidget: (value, meta) {
                final idx = value.toInt();
                if (idx < 0 || idx > lastIndex) return const SizedBox();
                return Text(labels[idx], style: const TextStyle(fontSize: 10));
              },
            ),
          ),
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),
        lineBarsData: [
          LineChartBarData(
            spots: List.generate(
              labels.length,
              (i) => FlSpot(i.toDouble(), values[i]),
            ),
            isCurved: true,
            curveSmoothness: curveSmoothness,
            barWidth: lineWidth,
            color: lineColor,
            dotData: FlDotData(show: showDots),
            belowBarData: BarAreaData(show: false),
          ),
        ],
      ),
    );
  }
}

class RevenueChartPage extends StatelessWidget {
  const RevenueChartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'];
    final revenues = [12000.0, 18000.0, 31000.0, 26000.0, 22000.0, 35000.0];

    return Scaffold(
      appBar: AppBar(title: const Text('Monthly Revenue')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.5,
          child: CurvedLineChart(
            labels: months,
            values: revenues,
            yAxisLabel: 'Revenue (₹)',
            xAxisLabel: 'Months',
            lineColor: Colors.orange.shade700,
            showDots: false,
          ),
        ),
      ),
    );
  }
}
