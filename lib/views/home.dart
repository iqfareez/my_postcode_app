import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../database/app_database.dart';
import '../database/db.dart';
import 'components/search_bar_widget.dart';
import 'components/state_list_fragment.dart';

enum UiState { ready, haveResults, noResults }

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  List<PostcodeItem> _results = [];
  bool _isLoading = false;
  UiState _uiState = UiState.ready;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Text(
          'Malaysia Postcode',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        children: [
          SearchBarWidget(onSearch: (String searchText) {
            _performSearch(searchText);
          }),
          Expanded(
              child: _uiState == UiState.ready
                  ? StateListFragment()
                  : _buildResultsList()),
          Gap(25),
        ],
      ),
    );
  }

  Widget _buildResultsList() {
    if (_isLoading) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(color: Color(0xFFDC143C)),
            SizedBox(height: 20),
            Text('Searching...', style: TextStyle(color: Colors.grey[600])),
          ],
        ),
      );
    }

    if (_uiState == UiState.noResults) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.search_off, size: 64, color: Colors.grey[400]),
            SizedBox(height: 20),
            Text(
              'No results found',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[600],
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Try searching with different keywords',
              style: TextStyle(color: Colors.grey[500]),
            ),
          ],
        ),
      );
    }

    if (_results.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.location_searching, size: 64, color: Colors.grey[400]),
            SizedBox(height: 20),
            Text(
              'Start your search',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[600],
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Enter an area name or postcode above',
              style: TextStyle(color: Colors.grey[500]),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: EdgeInsets.all(20),
      itemCount: _results.length,
      itemBuilder: (context, index) {
        return _buildResultCard(_results[index]);
      },
    );
  }

  Widget _buildResultCard(PostcodeItem result) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
            spreadRadius: 1,
            blurRadius: 10,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Color(0xFFDC143C),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    result.code.toString().padLeft(5, '0'),
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                Spacer(),
                Icon(Icons.location_on, color: Colors.grey[400], size: 20),
              ],
            ),
            SizedBox(height: 15),
            Text(
              result.areaName,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.grey[800],
              ),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.location_city, color: Colors.grey[500], size: 16),
                SizedBox(width: 8),
                Text(
                  result.postOffice,
                  style: TextStyle(color: Colors.grey[600], fontSize: 14),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _performSearch(String searchQuery) async {
    if (searchQuery.trim().isEmpty) {
      setState(() => _uiState = UiState.ready);
      return;
    }

    final parsedQuery = int.tryParse(searchQuery);
    if (parsedQuery == null) return;

    setState(() => _isLoading = true);

    final db = DB.instance.database;
    _results = await db.searchPostcode(parsedQuery.toString());
    setState(() {
      _isLoading = false;
      _uiState = _results.isNotEmpty ? UiState.haveResults : UiState.noResults;
    });
  }
}
