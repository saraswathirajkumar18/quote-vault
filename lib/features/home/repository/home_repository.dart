import 'package:quote_vault/core/services/supabse_service.dart';
import 'package:quote_vault/features/home/model/qoute.dart';

class HomeRepository {
  final supabase = SupabaseService.client;

  /// Pagination (Home feed)
  Future<List<Quote>> fetchQuotes({
    int limit = 10,
    int offset = 0,
    String? category,
    String? keyword,
    String? author,
  }) async {
    var query = supabase.from('quotes').select();

    if (category != null && category != 'All') {
      query = query.eq('category', category);
    }

    if (keyword != null && keyword.isNotEmpty) {
      query = query.ilike('text', '%$keyword%');
    }

    if (author != null && author.isNotEmpty) {
      query = query.ilike('author', '%$author%');
    }

    final res = await query
        .order('created_at', ascending: false)
        .range(offset, offset + limit - 1);

    return (res as List).map((e) => Quote.fromJson(e)).toList();
  }

  /// Quote of the Day
  Future<Quote?> fetchQuoteOfTheDay() async {
    final res = await supabase
        .from('quotes')
        .select()
        .eq('is_featured', true)
        .limit(1)
        .single();

    return Quote.fromJson(res);
  }
}
