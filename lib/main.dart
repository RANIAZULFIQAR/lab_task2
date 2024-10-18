import 'package:flutter/material.dart';

class SimpleTweenAnimation extends StatefulWidget {
  const SimpleTweenAnimation({super.key});

  @override
  State<SimpleTweenAnimation> createState() => _SimpleTweenAnimationState();
}

class _SimpleTweenAnimationState extends State<SimpleTweenAnimation> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // AnimationController to control the animation
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2), // Animation duration
    );

    // Tween to animate from 0 to 300 (left to right)
    _animation = Tween<double>(begin: 0, end: 300).animate(_controller);

    // Add listener to rebuild the widget on animation update
    _controller.addListener(() {
      setState(() {}); // Update UI when animation changes
    });
  }

  @override
  void dispose() {
    _controller.dispose(); // Clean up the controller when done
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Task 2 Tween Animation')),
      body: Center(
        child: Container(
          margin: EdgeInsets.only(left: _animation.value), // Move container left to right
          width: 50,
          height: 50,
          color: Colors.pinkAccent, // Blue box for visual effect
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _controller.isAnimating ? _controller.stop() : _controller.forward();
        },
        child: Icon(_controller.isAnimating ? Icons.pause : Icons.play_arrow),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: SimpleTweenAnimation(),
  ));
}
