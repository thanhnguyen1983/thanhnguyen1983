import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:humanweb/presentation/pull_to_refresh/character_list_view.dart';
import 'package:humanweb/presentation/search_grid_bloc/character_sliver_grid.dart';
import 'package:humanweb/presentation/search_snackbar/character_sliver_list.dart';
import 'package:humanweb/utilities/languageservice.dart';

class CharacterListScreen extends StatefulWidget {

  String title;
  CharacterListScreen( {Key?key,required this.title}):super(key: key);

  @override
  _CharacterListScreenState createState() => _CharacterListScreenState();
}

class _CharacterListScreenState extends State<CharacterListScreen> {
  int _selectedBottomNavigationIndex = 0;

  final List<_BottomNavigationItem> _bottomNavigationItems = [
    _BottomNavigationItem(
      label: LanguageService.ListStaff,
      iconData: Icons.refresh,
      widgetBuilder: (context) => CharacterListView(),
    ),
    _BottomNavigationItem(
      label: LanguageService.FIN_DR,
      iconData: Icons.search,
      widgetBuilder: (context) => CharacterSliverList(),
    ),
    _BottomNavigationItem(
      label: LanguageService.avata,
      iconData: Icons.grid_on,
      widgetBuilder: (context) => CharacterSliverGrid(),
    ),
  ];



  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title:  Text(widget.title),
    ),
    resizeToAvoidBottomInset: false,
    bottomNavigationBar: BottomNavigationBar(
      currentIndex: _selectedBottomNavigationIndex,
      items: _bottomNavigationItems
          .map(
            (item) => BottomNavigationBarItem(
          icon: Icon(item.iconData),
          label: item.label,
        ),
      )
          .toList(),
      onTap: (newIndex) => setState(
            () => _selectedBottomNavigationIndex = newIndex,
      ),
    ),
    body: IndexedStack(
      index: _selectedBottomNavigationIndex,
      children: _bottomNavigationItems
          .map(
            (item) => item.widgetBuilder(context),
      )
          .toList(),
    ),
  );
}

class _BottomNavigationItem {
  const _BottomNavigationItem({
    required this.label,
    required this.iconData,
    required this.widgetBuilder,
  });

  final String label;
  final IconData iconData;
  final WidgetBuilder widgetBuilder;
}
