import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class HorizontalBarChartWidget extends StatelessWidget {
  final List<String> months;
  final List<double> amounts;
  final int highlightedIndex;

  const HorizontalBarChartWidget({
    Key? key,
    required this.months,
    required this.amounts,
    this.highlightedIndex = -1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final maxAmount = (amounts.reduce((a, b) => a > b ? a : b) * 1.2);

    return BarChart(
      BarChartData(
        maxY: maxAmount,
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                final index = value.toInt();
                if (index < 0 || index >= months.length) return const SizedBox();
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Text(months[index]),
                );
              },
              reservedSize: 42,
            ),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 50,
              getTitlesWidget: (value, meta) {
                return Text(
                  '₹${value.toInt()}',
                  style: const TextStyle(fontSize: 10, color: Colors.blue),
                );
              },
              interval: 6000,
            ),
          ),
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),
        gridData: FlGridData(show: true),
        borderData: FlBorderData(show: false),
        barGroups: List.generate(
          amounts.length,
          (index) => BarChartGroupData(
            x: index,
            barsSpace: 4,
            barRods: [
              BarChartRodData(
                toY: amounts[index],
                width: 20,
                borderRadius: BorderRadius.circular(8),
                color: index == highlightedIndex
                    ? Colors.cyan
                    : Colors.grey.shade300,
                rodStackItems: [],
              ),
            ],
            showingTooltipIndicators: index == highlightedIndex ? [0] : [],
          ),
        ),
        barTouchData: BarTouchData(enabled: true),
        alignment: BarChartAlignment.spaceBetween,
      ),
    );
  }
}
