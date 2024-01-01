// import 'package:charts_flutter/flutter.dart' as charts;
import 'package:fl_chart/fl_chart.dart' as chart;

import 'package:flutter/material.dart';

class CategoryProductsChart extends StatelessWidget {
  final List<chart.BarChartGroupData> seriesList;
  const CategoryProductsChart({
    Key? key,
    required this.seriesList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
    chart.BarChart(chart.BarChartData(
      barGroups: seriesList,
      // other parameters
    ))
    //  charts.BarChart(
    //   seriesList,
    //   animate: true,
    // )
    
    ;
    
  }
}
