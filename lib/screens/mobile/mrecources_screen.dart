import 'package:ccw/constans/my_color.dart';
import 'package:ccw/constans/responsive_utiles.dart';
import 'package:ccw/models/pdf_item.dart';
import 'package:ccw/models/title_model.dart';
import 'package:ccw/repository/pdf_repository.dart';
import 'package:ccw/widgets/mobile/mobile_app_bar.dart';
import 'package:ccw/widgets/mobile/mobile_resources_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../widgets/desktop/resources_container.dart';

class MrecourcesScreen extends StatelessWidget {
   MrecourcesScreen({super.key});
    final PdfRepository pdfRepository = PdfRepository();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.backGround,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: ResponsiveMobileUtils.getResponsiveSize(context, 554),
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Image.asset(
                    'assets/images/mobileResources.png',
                    fit: BoxFit.cover,
                    width:
                        ResponsiveMobileUtils.getResponsiveSize(context, 402),
                    height:
                        ResponsiveMobileUtils.getResponsiveSize(context, 377),
                  ),
                  Positioned(
                    top: -ResponsiveMobileUtils.getResponsiveSize(context, 400),
                    child: Image.asset(
                      'assets/images/greenBlur2.png',
                      height: ResponsiveMobileUtils.getResponsiveSize(
                          context, 1000),
                      width: ResponsiveMobileUtils.getResponsiveSize(
                          context, 1200),
                      fit: BoxFit.cover,
                    ),
                  ),
                  MobileAppBar(),
                  Positioned(
                    top: ResponsiveMobileUtils.getResponsiveSize(context, 168),
                    child: Text(
                      'Resources',
                      style: TextStyle(
                        fontSize: ResponsiveMobileUtils.getResponsiveSize(
                            context, 20),
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Positioned(
                    top: ResponsiveMobileUtils.getResponsiveSize(context, 207),
                    child: SizedBox(
                      width:
                          ResponsiveMobileUtils.getResponsiveSize(context, 359),
                      child: Text(
                        textAlign: TextAlign.center,
                        'Helping businesses and individuals streamline accounting, optimize tax strategies, and stay compliant.',
                        style: TextStyle(
                          fontSize: ResponsiveMobileUtils.getResponsiveSize(
                              context, 14),
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: ResponsiveMobileUtils.getResponsiveSize(context, 450),
                    child: Column(
                      spacing:
                          ResponsiveMobileUtils.getResponsiveSize(context, 4),
                      children: [
                        SizedBox(
                          width: ResponsiveMobileUtils.getResponsiveSize(
                              context, 300),
                          child: Text(
                            textAlign: TextAlign.center,
                            'Accounting and Business Resources Online',
                            style: TextStyle(
                              fontSize: ResponsiveMobileUtils.getResponsiveSize(
                                  context, 24),
                              fontWeight: FontWeight.bold,
                              color: MyColor.secendry,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: ResponsiveMobileUtils.getResponsiveSize(
                              context, 347),
                          child: Text(
                            textAlign: TextAlign.center,
                            'Have questions? Our professional accountants and business advisors are here to assist you.',
                            style: TextStyle(
                              fontSize: ResponsiveMobileUtils.getResponsiveSize(
                                  context, 12),
                              fontWeight: FontWeight.normal,
                              color: MyColor.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: ResponsiveMobileUtils.getResponsiveSize(context, 32),
            ),
            //! logic and api
            FutureBuilder(
              future: pdfRepository.fetchTitles(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Column(
                    children: [
                      SizedBox(
                        height: ResponsiveMobileUtils.getResponsiveSize(
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
                                    ResponsiveMobileUtils.getResponsiveSize(
                                        context, 64),
                                width: ResponsiveMobileUtils.getResponsiveSize(
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
                          top: ResponsiveMobileUtils.getResponsiveSize(
                              context, 96),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          spacing: ResponsiveMobileUtils.getResponsiveSize(
                              context, 32),
                          children: [
                            Text(
                              title.title,
                              style: TextStyle(
                                fontSize:
                                    ResponsiveMobileUtils.getResponsiveSize(
                                        context, 24),
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
                                            height: ResponsiveMobileUtils
                                                .getResponsiveSize(context, 64),
                                            width: ResponsiveMobileUtils
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
                                } 
                                
                                //? if we have error
                                else if (fileSnapshot.hasError) {
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
                                } 
                                //? if we dont have data
                                else if (!fileSnapshot.hasData ||
                                    fileSnapshot.data!.isEmpty) {
                                  return Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Wrap(
                                      alignment: WrapAlignment.center,
                                      spacing: ResponsiveMobileUtils.getResponsiveSize(context, 12),
                                      runSpacing: ResponsiveMobileUtils.getResponsiveSize(context, 12),
                                      children: List.generate(9, (index) {
                                        return Shimmer.fromColors(
                                          baseColor: Colors.grey[
                                              800]!, // تیره برای پس‌زمینه‌ی تیره
                                          highlightColor: Colors.grey[
                                              600]!, // روشن‌تر ولی نه سفید
                                          child: Container(
                                            height: ResponsiveMobileUtils
                                                .getResponsiveSize(context, 64),
                                            width: ResponsiveMobileUtils
                                                .getResponsiveSize(
                                                    context, 371),
                                            decoration: BoxDecoration(
                                              color: Colors.grey[
                                                  850], // رنگ بک‌گراند داخل شِیمر
                                              borderRadius:
                                                  BorderRadius.circular(ResponsiveMobileUtils.getResponsiveSize(context, 8)),
                                            ),
                                          ),
                                        );
                                      }),
                                    ),
                                  );
                                } 
                                //? if the data is not empty
                                else {
                                  List<PdfItem> files = fileSnapshot.data!;
                                  return Column(
                                    spacing: ResponsiveMobileUtils.getResponsiveSize(context, 12),
                                    children:
                                        files.asMap().entries.map((entry) {
                                      final index = entry.key;
                                      final file = entry.value;

                                      return GestureDetector(
                                        onTap: () async {
                                          final Uri url = Uri.parse(file.file);
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
                                        child: MobileResourcesContainer(file: file)
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
          ],
        ),
      ),
    );
  }
}
