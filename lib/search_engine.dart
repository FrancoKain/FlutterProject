import 'package:flutter/material.dart';

class SearchSection extends StatelessWidget {
  const SearchSection({
    super.key,
  });

  static const double paddingSymmetric = 20;
  static const double paddingSearchBar = 20;
  static const double borderRadiusSearchBar = 20;
  static const double searchTextSize = 25;
  static const double spaceBetweenIconSearchText = 20;

  static const String searchText = 'Search';

  static const Color searchBarColor = Color(0xff513A51);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: paddingSymmetric,
        vertical: paddingSymmetric,
      ),
      child: Container(
        padding: const EdgeInsets.all(paddingSearchBar),
        decoration: BoxDecoration(
          color: searchBarColor,
          borderRadius: BorderRadius.circular(borderRadiusSearchBar),
        ),
        child: const Row(
          children: [
            Icon(
              Icons.search,
            ),
            SizedBox(
              width: spaceBetweenIconSearchText,
            ),
            Text(
              searchText,
              style: TextStyle(
                fontSize: searchTextSize,
                color: Colors.white54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
