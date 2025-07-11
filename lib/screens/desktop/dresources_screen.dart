import 'package:ccw/constans/my_color.dart';
import 'package:ccw/constans/responsive_utiles.dart';
import 'package:ccw/models/pdf_item.dart';
import 'package:ccw/models/title_model.dart';
import 'package:ccw/repository/pdf_repository.dart';
import 'package:ccw/widgets/desktop/app_bar.dart';
import 'package:ccw/widgets/desktop/footer.dart';
import 'package:ccw/widgets/desktop/resources_container.dart';
import 'package:ccw/widgets/desktop/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';

class DresourcesScreen extends StatefulWidget {
  const DresourcesScreen({super.key});

  @override
  State<DresourcesScreen> createState() => _DresourcesScreenState();
}

class _DresourcesScreenState extends State<DresourcesScreen> {
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
              height: ResponsiveDesktopUtils.getResponsiveSize(context, 48),
            ),
            // Search Bar
            ModernSearchBar(
              onSearchChanged: _onSearchChanged,
              width: ResponsiveDesktopUtils.getResponsiveSize(context, 600),
              hintText: 'Search for PDFs, documents, or resources...',
            ),
            SizedBox(
              height: ResponsiveDesktopUtils.getResponsiveSize(context, 48),
            ),
            // Search Results Info
            if (_searchQuery.isNotEmpty)
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal:
                      ResponsiveDesktopUtils.getResponsiveSize(context, 24),
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal:
                        ResponsiveDesktopUtils.getResponsiveSize(context, 20),
                    vertical:
                        ResponsiveDesktopUtils.getResponsiveSize(context, 12),
                  ),
                  decoration: BoxDecoration(
                    color: MyColor.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
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
                        size: ResponsiveDesktopUtils.getResponsiveSize(
                            context, 20),
                      ),
                      SizedBox(
                          width: ResponsiveDesktopUtils.getResponsiveSize(
                              context, 8)),
                      Text(
                        'Search results for "$_searchQuery"',
                        style: TextStyle(
                          color: MyColor.primary,
                          fontSize: ResponsiveDesktopUtils.getResponsiveSize(
                              context, 16),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                          width: ResponsiveDesktopUtils.getResponsiveSize(
                              context, 8)),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: ResponsiveDesktopUtils.getResponsiveSize(
                              context, 8),
                          vertical: ResponsiveDesktopUtils.getResponsiveSize(
                              context, 4),
                        ),
                        decoration: BoxDecoration(
                          color: MyColor.secendry.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          '${_getFilteredItems().length} found',
                          style: TextStyle(
                            color: MyColor.secendry,
                            fontSize: ResponsiveDesktopUtils.getResponsiveSize(
                                context, 12),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ).animate().fade(duration: 300.ms).slideY(begin: -0.2, end: 0),
            SizedBox(
              height: ResponsiveDesktopUtils.getResponsiveSize(context, 24),
            ),
            // Content
            if (_isLoading) ...[
              SizedBox(
                height: ResponsiveDesktopUtils.getResponsiveSize(context, 96),
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
                        height: ResponsiveDesktopUtils.getResponsiveSize(
                            context, 64),
                        width: ResponsiveDesktopUtils.getResponsiveSize(
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
                  height:
                      ResponsiveDesktopUtils.getResponsiveSize(context, 96)),
              Icon(
                Icons.error_outline_rounded,
                color: MyColor.grey,
                size: ResponsiveDesktopUtils.getResponsiveSize(context, 64),
              ),
              SizedBox(
                  height:
                      ResponsiveDesktopUtils.getResponsiveSize(context, 16)),
              Text(
                'No PDFs available.',
                style: TextStyle(
                  color: MyColor.grey,
                  fontSize:
                      ResponsiveDesktopUtils.getResponsiveSize(context, 18),
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
                            height: ResponsiveDesktopUtils.getResponsiveSize(
                                context, 96)),
                        Icon(
                          Icons.search_off_rounded,
                          color: MyColor.grey,
                          size: ResponsiveDesktopUtils.getResponsiveSize(
                              context, 64),
                        ),
                        SizedBox(
                            height: ResponsiveDesktopUtils.getResponsiveSize(
                                context, 16)),
                        Text(
                          'No results found for "$_searchQuery"',
                          style: TextStyle(
                            color: MyColor.grey,
                            fontSize: ResponsiveDesktopUtils.getResponsiveSize(
                                context, 18),
                          ),
                        ),
                        SizedBox(
                            height: ResponsiveDesktopUtils.getResponsiveSize(
                                context, 8)),
                        Text(
                          'Try different keywords or browse all resources',
                          style: TextStyle(
                            color: MyColor.grey.withOpacity(0.7),
                            fontSize: ResponsiveDesktopUtils.getResponsiveSize(
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
                            top: ResponsiveDesktopUtils.getResponsiveSize(
                                context, 96),
                          ),
                          child: Column(
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
                              SizedBox(
                                  height:
                                      ResponsiveDesktopUtils.getResponsiveSize(
                                          context, 32)),
                              Wrap(
                                alignment: WrapAlignment.center,
                                spacing:
                                    ResponsiveDesktopUtils.getResponsiveSize(
                                        context, 24),
                                runSpacing:
                                    ResponsiveDesktopUtils.getResponsiveSize(
                                        context, 24),
                                children:
                                    titleItems.asMap().entries.map((entry) {
                                  final itemIndex = entry.key;
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
                                    child: ResourcesContainer(file: file)
                                        .animate()
                                        .fade(
                                            duration: 400.ms,
                                            delay: (itemIndex * 200).ms)
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
              height: ResponsiveDesktopUtils.getResponsiveSize(context, 96),
            ),
            Footer(size: size)
          ],
        ),
      ),
    );
  }
}
