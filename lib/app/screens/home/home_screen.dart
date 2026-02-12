import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:olearis_test_task/app/screens/home/home_view_model.dart';
import 'package:olearis_test_task/app/screens/home/widgets/home_logo_widget.dart';

const double _logoMinHeight = 100.0;
const double _logoSideMargin = 30.0;
const double _logoVerticalMargin = 30.0;
const double _logoMaxWidth = 375.0;

const double _gridBottomPadding = 8.0;
const double _tileSpacing = 12.0;
const double _tileAspectRatio = 4.0;

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    required this.viewModel,
    super.key,
  });

  final HomeViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    final EdgeInsets viewPadding = MediaQuery.viewPaddingOf(context);

    final List<String> items = viewModel.items;

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Markup test'),
        leading: IconButton(
          onPressed: viewModel.onBackPressed,
          icon: const Icon(
            Icons.chevron_left_outlined,
            size: 32,
            color: Colors.white,
          ),
        ),
        actions: _buildAppBarActions(),
      ),
      body: Scrollbar(
        child: CustomScrollView(
          slivers: [
            SliverLayoutBuilder(
              builder: (BuildContext context, SliverConstraints constraints) {
                final double viewportHeight =
                    constraints.viewportMainAxisExtent - viewPadding.bottom;
                final double viewportWidth = constraints.crossAxisExtent;

                final double logoBlockHeight = 60 + _logoMinHeight;

                final double gridAvailableWidth =
                    viewportWidth - (2 * _tileSpacing);
                final double tileWidth =
                    (gridAvailableWidth - _tileSpacing) / 2;
                final double tileHeight = tileWidth / _tileAspectRatio;

                final int rows = (items.length / 2).ceil();

                final double gridHeight = items.isEmpty
                    ? 0.0
                    : (rows * tileHeight) +
                        math.max(0, rows - 1) * _tileSpacing;

                final double gridBlockHeight =
                    items.isEmpty ? 0.0 : (gridHeight + _gridBottomPadding);

                final double freeSpace = math.max(
                    0.0, viewportHeight - gridBlockHeight - logoBlockHeight);

                final double topSpace = freeSpace / 2;
                final double bottomSpace = freeSpace / 2;

                final double logoWidth = math.min(
                  _logoMaxWidth,
                  math.max(0.0, viewportWidth - (2 * _logoSideMargin)),
                );

                return SliverToBoxAdapter(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: viewportHeight,
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: topSpace),
                        _buildLogoWidget(
                          logoWidth: logoWidth,
                          logoHeight: _logoMinHeight,
                        ),
                        SizedBox(height: bottomSpace),
                        if (items.isNotEmpty)
                          Padding(
                            padding: const EdgeInsetsDirectional.only(
                              start: _tileSpacing,
                              end: _tileSpacing,
                              bottom: _gridBottomPadding,
                            ),
                            child: _buildGridWidget(items: items),
                          ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLogoWidget({
    required double logoWidth,
    required double logoHeight,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: _logoSideMargin,
        vertical: _logoVerticalMargin,
      ),
      child: SizedBox(
        width: logoWidth,
        height: logoHeight,
        child: const HomeLogoWidget(),
      ),
    );
  }

  Widget _buildGridWidget({
    required List<String> items,
  }) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: _tileSpacing,
        crossAxisSpacing: _tileSpacing,
        childAspectRatio: _tileAspectRatio,
      ),
      itemBuilder: (BuildContext _, int i) {
        return Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
          ),
          alignment: Alignment.center,
          child: Text(items[i], textAlign: TextAlign.center),
        );
      },
    );
  }

  List<Widget> _buildAppBarActions() {
    return <Widget>[
      IconButton(
        onPressed: viewModel.onRemoveItem,
        icon: const Icon(Icons.remove, size: 28, color: Colors.white),
      ),
      IconButton(
        onPressed: viewModel.onAddItem,
        icon: const Icon(Icons.add, size: 28, color: Colors.white),
      ),
    ];
  }
}
