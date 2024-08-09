import 'package:flutter/material.dart';
import 'package:hive/utils/size_confing.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class AiMonitoringScreen extends StatelessWidget {
  const AiMonitoringScreen({super.key});

  static const BorderRadius _circularBorder =
      BorderRadius.all(Radius.circular(15));
  static const BorderRadius _circularIconBorder =
      BorderRadius.all(Radius.circular(50));

  @override
  Widget build(BuildContext context) {
    SizeConfing().init(context);

    return Scaffold(
      body: Stack(
        children: [
          _buildBackgroundImage(),
          _buildGaugeCard(),
          _buildBottomCard(),
        ],
      ),
    );
  }

  Positioned _buildBackgroundImage() {
    return Positioned(
      left: SizeConfing.screenWidth! * 0.020,
      right: SizeConfing.screenWidth! * 0.020,
      top: SizeConfing.screenHeight! * 0.05,
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: _circularBorder,
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              blurRadius: 2.0,
            )
          ],
        ),
        height: SizeConfing.screenHeight! * 0.5,
        width: SizeConfing.screenWidth,
        child: ClipRRect(
          borderRadius: _circularBorder,
          child: Image.asset(
            'assets/images/hjjkd.jpg',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Positioned _buildGaugeCard() {
    return Positioned(
      left: SizeConfing.screenWidth! * 0.025,
      right: SizeConfing.screenWidth! * 0.025,
      bottom: SizeConfing.screenHeight! * 0.13,
      child: Card(
        elevation: 6.0,
        shape: const RoundedRectangleBorder(
          borderRadius: _circularBorder,
        ),
        child: Container(
          height: SizeConfing.screenHeight! * 0.3,
          width: SizeConfing.screenWidth! * 0.95,
          decoration: const BoxDecoration(
            borderRadius: _circularBorder,
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                  height: SizeConfing.screenHeight! * 0.2,
                  child: _buildGauge()),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'coordinates:',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'x:135.02',
                    style: TextStyle(fontSize: 15),
                  ),
                  Text(
                    'y:265.00',
                    style: TextStyle(fontSize: 15),
                  ),
                  Text(
                    'z:40.04',
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Positioned _buildBottomCard() {
    return Positioned(
      bottom: SizeConfing.screenHeight! * 0.01,
      left: SizeConfing.screenWidth! * 0.025,
      right: SizeConfing.screenWidth! * 0.025,
      child: Card(
        elevation: 4.0,
        shape: const RoundedRectangleBorder(
          borderRadius: _circularBorder,
        ),
        child: Container(
          height: SizeConfing.screenHeight! * 0.11,
          width: SizeConfing.screenWidth! * 0.95,
          decoration: const BoxDecoration(
            borderRadius: _circularBorder,
            color: Colors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildIconContainer(Icons.stop, Colors.yellowAccent),
              _buildIconContainer(Icons.play_arrow, Colors.orangeAccent),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGauge() {
    return SfRadialGauge(
      axes: <RadialAxis>[
        RadialAxis(
          minimum: 0,
          maximum: 100,
          ranges: <GaugeRange>[
            GaugeRange(
              startValue: 0,
              endValue: 50,
              color: Colors.green,
            ),
            GaugeRange(
              startValue: 50,
              endValue: 75,
              color: Colors.orange,
            ),
            GaugeRange(
              startValue: 75,
              endValue: 100,
              color: Colors.red,
            ),
          ],
          pointers: const <GaugePointer>[
            NeedlePointer(
              value: 52,
              enableAnimation: true,
            ),
          ],
          annotations: const <GaugeAnnotation>[
            GaugeAnnotation(
              widget: Text(
                '52',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              angle: 90,
              positionFactor: 0.5,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildIconContainer(IconData icon, Color color) {
    return Container(
      height: SizeConfing.screenHeight! * 0.05,
      width: SizeConfing.screenHeight! * 0.05,
      decoration: BoxDecoration(
        borderRadius: _circularIconBorder,
        color: color,
      ),
      child: Icon(icon, size: SizeConfing.screenHeight! * 0.04),
    );
  }
}
