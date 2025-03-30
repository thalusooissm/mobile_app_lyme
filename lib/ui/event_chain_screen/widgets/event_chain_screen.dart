import 'package:flutter/material.dart';

class EventChainScreen extends StatefulWidget {
  const EventChainScreen({Key? key}) : super(key: key);

  @override
  _EventChainScreenState createState() => _EventChainScreenState();
}

class _EventChainScreenState extends State<EventChainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Event Chain Screen'),
      ),
      body: const Center(
        child: Text('Event Chain Screen Content'),
      ),
    );
  }
}
