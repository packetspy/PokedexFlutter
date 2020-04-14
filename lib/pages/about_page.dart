import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:md2_tab_indicator/md2_tab_indicator.dart';
import 'package:pokedex/pages/widget/tabs/tabAbout.dart';
import 'package:pokedex/stores/pokedex.store.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  PageController _pageController;
  PokedexStore _pokedexStore;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _pageController = PageController(initialPage: 0);
    _pokedexStore = GetIt.instance<PokedexStore>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(30),
          child: Observer(builder: (context) {
            return TabBar(
                onTap: (index) {
                  _pageController.animateToPage(index,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut);
                },
                controller: _tabController,
                labelStyle: TextStyle(fontWeight: FontWeight.w700),
                indicatorSize: TabBarIndicatorSize.label,
                labelColor: _pokedexStore.pokemonSelectedColor,
                unselectedLabelColor: Color(0xfc3f6368),
                isScrollable: true,
                indicator: MD2Indicator(
                    indicatorHeight: 3,
                    indicatorColor: Color(0xff5f6368),
                    indicatorSize: MD2IndicatorSize.normal),
                tabs: <Widget>[
                  Tab(text: "About"),
                  Tab(text: "Evolution"),
                  Tab(text: "Status"),
                ]);
          }),
        ),
      ),
      body: PageView(
        onPageChanged: (index) {
          _tabController.animateTo(index,
              duration: Duration(milliseconds: 300));
        },
        controller: _pageController,
        children: <Widget>[
          TabAbout(),
          Container(color: Colors.green),
          Container(color: Colors.blue),
        ],
      ),
    );
  }
}
