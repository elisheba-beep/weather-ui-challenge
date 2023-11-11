import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchRow extends StatelessWidget {
  const SearchRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Saved Locations',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(CupertinoIcons.search),
          color: Colors.white,
          iconSize: 32,
        )
      ],
    );
  }
}
