import 'package:flutter/material.dart';
import '../data/services/quote_service.dart';

class QuoteCard extends StatefulWidget {
  const QuoteCard({super.key});

  @override
  State<QuoteCard> createState() => _QuoteCardState();
}

class _QuoteCardState extends State<QuoteCard> {
  String _quote = 'Loading motivational quote...';
  bool _isError = false;

  @override
  void initState() {
    super.initState();
    _loadQuote();
  }

  Future<void> _loadQuote() async {
    try {
      final quote = await QuoteService.fetchMotivationalQuote();
      setState(() {
        _quote = quote;
      });
    } catch (e) {
      setState(() {
        _quote = '⚠️ Could not fetch quote. Try again later.';
        _isError = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          _quote,
          style: TextStyle(
            fontStyle: FontStyle.italic,
            color: _isError ? Colors.red : Colors.black87,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
