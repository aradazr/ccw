import 'package:ccw/constans/my_color.dart';
import 'package:ccw/constans/responsive_utiles.dart';
import 'package:ccw/models/pdf_item.dart';
import 'package:ccw/models/title_model.dart';
import 'package:ccw/repository/pdf_repository.dart';
import 'package:ccw/widgets/desktop/app_bar.dart';
import 'package:ccw/widgets/desktop/footer.dart';
import 'package:ccw/widgets/desktop/resources_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';

class DresourcesScreen extends StatelessWidget {
  DresourcesScreen({super.key});
  final PdfRepository pdfRepository = PdfRepository();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: MyColor.backGround,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: ResponsiveDesktopUtils.getResponsiveSize(context, 583),
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Image.asset(
                    'assets/images/recources.png',
                    height:
                        ResponsiveDesktopUtils.getResponsiveSize(context, 583),
                    width:
                        ResponsiveDesktopUtils.getResponsiveSize(context, 1440),
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: 0,
                    child: MyAppbar(
                      size: size,
                      homeStyle: TextStyle(
                          fontSize: size.width / 90,
                          color: MyColor.white,
                          fontWeight: FontWeight.w200),
                      aboutStyle: TextStyle(
                          fontSize: size.width / 90,
                          color: MyColor.white,
                          fontWeight: FontWeight.w200),
                      servicesStyle: TextStyle(
                          fontSize: size.width / 90,
                          color: MyColor.white,
                          fontWeight: FontWeight.w200),
                      resourcesStyle: TextStyle(
                          decoration: TextDecoration.underline,
                          decorationThickness: 1,
                          decorationColor: MyColor.primary,
                          fontSize: size.width / 90,
                          color: MyColor.primary,
                          fontWeight: FontWeight.w200),
                      contactStyle: TextStyle(
                          fontSize: size.width / 90,
                          color: MyColor.white,
                          fontWeight: FontWeight.w200),
                    ),
                  ),
                  Positioned(
                    top: ResponsiveDesktopUtils.getResponsiveSize(context, 230),
                    child: Column(
                      spacing:
                          ResponsiveDesktopUtils.getResponsiveSize(context, 16),
                      children: [
                        Text(
                          'Resources',
                          style: TextStyle(
                              fontSize:
                                  ResponsiveDesktopUtils.getResponsiveSize(
                                      context, 48),
                              color: MyColor.white,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: ResponsiveDesktopUtils.getResponsiveSize(
                              context, 555),
                          child: Text(
                            textAlign: TextAlign.center,
                            'Find the information you need with our comprehensive resources for individuals and businesses.',
                            style: TextStyle(
                                fontSize:
                                    ResponsiveDesktopUtils.getResponsiveSize(
                                        context, 24),
                                color: MyColor.white,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: ResponsiveDesktopUtils.getResponsiveSize(context, 103),
            ),
            Column(
              spacing: ResponsiveDesktopUtils.getResponsiveSize(context, 16),
              children: [
                Text(
                  'Accounting and Business Resources Online',
                  style: TextStyle(
                      fontSize:
                          ResponsiveDesktopUtils.getResponsiveSize(context, 36),
                      color: MyColor.secendry,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: ResponsiveDesktopUtils.getResponsiveSize(context, 769),
                  child: Text(
                    textAlign: TextAlign.center,
                    'Have questions? Our professional accountants and business advisors are here to assist you.',
                    style: TextStyle(
                        fontSize: ResponsiveDesktopUtils.getResponsiveSize(
                            context, 24),
                        color: MyColor.white,
                        fontWeight: FontWeight.normal),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: ResponsiveDesktopUtils.getResponsiveSize(context, 1),
            ),
            FutureBuilder(
              future: pdfRepository.fetchTitles(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Column(
                    children: [
                      SizedBox(
                        height: ResponsiveDesktopUtils.getResponsiveSize(
                            context, 96),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          spacing: 12,
                          runSpacing: 12,
                          children: List.generate(6, (index) {
                            return Shimmer.fromColors(
                              baseColor: Colors
                                  .grey[800]!, // تیره برای پس‌زمینه‌ی تیره
                              highlightColor:
                                  Colors.grey[600]!, // روشن‌تر ولی نه سفید
                              child: Container(
                                height:
                                    ResponsiveDesktopUtils.getResponsiveSize(
                                        context, 64),
                                width: ResponsiveDesktopUtils.getResponsiveSize(
                                    context, 371),
                                decoration: BoxDecoration(
                                  color: Colors
                                      .grey[850], // رنگ بک‌گراند داخل شِیمر
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                    ],
                  );
                } else if (snapshot.hasError) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        behavior: SnackBarBehavior.floating,
                        content: Text('Connection Lost'),
                        backgroundColor: Colors.red,
                      ),
                    );
                  });
                  return SizedBox();
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('No PDFs available.'));
                } else {
                  List<PdfTitle> titles = snapshot.data!;
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: titles.length,
                    itemBuilder: (context, index) {
                      PdfTitle title = titles[index];
                      return Padding(
                        padding: EdgeInsets.only(
                          top: ResponsiveDesktopUtils.getResponsiveSize(
                              context, 96),
                        ),
                        child: Column(
                          spacing: ResponsiveDesktopUtils.getResponsiveSize(
                              context, 32),
                          children: [
                            Text(
                              title.title,
                              style: TextStyle(
                                fontSize:
                                    ResponsiveDesktopUtils.getResponsiveSize(
                                        context, 32),
                                color: MyColor.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            FutureBuilder(
                              future:
                                  pdfRepository.fetchItemsByTitleId(title.id),
                              builder: (context, fileSnapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Wrap(
                                      spacing: 12,
                                      runSpacing: 12,
                                      children:
                                          List.generate(titles.length, (index) {
                                        return Shimmer.fromColors(
                                          baseColor: Colors.grey[
                                              800]!, // تیره برای پس‌زمینه‌ی تیره
                                          highlightColor: Colors.grey[
                                              600]!, // روشن‌تر ولی نه سفید
                                          child: Container(
                                            height: ResponsiveDesktopUtils
                                                .getResponsiveSize(context, 64),
                                            width: ResponsiveDesktopUtils
                                                .getResponsiveSize(
                                                    context, 371),
                                            decoration: BoxDecoration(
                                              color: Colors.grey[
                                                  850], // رنگ بک‌گراند داخل شِیمر
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                          ),
                                        );
                                      }),
                                    ),
                                  );
                                } else if (fileSnapshot.hasError) {
                                  WidgetsBinding.instance
                                      .addPostFrameCallback((_) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        behavior: SnackBarBehavior.floating,
                                        content: Text('Connection Lost'),
                                        backgroundColor: Colors.red,
                                      ),
                                    );
                                  });
                                  return SizedBox(); // یا هر ویجت خالی دیگر
                                } else if (!fileSnapshot.hasData ||
                                    fileSnapshot.data!.isEmpty) {
                                  return Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Wrap(
                                      alignment: WrapAlignment.center,
                                      spacing: 12,
                                      runSpacing: 12,
                                      children: List.generate(9, (index) {
                                        return Shimmer.fromColors(
                                          baseColor: Colors.grey[
                                              800]!, // تیره برای پس‌زمینه‌ی تیره
                                          highlightColor: Colors.grey[
                                              600]!, // روشن‌تر ولی نه سفید
                                          child: Container(
                                            height: ResponsiveDesktopUtils
                                                .getResponsiveSize(context, 64),
                                            width: ResponsiveDesktopUtils
                                                .getResponsiveSize(
                                                    context, 371),
                                            decoration: BoxDecoration(
                                              color: Colors.grey[
                                                  850], // رنگ بک‌گراند داخل شِیمر
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                          ),
                                        );
                                      }),
                                    ),
                                  );
                                } else {
                                  List<PdfItem> files = fileSnapshot.data!;
                                  return Wrap(
                                    alignment: WrapAlignment.center,
                                    spacing: ResponsiveDesktopUtils
                                        .getResponsiveSize(context, 24),
                                    runSpacing: ResponsiveDesktopUtils
                                        .getResponsiveSize(context, 24),
                                    children:
                                        files.asMap().entries.map((entry) {
                                      final index = entry.key;
                                      final file = entry.value;

                                      return GestureDetector(
                                         onTap: () async {
                                          final Uri url = Uri.parse(
                                              file.link);
                                          if (!await launchUrl(url)) {
                                               WidgetsBinding.instance
                                                .addPostFrameCallback((_) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  behavior:
                                                      SnackBarBehavior.floating,
                                                  content:
                                                      Text('Connection Lost'),
                                                  backgroundColor: Colors.red,
                                                ),
                                              );
                                            });
                                          }
                                        },
                                        child: ResourcesContainer(file: file)
                                            .animate()
                                            .fade(
                                                duration: 400.ms,
                                                delay: (index * 300).ms)
                                            .slideX(
                                                begin: 0.3,
                                                end: 0,
                                                duration: 500.ms,
                                                curve: Curves.easeOut),
                                      );
                                    }).toList(),
                                  );
                                }
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }
              },
            ),
            SizedBox(
              height: ResponsiveDesktopUtils.getResponsiveSize(context, 96),
            ),
            Footer(size: size)
          ],
        ),
      ),
    );
  }


}


