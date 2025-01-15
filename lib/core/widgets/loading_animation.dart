import 'package:flutter/cupertino.dart';

class HoneyLoadingAnimation extends StatefulWidget {
  final bool isStationSelected;

  const HoneyLoadingAnimation({
    super.key,
    this.isStationSelected = false,
  });

  @override
  State<HoneyLoadingAnimation> createState() => _HoneyLoadingAnimationState();
}

class _HoneyLoadingAnimationState extends State<HoneyLoadingAnimation>
    with TickerProviderStateMixin {
  late final List<AnimationController> _honeyControllers;

  @override
  void initState() {
    super.initState();

    // 꿀벌 깜빡임 애니메이션 컨트롤러
    _honeyControllers = List.generate(
      3,
      (index) => AnimationController(
        duration: const Duration(milliseconds: 600), // 깜빡이는 시간
        vsync: this,
      ),
    );

    // 순차적으로 애니메이션 실행
    _startSequentialAnimations();
  }

  void _startSequentialAnimations() async {
    while (mounted) {
      for (int i = 0; i < _honeyControllers.length; i++) {
        _honeyControllers[i].forward(from: 0).then((_) {
          _honeyControllers[i].reverse();
        });
        await Future.delayed(const Duration(milliseconds: 700));
      }
    }
  }

  @override
  void dispose() {
    for (var controller in _honeyControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isStationSelected) {
      // 스테이션 선택된 경우 로직 유지
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/bannabee.png', // 꿀벌 이미지
            width: 40,
            height: 40,
          ),
          const SizedBox(width: 4),
          const Text('🍯'),
        ],
      );
    }

    // 순차적으로 깜빡이는 3마리 꿀벌
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        3,
        (index) => AnimatedBuilder(
          animation: _honeyControllers[index],
          builder: (context, child) {
            return Opacity(
              opacity: _honeyControllers[index].value,
              child: child,
            );
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Image.asset(
              'assets/images/bannabee.png', // 꿀벌 이미지
              width: 40, // 크기 조정 가능
              height: 40, // 크기 조정 가능
            ),
          ),
        ),
      ),
    );
  }
}
