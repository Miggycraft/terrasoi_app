import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class ReportingPage extends StatefulWidget {
  const ReportingPage({Key? key}) : super(key: key);

  @override
  _ReportingPageState createState() => _ReportingPageState();
}

class _ReportingPageState extends State<ReportingPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late List<Ratings> ratings;
  late List<PieChartData> chartData;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    initializeData();
    // Add listener to update the page content based on the selected tab
    _tabController.addListener(_onTabChanged);
  }

  // Listener to call setState when tab changes
  void _onTabChanged() {
    if (_tabController.indexIsChanging) {
      setState(() {
        // Forces widget to rebuild when tab changes
      });
    }
  }

  void initializeData() {
    ratings = [
      Ratings(5, 3, 2), // Day
      Ratings(4, 4, 3), // Week
      Ratings(3, 5, 4), // Month
      Ratings(4, 3, 5), // All Time
    ];

    chartData = ratings
        .map((rating) => PieChartData(
              borderData: FlBorderData(show: false),
              sectionsSpace: 0,
              centerSpaceRadius: 80,
              sections: [
                PieChartSectionData(
                  color: Colors.teal[200],
                  // Turquoise color
                  value: rating.production.toDouble() * 20,
                  title: '${rating.production * 20}%',
                  radius: 60,
                  titleStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                PieChartSectionData(
                  color: Colors.teal[400],
                  // Turquoise color
                  value: rating.quality.toDouble() * 20,
                  title: '${rating.quality * 20}%',
                  radius: 60,
                  titleStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                PieChartSectionData(
                  color: Colors.teal[600],
                  // Turquoise color
                  value: rating.service.toDouble() * 20,
                  title: '${rating.service * 20}%',
                  radius: 60,
                  titleStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ],
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Material(
            child: TabBar(
              controller: _tabController,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.green,
              dividerColor: Colors.transparent,
              indicatorColor: Colors.transparent,
              padding: EdgeInsets.zero,
              tabAlignment: TabAlignment.center,
              isScrollable: true,
              labelStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              tabs: const [
                Tab(text: 'Day'),
                Tab(text: 'Week'),
                Tab(text: 'Month'),
                Tab(text: 'All Time'),
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // Center the column contents vertically
              children: [
                Expanded(
                  flex: 5, // Adjust flex to give more room to the chart
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    // Set the width of the chart to the screen width
                    height: MediaQuery.of(context).size.height * 0.5,
                    // Set the height of the chart to half of the screen height
                    child: PieChart(
                      chartData[_tabController.index],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2, // Adjust flex for the rating section
                  child: _buildRatingInfo(ratings[_tabController.index]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRatingInfo(Ratings rating) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      // Align items to the start of the column
      children: <Widget>[
        _buildRatingRow('Production', rating.production, Colors.teal[200]!),
        const SizedBox(
          height: 15,
        ),
        _buildRatingRow('Quality', rating.quality, Colors.teal[400]!),
        const SizedBox(
          height: 15,
        ),
        _buildRatingRow('Service', rating.service, Colors.teal[600]!),
      ],
    );
  }

  Widget _buildRatingRow(String label, int rating, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // Center the row contents
        children: <Widget>[
          Row(
            children: [
              Icon(Icons.circle, size: 20, color: color),
              SizedBox(width: 12),
              Text(label,
                  style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.green[900])),
              SizedBox(width: 12),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: List.generate(
                5,
                (index) => Icon(
                      index < rating ? Icons.star : Icons.star_border,
                      color: index < rating ? Colors.amber : Colors.grey,
                      size: 24,
                    )),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _tabController.removeListener(_onTabChanged);
    _tabController.dispose();
    super.dispose();
  }
}

class Ratings {
  final int production;
  final int quality;
  final int service;

  Ratings(this.production, this.quality, this.service);
}
