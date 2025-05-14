// // import 'package:fl_chart/fl_chart.dart';
// // import 'package:flutter/material.dart';

// // void main() => runApp(const MyApp());

// // class MyApp extends StatelessWidget {
// //   const MyApp({super.key});
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       title: 'Business Value',
// //       debugShowCheckedModeBanner: false,            
// //       theme: ThemeData(primarySwatch: Colors.blue),
// //       home: const ChartHomePage(),
// //     );
// //   }
// // }

// // class ChartHomePage extends StatelessWidget {
// //   const ChartHomePage({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     final months = ['Aug', 'Sep', 'Oct', 'Nov', 'Dec', 'Jan'];
// //     final amounts = [12000.0, 18000.0, 14000.0, 6000.0, 12500.0, 11000.0];
// //     const highlightIndex = 4; 

// //     return Scaffold(
// //       appBar: AppBar(title: const Text('Horizontal bar graph')),
// //       body: Padding(
// //         padding: const EdgeInsets.all(16.0),
// //         child: Container(
// //           child: SizedBox(
// //             height: MediaQuery.of(context).size.height * 0.5, 
// //             width: double.infinity,
// //             child: MonthlyBarChart(
// //               months: months,
// //               amounts: amounts,
// //               highlightedIndex: highlightIndex,
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// // class MonthlyBarChart extends StatelessWidget {
// //   final List<String> months;
// //   final List<double> amounts;
// //   final int highlightedIndex;

// //   const MonthlyBarChart({
// //     super.key,
// //     required this.months,
// //     required this.amounts,
// //     this.highlightedIndex = -1,
// //   }) : assert(months.length == amounts.length,
// //              'months and amounts must have same length');

// //   @override
// //   Widget build(BuildContext context) {
// //     final maxY = (amounts.reduce((a, b) => a > b ? a : b) * 1.2).ceilToDouble();

// //     return BarChart(
// //       BarChartData(
// //         maxY: maxY,
// //         alignment: BarChartAlignment.spaceAround,

        
// //         gridData: FlGridData(
// //           show: true,
// //           drawVerticalLine: false,
// //         ),

       
// //         borderData: FlBorderData(
// //           show: true,
// //           border: const Border(
// //             left: BorderSide(color: Colors.blueGrey, width: 1),
// //             bottom: BorderSide(color: Colors.blueGrey, width: 1),
// //           ),
// //         ),

// //         titlesData: FlTitlesData(
// //           leftTitles: AxisTitles(
// //             sideTitles: SideTitles(
// //               showTitles: true,
// //               interval: maxY / 4,
// //               reservedSize: 40,
// //               getTitlesWidget: (value, meta) => Text(
// //                 value.toInt().toString(),
// //                 style: const TextStyle(fontSize: 10, color: Colors.blueGrey),
// //               ),
// //             ),
// //           ),
// //           bottomTitles: AxisTitles(
// //             sideTitles: SideTitles(
// //               showTitles: true,
// //               reservedSize: 36,
// //               getTitlesWidget: (value, meta) {
// //                 final idx = value.toInt();
// //                 if (idx < 0 || idx >= months.length) return const SizedBox();
// //                 return Text(
// //                   months[idx],
// //                   style: const TextStyle(fontSize: 12, color: Colors.blueGrey),
// //                 );
// //               },
// //             ),
// //           ),
// //           topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
// //           rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
// //         ),

// //         barGroups: List.generate(months.length, (i) {
// //           final isHighlight = i == highlightedIndex;
// //           return BarChartGroupData(
// //             x: i,
// //             barsSpace: 4,
// //             barRods: [
// //               BarChartRodData(
// //                 toY: amounts[i],
// //                 width: 24,
// //                 borderRadius: BorderRadius.circular(8),
// //                 color:
// //                     isHighlight ? const Color(0xFF2CDAB1) : Colors.grey.shade200,
// //               ),
// //             ],
// //             showingTooltipIndicators: isHighlight ? [0] : [],
// //           );
// //         }),

// //         barTouchData: BarTouchData(
// //           enabled: true,
// //           touchTooltipData: BarTouchTooltipData(
// //             tooltipPadding: EdgeInsets.zero,
// //             tooltipMargin: 4,
// //             getTooltipItem: (group, groupIndex, rod, rodIndex) {
// //               if (groupIndex == highlightedIndex) {
// //                 return BarTooltipItem(
// //                   '₹${amounts[groupIndex].toInt()}',
// //                   const TextStyle(
// //                     fontSize: 12,
// //                     fontWeight: FontWeight.bold,
// //                     color: Colors.black87,
// //                   ),
// //                 );
// //               }
// //               return null;
// //             },
// //           ),
// //         ),
// //       ),
// //       swapAnimationDuration: const Duration(milliseconds: 300),
// //     );
// //   }
// // }
// // // -----------------------------------------------------------------------------------
// // // import 'package:fl_chart/fl_chart.dart';
// // // import 'package:flutter/material.dart';
// // // //horizontal scroable bar
// // // void main() => runApp(const MyApp());

// // // class MyApp extends StatelessWidget {
// // //   const MyApp({super.key});
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return MaterialApp(
// // //       title: 'Scrollable Vertical Bar Chart',
// // //       debugShowCheckedModeBanner: false,
// // //       theme: ThemeData(primarySwatch: Colors.blue),
// // //       home: const ChartHomePage(),
// // //     );
// // //   }
// // // }

// // // class ChartHomePage extends StatelessWidget {
// // //   const ChartHomePage({super.key});

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     final months = ['Aug', 'Sep', 'Oct', 'Nov', 'Dec', 'Jan', 'Feb', 'Mar'];
// // //     final amounts = [12000.0, 18000.0, 14000.0, 6000.0, 12500.0, 11000.0, 9000.0, 15000.0];
// // //     const highlightIndex = 4; 

// // //     final chartWidth = months.length * 60.0;

// // //     return Scaffold(
// // //       appBar: AppBar(title: const Text('Scrollable Bar Chart')),
// // //       body: Padding(
// // //         padding: const EdgeInsets.all(16.0),
// // //         child: SingleChildScrollView(
// // //           scrollDirection: Axis.horizontal,
// // //           child: SizedBox(
// // //             width: chartWidth,
// // //             height: 300, 
// // //             child: VerticalBarChart(
// // //               months: months,
// // //               amounts: amounts,
// // //               highlightedIndex: highlightIndex,
// // //             ),
// // //           ),
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }

// // // class VerticalBarChart extends StatelessWidget {
// // //   final List<String> months;
// // //   final List<double> amounts;
// // //   final int highlightedIndex;

// // //   const VerticalBarChart({
// // //     super.key,
// // //     required this.months,
// // //     required this.amounts,
// // //     this.highlightedIndex = -1,
// // //   }) : assert(months.length == amounts.length,
// // //              'months and amounts must have same length');

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     final maxY = (amounts.reduce((a, b) => a > b ? a : b) * 1.2).ceilToDouble();

// // //     return BarChart(
// // //       BarChartData(
// // //         maxY: maxY,
// // //         alignment: BarChartAlignment.spaceBetween,

// // //         gridData: FlGridData(show: true, drawVerticalLine: false),

// // //         borderData: FlBorderData(
// // //           show: true,
// // //           border: const Border(
// // //             left: BorderSide(color: Colors.blueGrey, width: 1),
// // //             bottom: BorderSide(color: Colors.blueGrey, width: 1),
// // //             top: BorderSide.none,
// // //             right: BorderSide.none,
// // //           ),
// // //         ),

// // //         titlesData: FlTitlesData(
// // //           leftTitles: AxisTitles(
// // //             sideTitles: SideTitles(
// // //               showTitles: true,
// // //               interval: maxY / 4,
// // //               reservedSize: 40,
// // //               getTitlesWidget: (value, meta) => Text(
// // //                 value.toInt().toString(),
// // //                 style: const TextStyle(fontSize: 10, color: Colors.blueGrey),
// // //               ),
// // //             ),
// // //           ),
// // //           bottomTitles: AxisTitles(
// // //             sideTitles: SideTitles(
// // //               showTitles: true,
// // //               reservedSize: 32,
// // //               getTitlesWidget: (value, meta) {
// // //                 final idx = value.toInt();
// // //                 if (idx < 0 || idx >= months.length) return const SizedBox();
// // //                 return Text(
// // //                   months[idx],
// // //                   style: const TextStyle(fontSize: 12, color: Colors.blueGrey),
// // //                 );
// // //               },
// // //             ),
// // //           ),
// // //           topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
// // //           rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
// // //         ),

// // //         barGroups: List.generate(months.length, (i) {
// // //           final isHighlight = i == highlightedIndex;
// // //           return BarChartGroupData(
// // //             x: i,
// // //             barsSpace: 4,
// // //             barRods: [
// // //               BarChartRodData(
// // //                 toY: amounts[i],
// // //                 width: 24,
// // //                 borderRadius: BorderRadius.circular(6),
// // //                 color: isHighlight
// // //                     ? const Color(0xFF2CDAB1)
// // //                     : Colors.grey.shade200,
// // //                 backDrawRodData: BackgroundBarChartRodData(show: false),
// // //               ),
// // //             ],
// // //             showingTooltipIndicators: isHighlight ? [0] : [],
// // //           );
// // //         }),

// // //         barTouchData: BarTouchData(
// // //           enabled: true,
// // //           touchTooltipData: BarTouchTooltipData(
// // //             tooltipPadding: EdgeInsets.zero,
// // //             tooltipMargin: 4,
// // //             getTooltipItem: (group, groupIndex, rod, rodIndex) {
// // //               if (groupIndex == highlightedIndex) {
// // //                 return BarTooltipItem(
// // //                   '₹${amounts[groupIndex].toInt()}',
// // //                   const TextStyle(
// // //                     fontSize: 12,
// // //                     fontWeight: FontWeight.bold,
// // //                     color: Colors.black87,
// // //                   ),
// // //                 );
// // //               }
// // //               return null;
// // //             },
// // //           ),
// // //         ),
// // //       ),
// // //       swapAnimationDuration: const Duration(milliseconds: 300),
// // //     );
// // //   }
// // // }
// // //------------------------------------------------------------------------------------




// // //vertical _ line graph 
// // // import 'package:fl_chart/fl_chart.dart';
// // // import 'package:flutter/material.dart';

// // // void main() => runApp(const MyApp());

// // // class MyApp extends StatelessWidget {
// // //   const MyApp({super.key});
  
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return MaterialApp(
// // //       title: 'Monthly Revenue Vertical',
// // //       debugShowCheckedModeBanner: false,
// // //       theme: ThemeData(primarySwatch: Colors.blue),
// // //       home: const VerticalRevenueChartPage(),
// // //     );
// // //   }
// // // }

// // // class VerticalRevenueChartPage extends StatelessWidget {
// // //   const VerticalRevenueChartPage({super.key});

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     final months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
// // //     final amounts = [1200000.0, 850000.0, 337813.0, 100806.0, 1540000.0, 1980000.0, 900000.0, 2100000.0, 1340000.0, 1600000.0, 750000.0, 1800000.0];

// // //     return Scaffold(
// // //       appBar: AppBar(title: const Text('Business Value')),
// // //       body: Padding(
// // //         padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
// // //         child: Column(
// // //           crossAxisAlignment: CrossAxisAlignment.start,
// // //           children: [
// // //             const Text(
// // //               'Monthly Revenue',
// // //               style: TextStyle(
// // //                 fontSize: 18,
// // //                 fontWeight: FontWeight.w600,
// // //                 color: Colors.indigo,
// // //               ),
// // //             ),
// // //             const SizedBox(height: 16),
// // //             SizedBox(
// // //               height: MediaQuery.of(context).size.height * 0.5,
// // //               child: LineChart(
// // //                 _buildVerticalData(months, amounts),
// // //               ),
// // //             ),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }

// // //   LineChartData _buildVerticalData(List<String> months, List<double> amounts) {
// // //     final maxY = (amounts.reduce((a, b) => a > b ? a : b) * 1.2).ceilToDouble();
// // //     final maxX = (months.length - 1).toDouble();

// // //     return LineChartData(
// // //       minX: 0,
// // //       maxX: maxX,
// // //       minY: 0,
// // //       maxY: maxY,
// // //       gridData: FlGridData(
// // //         show: true,
// // //         drawVerticalLine: true,
// // //         drawHorizontalLine: true,
// // //         verticalInterval: 1,
// // //         horizontalInterval: maxY / 4,
// // //         getDrawingVerticalLine: (x) => FlLine(
// // //           color: Colors.grey.shade300,
// // //           strokeWidth: 1,
// // //           dashArray: [5, 5],
// // //         ),
// // //         getDrawingHorizontalLine: (y) => FlLine(
// // //           color: Colors.grey.shade300,
// // //           strokeWidth: 1,
// // //           dashArray: [5, 5],
// // //         ),
// // //       ),
// // //       borderData: FlBorderData(
// // //         show: true,
// // //         border: const Border(
// // //           left: BorderSide(color: Colors.blueGrey, width: 1),
// // //           bottom: BorderSide(color: Colors.blueGrey, width: 1),
// // //           top: BorderSide.none,
// // //           right: BorderSide.none,
// // //         ),
// // //       ),
// // //       titlesData: FlTitlesData(
// // //         bottomTitles: AxisTitles(
// // //           sideTitles: SideTitles(
// // //             showTitles: true,
// // //             reservedSize: 30,
// // //             interval: 1,
// // //             getTitlesWidget: (value, meta) {
// // //               final idx = value.toInt();
// // //               if (idx < 0 || idx >= months.length) return const SizedBox();
// // //               return Padding(
// // //                 padding: const EdgeInsets.only(top: 8),
// // //                 child: Text(
// // //                   months[idx],
// // //                   style: const TextStyle(fontSize: 12),
// // //                 ),
// // //               );
// // //             },
// // //           ),
// // //         ),
// // //         leftTitles: AxisTitles(
// // //           sideTitles: SideTitles(
// // //             showTitles: true,
// // //             reservedSize: 60,
// // //             interval: maxY / 4,
// // //             getTitlesWidget: (value, meta) {
// // //               return Text(
// // //                 '₹${value.toInt()}',
// // //                 style: const TextStyle(fontSize: 10),
// // //               );
// // //             },
// // //           ),
// // //         ),
// // //         topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
// // //         rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
// // //       ),
// // //       lineBarsData: [
// // //         LineChartBarData(
// // //           spots: List.generate(
// // //             months.length,
// // //             (i) => FlSpot(i.toDouble(), amounts[i]),
// // //           ),
// // //           isCurved: false,
// // //           barWidth: 3,
// // //           color: Colors.orange.shade700,
// // //           dotData: FlDotData(show: true),
// // //           belowBarData: BarAreaData(show: false),
// // //         ),
// // //       ],
// // //     );
// // //   }
// // // }
// //---------   -------




// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';

// void main() => runApp(const MyApp());

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Business Value',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(primarySwatch: Colors.blue),
//       home: const ChartHomePage(),
//     );
//   }
// }

// class ChartHomePage extends StatelessWidget {
//   const ChartHomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final List<Map<String, dynamic>> data = [
//       {'month': 1, 'value': 1200000.0},
//       {'month': 2, 'value': 850000.0},
//       {'month': 3, 'value': 337813.0},
//       {'month': 4, 'value': 100806.0},
//       {'month': 5, 'value': 1540000.0},
//       {'month': 6, 'value': 1980000.0},
//       {'month': 7, 'value': 900000.0},
//       {'month': 8, 'value': 2100000.0},
//       {'month': 9, 'value': 1340000.0},
//       {'month': 10, 'value': 1600000.0},
//       {'month': 11, 'value': 750000.0},
//       {'month': 12, 'value': 1800000.0},
//     ];

//     return Scaffold(
//       appBar: AppBar(title: const Text('Monthly Business Values')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: SizedBox(
//           height: MediaQuery.of(context).size.height * 0.5,
//           width: double.infinity,
//           child: MonthValueBarChart(data: data),
//         ),
//       ),
//     );
//   }
// }
// class MonthValueBarChart extends StatelessWidget {
//   final List<Map<String, dynamic>> data;
//   final int? highlightMonth;

//   const MonthValueBarChart({
//     super.key,
//     required this.data,
//     this.highlightMonth,
//   });

//   static const _monthLabels = <String>[
//     'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
//     'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
//   ];

//   @override
//   Widget build(BuildContext context) {
//     final sorted = List<Map<String, dynamic>>.from(data)
//       ..sort((a, b) => (a['month'] as int).compareTo(b['month'] as int));

//     final amounts = sorted.map((e) => e['value'] as double).toList();
//     final months = sorted.map((e) => _monthLabels[(e['month'] as int) - 1]).toList();

//     final maxX = (amounts.reduce((a, b) => a > b ? a : b) * 1.2).ceilToDouble();

//     return BarChart(
//       BarChartData(
//         maxY: maxX,
//         alignment: BarChartAlignment.spaceBetween,

//         gridData: FlGridData(
//           show: true,
//           drawHorizontalLine: false,
//           verticalInterval: maxX / 4,
//           getDrawingVerticalLine: (x) => FlLine(
//             color: Colors.grey.shade300,
//             strokeWidth: 1,
//             dashArray: [5, 5],
//           ),
//         ),

//         borderData: FlBorderData(
//           show: true,
//           border: const Border(
//             left: BorderSide(color: Colors.blueGrey, width: 1),
//             bottom: BorderSide(color: Colors.blueGrey, width: 1),
//             top: BorderSide.none,
//             right: BorderSide.none,
//           ),
//         ),

//         titlesData: FlTitlesData(
//           leftTitles: AxisTitles(
//             axisNameWidget: const Padding(
//               padding: EdgeInsets.only(bottom: 4),
//               child: Text('Month', style: TextStyle(fontWeight: FontWeight.bold)),
//             ),
//             axisNameSize: 16,
//             sideTitles: SideTitles(
//               showTitles: true,
//               interval: 1,
//               reservedSize: 60,
//               getTitlesWidget: (value, meta) {
//                 final idx = value.toInt();
//                 if (idx < 0 || idx >= months.length) return const SizedBox();
//                 return Text(months[idx], style: const TextStyle(color: Colors.blueGrey));
//               },
//             ),
//           ),

//           bottomTitles: AxisTitles(
//             axisNameWidget: const Padding(
//               padding: EdgeInsets.only(top: 4),
//               child: Text('Value (₹)', style: TextStyle(fontWeight: FontWeight.bold)),
//             ),
//             axisNameSize: 16,
//             sideTitles: SideTitles(
//               showTitles: true,
//               interval: maxX / 4,
//               reservedSize: 40,
//               getTitlesWidget: (value, meta) => Text(value.toInt().toString(),
//                   style: const TextStyle(color: Colors.blueGrey)),
//             ),
//           ),

//           topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
//           rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
//         ),

//          barGroups: List.generate(months.length, (i) {
//           final isHighlight = highlightMonth != null && (i + 1) == highlightMonth;
//           return BarChartGroupData(
//             x: i,
//             barRods: [
//               BarChartRodData(
//                 toY: amounts[i],
//                 width: 24,
//                 borderRadius: BorderRadius.circular(6),
//                 color: isHighlight
//                     ? const Color(0xFF2CDAB1)
//                     : Colors.grey.shade200,
//               ),
//             ],
//             showingTooltipIndicators: isHighlight ? [0] : [],
//           );
//         }),

//         barTouchData: BarTouchData(
//           enabled: true,
//           touchTooltipData: BarTouchTooltipData(
//             tooltipPadding: const EdgeInsets.all(4),
//             getTooltipItem: (group, groupIndex, rod, rodIndex) {
//               final monthNum = sorted[groupIndex]['month'] as int;
//               final val = amounts[groupIndex].toInt();
//               return BarTooltipItem(
//                 '${_monthLabels[monthNum - 1]}: ₹$val',
//                 const TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
//               );
//             },
//           ),
//         ),
//       ),
//       swapAnimationDuration: const Duration(milliseconds: 300),
//     );
//   }
// }


// // //------------------------------------------------------------------------------------
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
