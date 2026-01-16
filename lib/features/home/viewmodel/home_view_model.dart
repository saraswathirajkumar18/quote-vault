import 'package:flutter/material.dart';
import 'package:quote_vault/features/home/model/qoute.dart';
import 'package:quote_vault/features/home/repository/home_repository.dart';

class HomeViewModel extends ChangeNotifier {
  final HomeRepository _repo = HomeRepository();

  List<Quote> quotes = [];
  bool isLoading = false;
  bool hasMore = true;

  int _page = 0;
  final int _limit = 10;

  Future<void> loadQuotes({String? category}) async {
    if (isLoading || !hasMore) return;

    isLoading = true;
    notifyListeners();

    final newQuotes = await _repo.fetchQuotes(
      limit: _limit,
      offset: _page * _limit,
      category: category,
    );

    if (newQuotes.isEmpty) {
      hasMore = false;
    } else {
      quotes.addAll(newQuotes);
      _page++;
    }

    isLoading = false;
    notifyListeners();
  }

  Future<void> refreshQuotes() async {
    quotes.clear();
    _page = 0;
    hasMore = true;
    await loadQuotes();
  }
}
