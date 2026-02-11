import 'package:flutter/material.dart';
import 'package:olearis_test_task/app/screens/home/home_view_model.dart';
import 'package:olearis_test_task/app/screens/home/widgets/home_logo_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({required this.viewModel, super.key});

  final HomeViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.sizeOf(context);
    final EdgeInsets viewPadding = MediaQuery.viewPaddingOf(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('Markup test'),
        leading: IconButton(
          onPressed: viewModel.onBackPressed,
          icon: Icon(
            size: 32,
            Icons.chevron_left_outlined,
            color: Colors.white,
          ),
        ),
        actions: _buildAppBarActions(),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: screenSize.height - kToolbarHeight,
            ),
            child: Column(
              children: [
                const Spacer(),
                const HomeLogoWidget(),
                const Spacer(),
                if (viewModel.items.isNotEmpty)
                  GridView.builder(
                    shrinkWrap: true,
                    itemCount: viewModel.items.length,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsetsDirectional.only(
                      start: 16,
                      end: 16,
                      bottom: viewPadding.bottom + 24,
                    ),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 16,
                      childAspectRatio: 4,
                      crossAxisSpacing: 16,
                    ),
                    itemBuilder: (_, int index) {
                      return Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                          ),
                        ),
                        alignment: AlignmentDirectional.center,
                        child: Text(
                          viewModel.items[index],
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                      );
                    },
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildAppBarActions() {
    return [
      IconButton(
        onPressed: viewModel.onRemoveItem,
        icon: Icon(
          size: 28,
          Icons.remove,
          color: Colors.white,
        ),
      ),
      IconButton(
        onPressed: viewModel.onAddItem,
        icon: Icon(
          size: 28,
          Icons.add,
          color: Colors.white,
        ),
      ),
    ];
  }
}
