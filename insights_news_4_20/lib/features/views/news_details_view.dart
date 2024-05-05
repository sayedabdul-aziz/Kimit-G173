import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:insights_news_4_20/core/utils/colors.dart';
import 'package:insights_news_4_20/core/utils/styles.dart';
import 'package:insights_news_4_20/core/widgets/custom_btn.dart';
import 'package:insights_news_4_20/features/model/news_model/article.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetailsView extends StatelessWidget {
  const NewsDetailsView({super.key, required this.article});

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: AppColors.white,
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: CustomButton(
          text: 'Read More',
          bgColor: AppColors.primary,
          fgColor: AppColors.background,
          onPressed: () async {
            // parsing to Uri
            // launch url

            var url = Uri.parse(article.url ?? '');
            await launchUrl(url);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(article.urlToImage ?? ''),
            ),
            const Gap(15),
            Text(article.title ?? '',
                style: getBodyStyle(color: AppColors.white)),
            const Gap(15),
            Row(
              children: [
                Text(article.author ?? '',
                    style: getBodyStyle(color: AppColors.primary)),
                const Spacer(),
                Text(article.publishedAt?.split('T').first ?? '',
                    style: getBodyStyle(color: AppColors.grey)),
              ],
            ),
            const Gap(15),
            Text(article.description ?? '',
                style: getSmallStyle(color: AppColors.grey)),
            const Gap(15),
          ],
        ),
      ),
    );
  }
}
