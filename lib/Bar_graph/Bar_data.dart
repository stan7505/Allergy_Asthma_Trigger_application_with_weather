import 'package:weather_demo/Bar_graph/individual_bar.dart';

class BarData{
  final double CO;
  final double NO2;
  final double O3;
  final double SO2;
  final double PM2_5;
  final double PM10;

  BarData({
    required this.CO,
    required this.NO2,
    required this.O3,
    required this.SO2,
    required this.PM2_5,
    required this.PM10,
  });
  List<IndividualBar> barData = [
  ];


  void InitializeBarData(){
    barData = [
      IndividualBar(x: 0, y: CO),
      IndividualBar(x: 1, y: NO2),
      IndividualBar(x: 2, y: O3),
      IndividualBar(x: 3, y: SO2),
      IndividualBar(x: 4, y: PM2_5),
      IndividualBar(x: 5, y: PM10),
    ];
  }
}