import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_theme.dart';
import '../../../data/models/notice.dart';

class NoticeDetailView extends StatelessWidget {
  final Notice notice;

  const NoticeDetailView({
    super.key,
    required this.notice,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('공지사항'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                notice.title,
                style: AppTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              Text(
                notice.createdAt.toString().split(' ')[0],
                style: AppTheme.bodySmall.copyWith(
                  color: AppColors.grey,
                ),
              ),
              const SizedBox(height: 16),
              const Divider(),
              const SizedBox(height: 16),
              Text(
                notice.content,
                style: AppTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
