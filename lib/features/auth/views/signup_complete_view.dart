import 'dart:async';
import 'package:flutter/material.dart';
import '../../../core/constants/app_theme.dart';
import '../../../app/routes.dart';

class SignupCompleteView extends StatefulWidget {
  const SignupCompleteView({super.key});

  @override
  State<SignupCompleteView> createState() => _SignupCompleteViewState();
}

class _SignupCompleteViewState extends State<SignupCompleteView> {
  int _remainingSeconds = 3;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingSeconds > 0) {
          _remainingSeconds--;
        } else {
          timer.cancel();
          if (mounted) {
            Navigator.of(context).pushReplacementNamed(Routes.login);
          }
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: DefaultTextStyle.merge(
          style: const TextStyle(
            fontSize: 15,
            color: Colors.black87,
            height: 1.5,
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  '회원가입이\n완료되었습니다!',
                  style: AppTheme.headlineMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                Text(
                  '$_remainingSeconds초 후 로그인 화면으로 이동합니다.',
                  style: AppTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () {
                    _timer?.cancel();
                    Navigator.of(context).pushReplacementNamed(Routes.login);
                  },
                  child: const Text('로그인 화면으로 이동'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
