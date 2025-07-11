import 'package:ccw/constans/my_color.dart';
import 'package:ccw/constans/responsive_utiles.dart';
import 'package:ccw/models/pdf_item.dart';
import 'package:ccw/models/title_model.dart';
import 'package:ccw/repository/pdf_repository.dart';
import 'package:ccw/widgets/mobile/mobile_app_bar.dart';
import 'package:ccw/widgets/mobile/mobile_resources_container.dart';
import 'package:ccw/widgets/mobile/mobile_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';

class MrecourcesScreen extends StatefulWidget {
  const MrecourcesScreen({super.key});

  @override
  State<MrecourcesScreen> createState() => _MrecourcesScreenState();
}

class _MrecourcesScreenState extends State<MrecourcesScreen> {
  final PdfRepository pdfRepository = PdfRepository();
  String _searchQuery = '';
  List<PdfItem> _allPdfItems = [];
  List<PdfTitle> _allTitles = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    try {
      final titles = await pdfRepository.fetchTitles();
      List<PdfItem> allItems = [];

      for (var title in titles) {
        final items = await pdfRepository.fetchItemsByTitleId(title.id);
        allItems.addAll(items);
      }

      setState(() {
        _allTitles = titles;
        _allPdfItems = allItems;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  List<PdfItem> _getFilteredItems() {
    if (_searchQuery.isEmpty) {
      return _allPdfItems;
    }

    return _allPdfItems.where((item) {
      final query = _searchQuery.toLowerCase();
      return item.name.toLowerCase().contains(query) ||
          item.title.toLowerCase().contains(query);
    }).toList();
  }

  List<PdfTitle> _getFilteredTitles() {
    if (_searchQuery.isEmpty) {
      return _allTitles;
    }

    final filteredItems = _getFilteredItems();
    final titleIds = filteredItems.map((item) => item.title).toSet();

    return _allTitles
        .where((title) =>
            titleIds.contains(title.id) ||
            title.title.toLowerCase().contains(_searchQuery.toLowerCase()))
        .toList();
  }

  void _onSearchChanged(String query) {
    setState(() {
      _searchQuery = query;
    });
  }

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
                    'assets/images/recources.png',
                    fit: BoxFit.cover,
                    width:
                        ResponsiveMobileUtils.getResponsiveSize(context, 402),
                    height:
                        ResponsiveMobileUtils.getResponsiveSize(context, 377),
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
            // Search Bar
            MobileSearchBar(
              onSearchChanged: _onSearchChanged,
              width: ResponsiveMobileUtils.getResponsiveSize(context, 350),
              hintText: 'Search for PDFs, documents, or resources...',
            ),

            // Search Results Info
            if (_searchQuery.isNotEmpty)
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal:
                      ResponsiveMobileUtils.getResponsiveSize(context, 16),
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal:
                        ResponsiveMobileUtils.getResponsiveSize(context, 16),
                    vertical:
                        ResponsiveMobileUtils.getResponsiveSize(context, 10),
                  ),
                  decoration: BoxDecoration(
                    color: MyColor.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: MyColor.primary.withOpacity(0.3),
                      width: 1,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.search_rounded,
                        color: MyColor.primary,
                        size: ResponsiveMobileUtils.getResponsiveSize(
                            context, 16),
                      ),
                      SizedBox(
                          width: ResponsiveMobileUtils.getResponsiveSize(
                              context, 6)),
                      Expanded(
                        child: Text(
                          'Search results for "$_searchQuery"',
                          style: TextStyle(
                            color: MyColor.primary,
                            fontSize: ResponsiveMobileUtils.getResponsiveSize(
                                context, 12),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: ResponsiveMobileUtils.getResponsiveSize(
                              context, 6),
                          vertical: ResponsiveMobileUtils.getResponsiveSize(
                              context, 2),
                        ),
                        decoration: BoxDecoration(
                          color: MyColor.secendry.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          '${_getFilteredItems().length} found',
                          style: TextStyle(
                            color: MyColor.secendry,
                            fontSize: ResponsiveMobileUtils.getResponsiveSize(
                                context, 10),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ).animate().fade(duration: 300.ms).slideY(begin: -0.2, end: 0),
            SizedBox(
              height: ResponsiveMobileUtils.getResponsiveSize(context, 16),
            ),
            // Content
            if (_isLoading) ...[
              SizedBox(
                height: ResponsiveMobileUtils.getResponsiveSize(context, 96),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 12,
                  runSpacing: 12,
                  children: List.generate(6, (index) {
                    return Shimmer.fromColors(
                      baseColor: Colors.grey[800]!,
                      highlightColor: Colors.grey[600]!,
                      child: Container(
                        height: ResponsiveMobileUtils.getResponsiveSize(
                            context, 64),
                        width: ResponsiveMobileUtils.getResponsiveSize(
                            context, 371),
                        decoration: BoxDecoration(
                          color: Colors.grey[850],
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ] else if (_allPdfItems.isEmpty) ...[
              SizedBox(
                  height: ResponsiveMobileUtils.getResponsiveSize(context, 96)),
              Icon(
                Icons.error_outline_rounded,
                color: MyColor.grey,
                size: ResponsiveMobileUtils.getResponsiveSize(context, 64),
              ),
              SizedBox(
                  height: ResponsiveMobileUtils.getResponsiveSize(context, 16)),
              Text(
                'No PDFs available.',
                style: TextStyle(
                  color: MyColor.grey,
                  fontSize:
                      ResponsiveMobileUtils.getResponsiveSize(context, 18),
                ),
              ),
            ] else ...[
              Builder(
                builder: (context) {
                  final filteredTitles = _getFilteredTitles();
                  final filteredItems = _getFilteredItems();

                  if (filteredItems.isEmpty && _searchQuery.isNotEmpty) {
                    return Column(
                      children: [
                        SizedBox(
                            height: ResponsiveMobileUtils.getResponsiveSize(
                                context, 96)),
                        Icon(
                          Icons.search_off_rounded,
                          color: MyColor.grey,
                          size: ResponsiveMobileUtils.getResponsiveSize(
                              context, 64),
                        ),
                        SizedBox(
                            height: ResponsiveMobileUtils.getResponsiveSize(
                                context, 16)),
                        Text(
                          'No results found for "$_searchQuery"',
                          style: TextStyle(
                            color: MyColor.grey,
                            fontSize: ResponsiveMobileUtils.getResponsiveSize(
                                context, 18),
                          ),
                        ),
                        SizedBox(
                            height: ResponsiveMobileUtils.getResponsiveSize(
                                context, 8)),
                        Text(
                          'Try different keywords or browse all resources',
                          style: TextStyle(
                            color: MyColor.grey.withOpacity(0.7),
                            fontSize: ResponsiveMobileUtils.getResponsiveSize(
                                context, 14),
                          ),
                        ),
                      ],
                    );
                  } else {
                    return Column(
                      children: filteredTitles.map((title) {
                        final titleItems = filteredItems
                            .where((item) => item.title == title.id)
                            .toList();

                        if (titleItems.isEmpty) return SizedBox.shrink();

                        return Padding(
                          padding: EdgeInsets.only(
                            top: ResponsiveMobileUtils.getResponsiveSize(
                                context, 30),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
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
                              SizedBox(
                                  height:
                                      ResponsiveMobileUtils.getResponsiveSize(
                                          context, 32)),
                              Column(
                                spacing:
                                    ResponsiveMobileUtils.getResponsiveSize(
                                        context, 12),
                                children:
                                    titleItems.asMap().entries.map((entry) {
                                  final index = entry.key;
                                  final file = entry.value;

                                  return GestureDetector(
                                    onTap: () async {
                                      final Uri url = Uri.parse(file.link);
                                      if (!await launchUrl(url)) {
                                        WidgetsBinding.instance
                                            .addPostFrameCallback((_) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              behavior:
                                                  SnackBarBehavior.floating,
                                              content: Text('Connection Lost'),
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
                                            delay: (index * 200).ms)
                                        .slideX(
                                            begin: 0.3,
                                            end: 0,
                                            duration: 500.ms,
                                            curve: Curves.easeOut),
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    );
                  }
                },
              ),
            ],
            SizedBox(
              height: ResponsiveMobileUtils.getResponsiveSize(context, 25),
            ),
          ],
        ),
      ),
    );
  }
}
