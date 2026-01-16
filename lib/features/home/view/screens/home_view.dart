import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quote_vault/core/section_title.dart';
import 'package:quote_vault/core/widgets/home_bottom_nav.dart';
import 'package:quote_vault/core/widgets/loading_widget.dart';
import 'package:quote_vault/features/home/view/widgets/category_chips.dart';
import 'package:quote_vault/features/home/view/widgets/discover_header.dart';
import 'package:quote_vault/features/home/view/widgets/qoute_of_day_card.dart';
import 'package:quote_vault/features/home/viewmodel/navigation_view_model%20.dart';
import '../../viewmodel/home_view_model.dart';
import '../widgets/quote_card.dart';


class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeViewModel()..loadQuotes(),
      child: const _HomeBody(),
    );
  }
}

class _HomeBody extends StatelessWidget {
  const _HomeBody();

  @override
  Widget build(BuildContext context) {
    final model = context.watch<HomeViewModel>();
  

    return Scaffold(
      backgroundColor: const Color(0xFF0F0B1E),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'QuoteVault',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none),
            onPressed: () {},
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: model.refreshQuotes,
        child: _buildContent(model),
      ),
      
    );
  }

  Widget _buildContent(HomeViewModel model) {
    if (model.isLoading && model.quotes.isEmpty) {
      return const LoadingWidget();
    }

    if (model.quotes.isEmpty) {
      return const Center(
        child: Text(
          'No quotes found',
          style: TextStyle(color: Colors.white70),
        ),
      );
    }

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const SectionTitle(title: 'Quote of the Day'),
        const SizedBox(height: 12),

        /// Quote of the Day (first item)
        QuoteOfDayCard(quote: model.quotes.first),

        const SizedBox(height: 20),
        const CategoryChips(),

        const SizedBox(height: 24),
        const DiscoverHeader(),

        const SizedBox(height: 12),

        /// Remaining quotes
        ...model.quotes.skip(1).map(
              (quote) => Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: QuoteCard(quote: quote),
              ),
            ),
      ],
    );
  }
}
