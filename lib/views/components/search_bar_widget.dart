import 'package:flutter/material.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({super.key, required this.onSearch});

  final Function(String) onSearch;

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  final TextEditingController _searchController = TextEditingController();
  bool _inputHaveContent = false;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {
        _inputHaveContent = _searchController.text.isNotEmpty;
      });
      widget.onSearch(_searchController.text.trim());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
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
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          hintText: 'Enter postcode (e.g., 50000)',
          prefixIcon: Icon(
            Icons.markunread_mailbox,
            color: Theme.of(context).colorScheme.primary,
          ),
          suffixIcon: Builder(builder: (context) {
            if (_inputHaveContent) {
              return IconButton(
                icon: Icon(Icons.clear,
                    color: Theme.of(context).colorScheme.primary),
                onPressed: () {
                  _searchController.clear();
                },
              );
            } else {
              return IconButton(
                icon: Icon(Icons.search,
                    color: Theme.of(context).colorScheme.primary),
                onPressed: () {
                  final searchText = _searchController.text.trim();
                  if (searchText.isNotEmpty) {
                    widget.onSearch(searchText);
                  }
                },
              );
            }
          }),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        ),
        onSubmitted: (_) => widget.onSearch(_searchController.text.trim()),
      ),
    );
  }
}
