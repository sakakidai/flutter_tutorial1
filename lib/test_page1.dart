import 'package:flutter/material.dart';

class TestPage1 extends StatefulWidget {
  const TestPage1({Key? key}) : super(key: key);

  @override
  State<TestPage1> createState() => _TestPage1State();
}

class _TestPage1State extends State<TestPage1> with TickerProviderStateMixin {
  // ③Transition系Widget
  late AnimationController _animationController;
  // ⑤AnimationBuilder
  late Animation _animation;

  // ④Animation/Tween
  // late Animation<double> _animationDouble;
  // final Tween<double> _tweenDouble = Tween(begin: 0.0, end: 200.0);
  // late Animation<Color?> _animationColor;
  // final ColorTween _tweenColor = ColorTween(begin: Colors.green, end: Colors.blue);

  _play() async {
    setState(() {
      _animationController.forward();
    });
  }

  _stop() async {
    setState(() {
      _animationController.stop();
    });
  }

  _reverse() async {
    setState(() {
      _animationController.reverse();
    });
  }

  // ②AnimatedContainer,AnimatedSwitcher
  // bool flag = false;
  // _click() async {
  //   setState(() {
  //     flag = !flag;
  //   });
  // }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: const Duration(seconds: 3));

    _animation = _animationController.drive(Tween(begin: 0.0, end: 2.0 * 2.0));

    // ④Animation/Tween
    // _animationDouble = _tweenDouble.animate(_animationController);
    // _animationDouble.addListener(() {
    //   setState(() {});
    // });
    // _animationColor = _tweenColor.animate(_animationController);
    // _animationColor.addListener(() {
    //   setState(() {});
    // });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Test1')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: AnimatedBuilder(
                animation: _animation,
                builder: (context, _) {
                  return Transform.rotate(angle: _animation.value, child: Icon(Icons.cached, size: 100));
                },
              ),
            ),

            // ④Animation/Tween
            // Text("AnimationController:${_animationController.value}"),
            // Text("AnimationDouble:${_animationDouble.value}"),
            // Text("AnimationColor:${_animationColor.value}"),
            // // ③Transition系Widget
            // SizeTransition(
            //   sizeFactor: _animationController,
            //   child: Center(
            //     child: SizedBox(
            //       width: _animationDouble.value,
            //       height: _animationDouble.value,
            //       child: Container(color: _animationColor.value),
            //     ),
            //   ),
            // ),

            // ②AnimatedContainer,AnimatedSwitcher
            // AnimatedContainer(
            //   duration: const Duration(seconds: 3),
            //   width: flag ? 100 : 50,
            //   height: flag ? 50 : 100,
            //   padding: flag ? const EdgeInsets.all(0) : const EdgeInsets.all(30),
            //   margin: flag ? const EdgeInsets.all(0) : const EdgeInsets.all(30),
            //   transform: flag ? Matrix4.skewX(0.0) : Matrix4.skewX(0.3),
            //   color: flag ? Colors.blue : Colors.grey,
            // ),
            // AnimatedSwitcher(
            //   duration: const Duration(seconds: 3),
            //   child: flag ? const Text("なにもない") : const Icon(Icons.favorite, color: Colors.pink),
            // ),

            // ①Animated系Widget
            // AnimatedOpacity(
            //   opacity: flag ? 0.1 : 1.0,
            //   duration: const Duration(seconds: 3),
            //   child: Text('消える文字', style: Theme.of(context).textTheme.headline4),
            // ),
            // AnimatedSize(
            //   curve: Curves.easeIn,
            //   duration: const Duration(seconds: 3),
            //   child: SizedBox(width: flag ? 50 : 200, height: flag ? 50 : 200, child: Container(color: Colors.purple)),
            // ),
            // AnimatedAlign(
            //   duration: const Duration(seconds: 3),
            //   alignment: flag ? Alignment.topLeft : Alignment.bottomRight,
            //   child: SizedBox(
            //     width: 50,
            //     height: 50,
            //     child: Container(color: Colors.green),
            //   ),
            // ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // ③Transition系Widget
          FloatingActionButton(
            onPressed: _play,
            child: const Icon(Icons.arrow_forward),
          ),
          FloatingActionButton(
            onPressed: _stop,
            child: const Icon(Icons.pause),
          ),
          FloatingActionButton(
            onPressed: _reverse,
            child: const Icon(Icons.arrow_back),
          ),

          // ②AnimatedContainer,AnimatedSwitcher
          // FloatingActionButton(
          //   onPressed: _click,
          //   child: const Icon(Icons.add),
          // ),
        ],
      ),
    );
  }
}
