import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_theme.dart';
import '../../../app/routes.dart';

class TermsView extends StatefulWidget {
  const TermsView({super.key});

  @override
  State<TermsView> createState() => _TermsViewState();
}

class _TermsViewState extends State<TermsView> {
  bool _isAllAgreed = false;
  bool _isServiceAgreed = false;
  bool _isPrivacyAgreed = false;
  bool _isMarketingAgreed = false;

  void _updateAllAgreed() {
    setState(() {
      _isAllAgreed = _isServiceAgreed && _isPrivacyAgreed;
    });
  }

  void _onAllAgreeChanged(bool? value) {
    if (value == null) return;
    setState(() {
      _isServiceAgreed = value;
      _isPrivacyAgreed = value;
      _isMarketingAgreed = value;
      _isAllAgreed = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('이용약관'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: DefaultTextStyle.merge(
          style: const TextStyle(
            fontSize: 15,
            color: Colors.black87,
            height: 1.5,
          ),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 32),
                const Text(
                  '서비스 이용을 위해\n약관에 동의해주세요.',
                  style: AppTheme.headlineMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 48),
                _buildCheckbox(
                  '전체 동의',
                  _isAllAgreed,
                  _onAllAgreeChanged,
                  isTitle: true,
                ),
                const SizedBox(height: 16),
                Container(
                  height: 1,
                  color: AppColors.lightGrey,
                ),
                const SizedBox(height: 16),
                _buildCheckbox(
                  '[필수] 서비스 이용약관',
                  _isServiceAgreed,
                  (value) {
                    if (value == null) return;
                    setState(() {
                      _isServiceAgreed = value;
                      _updateAllAgreed();
                    });
                  },
                ),
                const SizedBox(height: 16),
                _buildCheckbox(
                  '[필수] 개인정보 처리방침',
                  _isPrivacyAgreed,
                  (value) {
                    if (value == null) return;
                    setState(() {
                      _isPrivacyAgreed = value;
                      _updateAllAgreed();
                    });
                  },
                ),
                const SizedBox(height: 16),
                _buildCheckbox(
                  '[선택] 마케팅 정보 수신 동의',
                  _isMarketingAgreed,
                  (value) {
                    if (value == null) return;
                    setState(() {
                      _isMarketingAgreed = value;
                    });
                  },
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: _isAllAgreed
                      ? () {
                          Navigator.of(context).pushNamed(Routes.signup);
                        }
                      : null,
                  child: const Text('다음'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCheckbox(
    String label,
    bool value,
    ValueChanged<bool?> onChanged, {
    bool isTitle = false,
  }) {
    return Row(
      children: [
        IconButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            onChanged(!value);
          },
          icon: Icon(
            value ? Icons.check_box : Icons.check_box_outline_blank,
            color: value ? AppColors.primary : AppColors.grey,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            label,
            style: isTitle ? AppTheme.titleMedium : AppTheme.bodyMedium,
          ),
        ),
        if (!isTitle)
          TextButton(
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
            ),
            onPressed: () {
              // TODO: 약관 상세 페이지로 이동
            },
            child: const Text('보기'),
          ),
      ],
    );
  }
}
