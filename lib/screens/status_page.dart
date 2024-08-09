import 'package:flutter/material.dart';
import 'package:hive/utils/colors.dart';

class RemoteControlScreen extends StatelessWidget {
  const RemoteControlScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 60),
            DeviceCard(),
            SizedBox(height: 20),
            StatusSection(),
            SizedBox(height: 20),
            TimeSection(),
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
      elevation: 8,
      child: ListTile(
        leading: Image.asset('assets/images/logo.jpg'),
        title: const Text('TINA2S'),
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
      padding: const EdgeInsets.all(16.0),
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
          const SizedBox(height: 16),
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
          const SizedBox(height: 30),
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
          height: 40,
          width: 40,
          child: Image.asset(image),
        ),
        Text(
          label,
          style: const TextStyle(color: Colors.grey),
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
      padding: const EdgeInsets.all(16.0),
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
          const SizedBox(height: 20),
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
          height: 40,
          width: 40,
          child: Image.asset(image),
        ),
        Text(
          label,
          style: const TextStyle(color: Colors.grey),
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
            height: 100,
            width: 100,
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
  color: Colors.white,
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
