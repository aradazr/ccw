import 'package:flutter/material.dart';
import 'package:ccw/constans/my_color.dart';
import 'package:ccw/constans/responsive_utiles.dart';

class ModernSearchBar extends StatefulWidget {
  final Function(String) onSearchChanged;
  final String hintText;
  final double width;

  const ModernSearchBar({
    super.key,
    required this.onSearchChanged,
    this.hintText = 'Search resources...',
    required this.width,
  });

  @override
  State<ModernSearchBar> createState() => _ModernSearchBarState();
}

class _ModernSearchBarState extends State<ModernSearchBar>
    with SingleTickerProviderStateMixin {
  late TextEditingController _controller;
  late FocusNode _focusNode;
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _focusNode = FocusNode();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.02).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        _animationController.forward();
        setState(() {
          _isFocused = true;
        });
      } else {
        _animationController.reverse();
        setState(() {
          _isFocused = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _scaleAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: Container(
            width: widget.width,
            height: ResponsiveDesktopUtils.getResponsiveSize(context, 56),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: LinearGradient(
                colors: _isFocused
                    ? [
                        MyColor.primary.withOpacity(0.1),
                        MyColor.secendry.withOpacity(0.05)
                      ]
                    : [MyColor.cartColor, MyColor.hoverCartColor],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              border: Border.all(
                color: _isFocused ? MyColor.primary : Colors.transparent,
                width: 2,
              ),
              boxShadow: _isFocused
                  ? [
                      BoxShadow(
                        color: MyColor.primary.withOpacity(0.3),
                        blurRadius: 12,
                        spreadRadius: 2,
                      ),
                    ]
                  : [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
            ),
            child: TextField(
              controller: _controller,
              focusNode: _focusNode,
              onChanged: widget.onSearchChanged,
              style: TextStyle(
                color: MyColor.white,
                fontSize: ResponsiveDesktopUtils.getResponsiveSize(context, 16),
                fontWeight: FontWeight.w400,
              ),
              decoration: InputDecoration(
                hintText: widget.hintText,
                hintStyle: TextStyle(
                  color: MyColor.grey.withOpacity(0.7),
                  fontSize:
                      ResponsiveDesktopUtils.getResponsiveSize(context, 16),
                  fontWeight: FontWeight.w400,
                ),
                prefixIcon: Icon(
                  Icons.search_rounded,
                  color: _isFocused ? MyColor.primary : MyColor.grey,
                  size: ResponsiveDesktopUtils.getResponsiveSize(context, 24),
                ),
                suffixIcon: _controller.text.isNotEmpty
                    ? IconButton(
                        onPressed: () {
                          _controller.clear();
                          widget.onSearchChanged('');
                        },
                        icon: Icon(
                          Icons.close_rounded,
                          color: MyColor.grey,
                          size: ResponsiveDesktopUtils.getResponsiveSize(
                              context, 20),
                        ),
                      )
                    : null,
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(
                  horizontal:
                      ResponsiveDesktopUtils.getResponsiveSize(context, 20),
                  vertical:
                      ResponsiveDesktopUtils.getResponsiveSize(context, 16),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
