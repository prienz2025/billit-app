import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/widgets/loading_animation.dart';
import '../viewmodels/notice_list_viewmodel.dart';

class NoticeListView extends StatelessWidget {
  const NoticeListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NoticeListViewModel(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('공지사항'),
        ),
        body: SafeArea(
          child: Consumer<NoticeListViewModel>(
            builder: (context, viewModel, child) {
              if (viewModel.isLoading) {
                return const Center(
                  child: HoneyLoadingAnimation(
                    isStationSelected: false,
                  ),
                );
              }

              if (viewModel.error != null) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        viewModel.error!,
                        style: const TextStyle(color: AppColors.error),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: viewModel.loadNotices,
                        child: const Text('다시 시도'),
                      ),
                    ],
                  ),
                );
              }

              if (viewModel.notices.isEmpty) {
                return const Center(
                  child: Text('공지사항이 없습니다.'),
                );
              }

              return ListView.separated(
                padding: const EdgeInsets.all(16),
                itemCount: viewModel.notices.length,
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (context, index) {
                  final notice = viewModel.notices[index];
                  return InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text(notice.title),
                          content: Text(notice.content),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('닫기'),
                            ),
                          ],
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            notice.title,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            notice.createdAt.toString().split(' ')[0],
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
