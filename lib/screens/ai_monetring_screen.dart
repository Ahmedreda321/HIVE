// import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_gauges/gauges.dart';

// class AiMonitoringScreen extends StatelessWidget {
//   const AiMonitoringScreen({super.key});

//   static const double _gaugeHeightFactor = 0.3;
//   static const double _bottomContainerHeightFactor = 0.11;
//   static const double _iconSize = 50.0;
//   static const BorderRadius _circularBorder =
//       BorderRadius.all(Radius.circular(15));
//   static const BorderRadius _circularIconBorder =
//       BorderRadius.all(Radius.circular(50));

//   @override
//   Widget build(BuildContext context) {
//     final screenHeight = MediaQuery.of(context).size.height;
//     final screenWidth = MediaQuery.of(context).size.width;

//     return Scaffold(
//       // backgroundColor: primaryColor,

//       body: Stack(
//         children: [
//           _buildBackgroundImage(screenWidth, screenHeight),
//           _buildGaugeContainer(screenWidth, screenHeight),
//           _buildBottomContainer(screenWidth, screenHeight),
//         ],
//       ),
//     );
//   }

//   Positioned _buildBackgroundImage(double width, double height) {
//     return Positioned(
//       top: height * 0.05,
//       child: Container(
//         decoration: const BoxDecoration(
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black,
//               blurRadius: 2.0,
//             )
//           ],
//         ),
//         height: height * 0.5,
//         width: width,
//         child: Image.asset(
//           'assets/images/hjjkd.jpg',
//           fit: BoxFit.cover,
//         ),
//       ),
//     );
//   }

//   Positioned _buildGaugeContainer(double width, double height) {
//     return Positioned(
//       left: 10,
//       right: 10,
//       bottom: height * 0.120,
//       child: Container(
//           height: height * _gaugeHeightFactor,
//           width: width * 0.8,
//           decoration: const BoxDecoration(
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black,
//                 blurRadius: 2.0,
//               )
//             ],
//             borderRadius: _circularBorder,
//             color: Colors.white,
//           ),
//           child: Column(
//             children: [
//               SizedBox(height: 200, child: _buildGauge()),
//               const Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   Text(
//                     'coordinates:',
//                     style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
//                   ),
//                   Text('x:135.02'),
//                   Text('y:265.00'),
//                   Text('z:40.04'),
//                 ],
//               ),
//             ],
//           )),
//     );
//   }

//   Positioned _buildBottomContainer(double width, double height) {
//     return Positioned(
//       bottom: 5,
//       left: 10,
//       right: 10,
//       child: Container(
//         height: height * _bottomContainerHeightFactor,
//         width: width * 0.8,
//         decoration: const BoxDecoration(
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black,
//               blurRadius: 2.0,
//             )
//           ],
//           borderRadius: _circularBorder,
//           color: Colors.white,
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             _buildIconContainer(Icons.stop, Colors.yellowAccent),
//             _buildIconContainer(Icons.play_arrow, Colors.orangeAccent),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildGauge() {
//     return SfRadialGauge(
//       axes: <RadialAxis>[
//         RadialAxis(
//           minimum: 0,
//           maximum: 100,
//           ranges: <GaugeRange>[
//             GaugeRange(
//               startValue: 0,
//               endValue: 50,
//               color: Colors.green,
//             ),
//             GaugeRange(
//               startValue: 50,
//               endValue: 75,
//               color: Colors.orange,
//             ),
//             GaugeRange(
//               startValue: 75,
//               endValue: 100,
//               color: Colors.red,
//             ),
//           ],
//           pointers: const <GaugePointer>[
//             NeedlePointer(
//               value: 52,
//               enableAnimation: true,
//             ),
//           ],
//           annotations: const <GaugeAnnotation>[
//             GaugeAnnotation(
//               widget: Text(
//                 '52',
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               angle: 90,
//               positionFactor: 0.5,
//             ),
//           ],
//         ),
//       ],
//     );
//   }

//   Widget _buildIconContainer(IconData icon, Color color) {
//     return Container(
//       height: _iconSize,
//       width: _iconSize,
//       decoration: BoxDecoration(
//         borderRadius: _circularIconBorder,
//         color: color,
//       ),
//       child: Icon(icon),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class AiMonitoringScreen extends StatelessWidget {
  const AiMonitoringScreen({super.key});

  static const double _gaugeHeightFactor = 0.3;
  static const double _bottomContainerHeightFactor = 0.11;
  static const double _iconSize = 50.0;
  static const BorderRadius _circularBorder =
      BorderRadius.all(Radius.circular(15));
  static const BorderRadius _circularIconBorder =
      BorderRadius.all(Radius.circular(50));

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      // backgroundColor: primaryColor,

      body: Stack(
        children: [
          _buildBackgroundImage(screenWidth, screenHeight),
          _buildGaugeCard(screenWidth, screenHeight),
          _buildBottomCard(screenWidth, screenHeight),
        ],
      ),
    );
  }

  Positioned _buildBackgroundImage(double width, double height) {
    return Positioned(
      top: height * 0.05,
      child: Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              blurRadius: 2.0,
            )
          ],
        ),
        height: height * 0.5,
        width: width,
        child: Image.asset(
          'assets/images/hjjkd.jpg',
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Positioned _buildGaugeCard(double width, double height) {
    return Positioned(
      left: 10,
      right: 10,
      bottom: height * 0.120,
      child: Card(
        elevation: 6.0,
        shape: const RoundedRectangleBorder(
          borderRadius: _circularBorder,
        ),
        child: Container(
          height: height * _gaugeHeightFactor,
          width: width * 0.8,
          decoration: const BoxDecoration(
            borderRadius: _circularBorder,
            color: Colors.white,
          ),
          child: Column(
            children: [
              SizedBox(height: 200, child: _buildGauge()),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'coordinates:',
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                  ),
                  Text('x:135.02'),
                  Text('y:265.00'),
                  Text('z:40.04'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Positioned _buildBottomCard(double width, double height) {
    return Positioned(
      bottom: 5,
      left: 10,
      right: 10,
      child: Card(
        elevation: 4.0,
        shape: const RoundedRectangleBorder(
          borderRadius: _circularBorder,
        ),
        child: Container(
          height: height * _bottomContainerHeightFactor,
          width: width * 0.8,
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
      height: _iconSize,
      width: _iconSize,
      decoration: BoxDecoration(
        borderRadius: _circularIconBorder,
        color: color,
      ),
      child: Icon(icon),
    );
  }
}
