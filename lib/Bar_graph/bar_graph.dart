import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'Bar_data.dart';

class MyBarGraph extends StatefulWidget {
  final List Aircomponents;
  const MyBarGraph({super.key, required this.Aircomponents});

  @override
  State<MyBarGraph> createState() => _MyBarGraphState();
}

class _MyBarGraphState extends State<MyBarGraph> {
  @override
  Widget build(BuildContext context) {
    BarData barData = BarData(
      CO: widget.Aircomponents[0],
      NO2: widget.Aircomponents[1],
      O3: widget.Aircomponents[2],
      SO2: widget.Aircomponents[3],
      PM2_5: widget.Aircomponents[4],
      PM10: widget.Aircomponents[5],
    );
    barData.InitializeBarData();
    return BarChart(
      BarChartData(
        maxY: 100,
        minY: 0,
        gridData: FlGridData(show: false),
        borderData: FlBorderData(show: false),
        titlesData: FlTitlesData(
          show: true,
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          rightTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: rightTitles,
            ),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: bottomTiles,
            ),
          ),
        ),
        barGroups: barData.barData
            .map((data) =>
            BarChartGroupData(
              x: data.x,
              barRods: [
                BarChartRodData(
                  backDrawRodData: BackgroundBarChartRodData(
                    show: true,
                    toY: 100,
                    color: Colors.black.withOpacity(0.2),
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(3),
                    topRight: Radius.circular(3),
                  ),
                  toY: data.y > 100 ? 100 : data.y,
                  width: 15,
                  color: Colors.black.withOpacity(0.8),
                  rodStackItems: [
                    BarChartRodStackItem(0, data.y, Colors.transparent),
                  ],
                ),
              ],
            ))
            .toList(),
        barTouchData: BarTouchData(
          touchTooltipData: BarTouchTooltipData(
            getTooltipColor: (spot) => Colors.black.withOpacity(0.1),
            getTooltipItem: (group, groupIndex, rod, rodIndex) {
              final actualValue = barData.barData[groupIndex].y;
              return BarTooltipItem(
                ' $actualValue',
                TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget bottomTiles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );

    Widget text;
    switch (value.toInt()) {
      case 0:
        text = GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, 'pollution_info');
            },
            child: Text('CO', style: style));
        break;
      case 1:
        text = GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, 'pollution_info');
            },
            child: Text('NO2', style: style));
        break;
      case 2:
        text = GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, 'pollution_info');
            },
            child: Text('O3', style: style));
        break;
      case 3:
        text = GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, 'pollution_info');
            },
            child: Text('SO2', style: style));
        break;
      case 4:
        text = GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, 'pollution_info');
            },
            child: Text('PM2.5', style: style));
        break;
      case 5:
        text = GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, 'pollution_info');
            },
            child: Text('PM10', style: style));
        break;
      default:
        text = const SizedBox();
    }
    return text;
  }

  Widget rightTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 10,
    );

    if (value == 100) {
      return FittedBox(
        fit: BoxFit.fitWidth,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('100', style: style),
            Text('+', style: style),
          ],
        ),
      );
    } else {
      return Text(value.toInt().toString(), style: style);
    }
  }}