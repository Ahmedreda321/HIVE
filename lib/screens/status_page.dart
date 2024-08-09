// import 'package:flutter/material.dart';
// import 'package:hive/utils/colors.dart';

// class RemoteControlScreen extends StatelessWidget {
//   const RemoteControlScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             SizedBox(height: 60),
//             DeviceCard(),
//             SizedBox(height: 20),
//             StatusSection(),
//             SizedBox(height: 20),
//             TimeSection(),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class DeviceCard extends StatelessWidget {
//   const DeviceCard({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       color: Scendarycolor,
//       elevation: 8,
//       child: ListTile(
//         leading: Image.asset('assets/images/logo.jpg'),
//         title: const Text('TINA2S', style: _boldTextStyle),
//         subtitle: const Text('WA943C6CC11C34\nV1.4.0'),
//       ),
//     );
//   }
// }

// class StatusSection extends StatelessWidget {
//   const StatusSection({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(16.0),
//       decoration: _boxDecoration,
//       child: Column(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               const Icon(Icons.coffee),
//               const Text(
//                 'Idle',
//                 style: _boldTextStyle,
//               ),
//               const Spacer(),
//               Row(
//                 children: [
//                   IconButton(
//                     icon: const Icon(Icons.play_arrow),
//                     onPressed: () {},
//                   ),
//                   IconButton(
//                     icon: const Icon(Icons.pause),
//                     onPressed: () {},
//                   ),
//                 ],
//               ),
//             ],
//           ),
//           const Divider(),
//           const SizedBox(height: 16),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               _buildTemperatureInfo(
//                 image: 'assets/images/nozzel.png',
//                 label: 'Nozzle Temp',
//                 value: '25°C',
//               ),
//               _buildTemperatureInfo(
//                 image: 'assets/images/bed.png',
//                 label: 'Bed Temp',
//                 value: '28°C',
//               ),
//             ],
//           ),
//           const SizedBox(height: 30),
//           const CircularProgress(progress: 0.10)
//         ],
//       ),
//     );
//   }

//   Widget _buildTemperatureInfo({
//     required String image,
//     required String label,
//     required String value,
//   }) {
//     return Column(
//       children: [
//         SizedBox(
//           height: 40,
//           width: 40,
//           child: Image.asset(image),
//         ),
//         Text(
//           label,
//           style:
//               const TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
//         ),
//         Text(
//           value,
//           style: const TextStyle(fontSize: 18),
//         ),
//       ],
//     );
//   }
// }

// class TimeSection extends StatelessWidget {
//   const TimeSection({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(16.0),
//       decoration: _boxDecoration,
//       child: Column(
//         children: [
//           const Row(
//             children: [
//               Icon(Icons.timer),
//               Text(
//                 'Time',
//                 style: _boldTextStyle,
//               ),
//               Spacer()
//             ],
//           ),
//           const SizedBox(height: 20),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               _buildTimeInfo(
//                 image: 'assets/images/timer1.png',
//                 label: 'Elapsed Time',
//                 value: '---',
//               ),
//               _buildTimeInfo(
//                 image: 'assets/images/timer1.png',
//                 label: 'Remain Time',
//                 value: '---',
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildTimeInfo({
//     required String image,
//     required String label,
//     required String value,
//   }) {
//     return Column(
//       children: [
//         SizedBox(
//           height: 40,
//           width: 40,
//           child: Image.asset(image),
//         ),
//         Text(
//           label,
//           style:
//               const TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
//         ),
//         Text(
//           value,
//           style: const TextStyle(fontSize: 18),
//         ),
//       ],
//     );
//   }
// }

// class CircularProgress extends StatelessWidget {
//   final double progress;

//   const CircularProgress({super.key, required this.progress});

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Stack(
//         alignment: Alignment.center,
//         children: [
//           SizedBox(
//             height: 100,
//             width: 100,
//             child: CircularProgressIndicator(
//               value: progress,
//               strokeWidth: 6.0,
//               valueColor: const AlwaysStoppedAnimation<Color>(primaryColor),
//               backgroundColor: Colors.grey[300],
//             ),
//           ),
//           Text(
//             '${(progress * 100).toInt()}%',
//             style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//           ),
//         ],
//       ),
//     );
//   }
// }

// const _boxDecoration = BoxDecoration(
//   borderRadius: BorderRadius.all(Radius.circular(10)),
//   color: Scendarycolor,
//   boxShadow: [
//     BoxShadow(
//       color: Colors.black,
//       blurRadius: 2.0,
//     ),
//   ],
// );

// const _boldTextStyle = TextStyle(
//   fontSize: 18,
//   fontWeight: FontWeight.bold,
// );

import 'package:flutter/material.dart';
import 'package:hive/utils/colors.dart';

class SizeConfig {
  static double? screenHeight;
  static double? screenWidth;
  static double? defaultSize;
  static Orientation? orientation;

  void init(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    orientation = MediaQuery.of(context).orientation;

    // ignore: unrelated_type_equality_checks
    defaultSize = orientation == Orientation.landscape
        ? MediaQuery.of(context).size.width * 0.024
        : MediaQuery.of(context).size.width * 0.024;
  }
}

class RemoteControlScreen extends StatelessWidget {
  const RemoteControlScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(SizeConfig.defaultSize! * 1.6),
        child: Column(
          children: [
            SizedBox(height: SizeConfig.defaultSize! * 6),
            const DeviceCard(),
            SizedBox(height: SizeConfig.defaultSize! * 2),
            const StatusSection(),
            SizedBox(height: SizeConfig.defaultSize! * 2),
            const TimeSection(),
          ],
        ),
      ),
    );
  }
}

class DeviceCard extends StatelessWidget {
  const DeviceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Scendarycolor,
      elevation: 8,
      child: ListTile(
        leading: Image.asset(
          'assets/images/logo.jpg',
          width: SizeConfig.defaultSize! * 4,
          height: SizeConfig.defaultSize! * 4,
        ),
        title: const Text('TINA2S', style: _boldTextStyle),
        subtitle: const Text('WA943C6CC11C34\nV1.4.0'),
      ),
    );
  }
}

class StatusSection extends StatelessWidget {
  const StatusSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(SizeConfig.defaultSize! * 1.6),
      decoration: _boxDecoration,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(Icons.coffee),
              const Text(
                'Idle',
                style: _boldTextStyle,
              ),
              const Spacer(),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.play_arrow),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.pause),
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
          const Divider(),
          SizedBox(height: SizeConfig.defaultSize! * 1.6),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildTemperatureInfo(
                image: 'assets/images/nozzel.png',
                label: 'Nozzle Temp',
                value: '25°C',
              ),
              _buildTemperatureInfo(
                image: 'assets/images/bed.png',
                label: 'Bed Temp',
                value: '28°C',
              ),
            ],
          ),
          SizedBox(height: SizeConfig.defaultSize! * 3),
          const CircularProgress(progress: 0.10)
        ],
      ),
    );
  }

  Widget _buildTemperatureInfo({
    required String image,
    required String label,
    required String value,
  }) {
    return Column(
      children: [
        SizedBox(
          height: SizeConfig.defaultSize! * 4,
          width: SizeConfig.defaultSize! * 4,
          child: Image.asset(image),
        ),
        Text(
          label,
          style:
              const TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
        ),
        Text(
          value,
          style: const TextStyle(fontSize: 18),
        ),
      ],
    );
  }
}

class TimeSection extends StatelessWidget {
  const TimeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(SizeConfig.defaultSize! * 1.6),
      decoration: _boxDecoration,
      child: Column(
        children: [
          const Row(
            children: [
              Icon(Icons.timer),
              Text(
                'Time',
                style: _boldTextStyle,
              ),
              Spacer()
            ],
          ),
          SizedBox(height: SizeConfig.defaultSize! * 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildTimeInfo(
                image: 'assets/images/timer1.png',
                label: 'Elapsed Time',
                value: '---',
              ),
              _buildTimeInfo(
                image: 'assets/images/timer1.png',
                label: 'Remain Time',
                value: '---',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTimeInfo({
    required String image,
    required String label,
    required String value,
  }) {
    return Column(
      children: [
        SizedBox(
          height: SizeConfig.defaultSize! * 4,
          width: SizeConfig.defaultSize! * 4,
          child: Image.asset(image),
        ),
        Text(
          label,
          style:
              const TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
        ),
        Text(
          value,
          style: const TextStyle(fontSize: 18),
        ),
      ],
    );
  }
}

class CircularProgress extends StatelessWidget {
  final double progress;

  const CircularProgress({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            height: SizeConfig.defaultSize! * 10,
            width: SizeConfig.defaultSize! * 10,
            child: CircularProgressIndicator(
              value: progress,
              strokeWidth: 6.0,
              valueColor: const AlwaysStoppedAnimation<Color>(primaryColor),
              backgroundColor: Colors.grey[300],
            ),
          ),
          Text(
            '${(progress * 100).toInt()}%',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

const _boxDecoration = BoxDecoration(
  borderRadius: BorderRadius.all(Radius.circular(10)),
  color: Scendarycolor,
  boxShadow: [
    BoxShadow(
      color: Colors.black,
      blurRadius: 2.0,
    ),
  ],
);

const _boldTextStyle = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.bold,
);
