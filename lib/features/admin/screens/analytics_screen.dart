import 'package:amazon_clone/constants/loader.dart';
import 'package:amazon_clone/features/admin/model/sales.dart';
import 'package:amazon_clone/features/admin/services/admin_services.dart';
import 'package:amazon_clone/features/admin/widget/category_product_chart.dart';
import 'package:flutter/material.dart';
// import the fl_chart package
import 'package:fl_chart/fl_chart.dart';

class AnalyticsScreen extends StatefulWidget {
  const AnalyticsScreen({Key? key}) : super(key: key);

  @override
  State<AnalyticsScreen> createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen> {
  final AdminServices adminServices = AdminServices();
  int? totalSales;
  List<Sales>? earnings;

  @override
  void initState() {
    super.initState();
    getEarnings();
  }

  getEarnings() async {
    var earningData = await adminServices.getEarnings(context);
    totalSales = earningData['totalEarnings'];
    earnings = earningData['sales'];
    setState(() {});

  }

  @override
  Widget build(BuildContext context) {
    List<int> labels = earnings!.map((sales) => int.parse(sales.label)).toList();
    return earnings == null || totalSales == null
        ? const Loader()
        : Column(
            children: [
              Text(
                '\$$totalSales',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 250,
                // use the CategoryProductsChart widget with the fl_chart package
                child: CategoryProductsChart(
                 seriesList: labels.asMap().entries.map(
  (entry) => BarChartGroupData(
    x: entry.key,
    barRods: [
      BarChartRodData(
        toY: earnings![entry.key].earning.toDouble(),
        width: 15,
        color: Colors.amber,
      ),
    ],
  ),
).toList(),
                ),
              )
            ],
          );
  }
}
