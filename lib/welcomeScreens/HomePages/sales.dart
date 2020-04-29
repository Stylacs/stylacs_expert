import 'package:flutter/material.dart';
// import 'package:page_transition/page_transition.dart';
import 'package:stylacs_expert/size_config.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:stylacs_expert/welcomeScreens/HomePages/SalesScreen/monthly.dart';
import 'package:stylacs_expert/welcomeScreens/HomePages/SalesScreen/yearly.dart';
import 'package:stylacs_expert/widget/drawer/drawer.dart';

class Sales extends StatefulWidget {
  @override
  _SalesState createState() => _SalesState();
}

class _SalesState extends State<Sales> with SingleTickerProviderStateMixin {
  final scafKey = GlobalKey<ScaffoldState>();
  TabController _tabController;
  String selectedDate;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    DateTime initDate = DateTime.now();
    selectedDate = "${initDate.day}/${initDate.month}/${initDate.year}";
  }

  @override
  Widget build(BuildContext context) {
    // var orentaion = MediaQuery.of(context).orientation;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        key: scafKey,
        appBar: appbar(),
        drawer: MyDrawer().buildDrawer(context),
        body: TabBarView(
            controller: _tabController,
            children: <Widget>[portraitScreen(), Monthly(), Yearly()]),
      ),
    );
  }

  Widget portraitScreen() {
    return SingleChildScrollView(
          child: Column(
        children: <Widget>[
          SizedBox(
            height: (10 / 7.6) * SizeConfig.heightMultiplier,
          ),
          datePicker(),
          SizedBox(
            height: (15 / 7.6) * SizeConfig.heightMultiplier,
          ),
          totalSales(),
          Divider(),
          SizedBox(
            height: (20 / 7.6) * SizeConfig.heightMultiplier,
          ),
          chartContainer(),
          SizedBox(
            height: (10 / 7.6) * SizeConfig.heightMultiplier,
          ),
          bottomList(),
        ],
      ),
    );
  }

  AppBar appbar() {
    return AppBar(
      title: Text(
        "Sales",
        style: TextStyle(
            fontSize: (20 / 7.6) * SizeConfig.heightMultiplier,
            color: Colors.white),
      ),
      centerTitle: true,
      leading: InkWell(
        onTap: () {
          scafKey.currentState.openDrawer();
        },
        child: Icon(
          Icons.menu,
          size: (25 / 7.6) * SizeConfig.heightMultiplier,
          color: Colors.white,
        ),
      ),
      actions: <Widget>[
        InkWell(
          onTap: () {},
          child: Icon(
            Icons.more_vert,
            size: (25 / 7.6) * SizeConfig.heightMultiplier,
            color: Colors.white,
          ),
        )
      ],
      bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          tabs: [
            Text(
              "Weekly",
              style: TextStyle(
                  fontSize: (18 / 7.6) * SizeConfig.heightMultiplier,
                  color: Colors.white),
            ),
            Text(
              "Monthly",
              style: TextStyle(
                  fontSize: (18 / 7.6) * SizeConfig.heightMultiplier,
                  color: Colors.white),
            ),
            Text(
              "Yearly",
              style: TextStyle(
                  fontSize: (18 / 7.6) * SizeConfig.heightMultiplier,
                  color: Colors.white),
            )
          ]),
    );
  }

  Widget chartContainer() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: (280 / 7.6) * SizeConfig.heightMultiplier,
      decoration: BoxDecoration(
        // color: Colors.red,
        borderRadius: BorderRadius.all(Radius.circular(18)),
        // gradient: LinearGradient(
        //   colors: const [
        //     Color(0xff2c274c),
        //     Color(0xff46426c),
        //   ],
        //   begin: Alignment.bottomCenter,
        //   end: Alignment.topCenter,
        // ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            'Sales Report',
            style: TextStyle(
              color: Color(0xff827daa),
              fontSize: (18 / 7.6) * SizeConfig.heightMultiplier,
            ),
            textAlign: TextAlign.center,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                  right: (15 / 3.6) * SizeConfig.widthMultiplier,
                  left: (6 / 3.6) * SizeConfig.widthMultiplier),
              child: LineChart(
                sampleData1(),
                swapAnimationDuration: const Duration(milliseconds: 250),
              ),
            ),
          ),
          SizedBox(
            height: (10 / 7.6) * SizeConfig.heightMultiplier,
          ),
        ],
      ),
    );
  }

  Widget datePicker() {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: (10 / 2.6) * SizeConfig.widthMultiplier),
      child: InkWell(
        onTap: () async {
          DateTime dateSelected = await showDatePicker(
            context: context,
            initialDate: new DateTime.now(),
            firstDate: new DateTime(1960),
            lastDate: new DateTime(2050),
          );
          setState(() {
            selectedDate =
                "${dateSelected.day}/${dateSelected.month}/${dateSelected.year}";
          });
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(
              vertical: (15 / 7.6) * SizeConfig.heightMultiplier,
              horizontal: (10 / 3.6) * SizeConfig.widthMultiplier),
          decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.all(
                  Radius.circular((8 / 7.6) * SizeConfig.heightMultiplier))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Icon(
                Icons.calendar_today,
                size: (25 / 7.6) * SizeConfig.heightMultiplier,
                color: Theme.of(context).primaryColor,
              ),
              Text(
                "$selectedDate",
                style: TextStyle(
                    fontSize: (20 / 7.6) * SizeConfig.heightMultiplier),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget totalSales() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Column(
          children: <Widget>[
            Text(
              "3,567",
              style: TextStyle(
                  color: Colors.green,
                  fontSize: (30 / 7.6) * SizeConfig.heightMultiplier),
            ),
            Text(
              "Total Sales(Rs)",
              style: TextStyle(
                  color: Colors.grey[400],
                  fontSize: (15 / 7.6) * SizeConfig.heightMultiplier),
            )
          ],
        ),
        Column(
          children: <Widget>[
            Text(
              "7,644",
              style: TextStyle(
                  color: Colors.red,
                  fontSize: (30 / 7.6) * SizeConfig.heightMultiplier),
            ),
            Text(
              "Purchases(Rs)",
              style: TextStyle(
                  color: Colors.grey[400],
                  fontSize: (15 / 7.6) * SizeConfig.heightMultiplier),
            )
          ],
        )
      ],
    );
  }

  LineChartData sampleData1() {
    return LineChartData(
      lineTouchData: LineTouchData(
        touchTooltipData:
            LineTouchTooltipData(tooltipBgColor: Colors.transparent),
        touchCallback: (LineTouchResponse touchResponse) {},
        handleBuiltInTouches: true,
        enabled: true,
      ),
      gridData: FlGridData(
        show: true,
      ),
      titlesData: FlTitlesData(
        bottomTitles: SideTitles(
          showTitles: true,
          // reservedSize: 22,
          textStyle: TextStyle(
            color: Color(0xff72719b),
            fontWeight: FontWeight.bold,
            fontSize: (16 / 7.6) * SizeConfig.heightMultiplier,
          ),
          // margin: 10,
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return 'Mon';
              case 2:
                return 'Tue';
              case 3:
                return 'Wed';
              case 4:
                return 'Thu';
              case 5:
                return 'Fri';
              case 6:
                return 'Sat';
              case 7:
                return 'Sun';
            }
            return '';
          },
        ),
        leftTitles: SideTitles(
          showTitles: true,
          textStyle: TextStyle(
            color: Color(0xff75729e),
            fontWeight: FontWeight.w500,
            fontSize: (14 / 7.6) * SizeConfig.heightMultiplier,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '1k';
              case 2:
                return '2k';
              case 3:
                return '3k';
              case 4:
                return '4k';
              case 5:
                return '5k';
            }
            return '';
          },
          // margin: 8,
          // reservedSize: 30,
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border(
          bottom: BorderSide(
            color: Color(0xff4e4965),
            width: (2 / 3.6) * SizeConfig.widthMultiplier,
          ),
          left: BorderSide(
            color: Colors.transparent,
          ),
          right: BorderSide(
            color: Colors.transparent,
          ),
          top: BorderSide(
            color: Colors.transparent,
          ),
        ),
      ),
      minX: 0,
      maxX: 8,
      maxY: 6,
      minY: 0,
      lineBarsData: linesBarData1(),
    );
  }

  List<LineChartBarData> linesBarData1() {
    final LineChartBarData lineChartBarData1 = LineChartBarData(
      spots: [
        FlSpot(1, 1),
        FlSpot(2, 1.5),
        FlSpot(3, 1.4),
        FlSpot(4, 3.4),
        FlSpot(5, 3),
        FlSpot(6, 4.2),
        FlSpot(7, 5),
      ],
      isCurved: true,
      colors: [
        // const Color(0xff4af699),
        Colors.green[400]
      ],
      barWidth: (2 / 3.6) * SizeConfig.widthMultiplier,
      isStrokeCapRound: true,
      dotData: FlDotData(
        show: true,
      ),
      belowBarData: BarAreaData(
        show: false,
      ),
    );
    return [
      lineChartBarData1,
    ];
  }

  Widget bottomList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(
              horizontal: (15 / 3.6) * SizeConfig.widthMultiplier),
          width: MediaQuery.of(context).size.width,
          child: Text(
            'Lead Details',
            style: TextStyle(
              color: Color(0xff827daa),
              fontSize: (18 / 7.6) * SizeConfig.heightMultiplier,
            ),
            textAlign: TextAlign.left,
          ),
        ),
        SizedBox(
          height: (10 / 7.6) * SizeConfig.heightMultiplier,
        ),
        ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.grey,
            backgroundImage: AssetImage("assets/images/flutter.jpg"),
            radius: (25 / 7.6) * SizeConfig.heightMultiplier,
          ),
          title: Text(
            "Foursquare",
            style:
                TextStyle(fontSize: (15 / 7.6) * SizeConfig.heightMultiplier),
          ),
          subtitle: Row(
            children: <Widget>[
              Text(
                "Contact: ",
                style: TextStyle(
                    fontSize: (13 / 7.6) * SizeConfig.heightMultiplier,
                    color: Colors.grey[400]),
              ),
              Text(
                "John Doe",
                style: TextStyle(
                    fontSize: (13 / 7.6) * SizeConfig.heightMultiplier),
              )
            ],
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              InkWell(
                onTap: () {},
                child: Icon(
                  Icons.phone,
                  color: Colors.grey,
                  size: (20 / 7.6) * SizeConfig.heightMultiplier,
                ),
              ),
              SizedBox(
                width: (10 / 7.6) * SizeConfig.heightMultiplier,
              ),
              InkWell(
                onTap: () {},
                child: Icon(
                  Icons.mode_comment,
                  color: Colors.grey,
                  size: (20 / 7.6) * SizeConfig.heightMultiplier,
                ),
              ),
              SizedBox(
                width: (10 / 7.6) * SizeConfig.heightMultiplier,
              ),
              InkWell(
                onTap: () {},
                child: Icon(
                  Icons.image,
                  color: Colors.grey,
                  size: (20 / 7.6) * SizeConfig.heightMultiplier,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
