import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:smart_city/core/utils/app_colors.dart';

class ConsumptionChart extends StatelessWidget {
  const ConsumptionChart({super.key});

  @override
  Widget build(BuildContext context) {
    const months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'];

    return LineChart(
      LineChartData(
        gridData: const FlGridData(show: true),
        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget:
                  (value, meta) => Text(months[value.toInt() % months.length]),
            ),
          ),
          leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: true)),
        ),
        borderData: FlBorderData(show: false),
        lineBarsData: [
          LineChartBarData(
            isCurved: true,
            color: AppColors.primaryColor,
            barWidth: 3,
            belowBarData: BarAreaData(show: false),
            spots: const [
              FlSpot(0, 3.2),
              FlSpot(1, 3.5),
              FlSpot(2, 2.8),
              FlSpot(3, 3.0),
              FlSpot(4, 2.7),
              FlSpot(5, 3.15),
            ],
          ),
        ],
      ),
    );
  }
}
