import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gankglobal_challange/bloc/cocktailsearch/cocktailsearch_bloc.dart';
import 'package:gankglobal_challange/widget/cocktail_card.dart';
import 'package:gankglobal_challange/widget/cocktail_skeleton.dart';

class SearchPage extends StatefulWidget {
  final String searchText;
  SearchPage({@required this.searchText});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final ScrollController _scrollController = ScrollController();
  bool visibleTitle = false;

  @override
  void initState() {
    super.initState();

    // inizialitation bloc search
    context.bloc<CocktailsearchBloc>().add(
      CocktailSearch(
        searchText: widget.searchText
      )
    );

    // listen scroll value to change opactiy title text
    _scrollController.addListener(() {
      if(_scrollController.offset > 150) {
        setState(() {
          visibleTitle = true;
        });
      } else {
        setState(() {
          visibleTitle = false;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();

    // dispose controller
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // get device width and height size for responsive design
    final Size device = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (context, inScrolled){
          return [
            SliverAppBar(
              pinned: true,
              floating: true,
              expandedHeight: 150,
              elevation: 0.0,
              title: AnimatedOpacity(
                opacity: visibleTitle ? 1.0 : 0.0,
                duration: Duration(
                  milliseconds: 300
                ),
                child: Text('Search for "${widget.searchText}"'),
              ),
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: false,
                background: Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10
                    ),
                    child: Text(
                      'Search for\n"${widget.searchText}"',
                      style: Theme.of(context).textTheme.headline1,
                    ),
                  ),
                ),
              ),
            )
          ];
        },
        body: Container(
          child: BlocBuilder<CocktailsearchBloc, CocktailsearchState>(
            builder: (_, state) {
              if(state is CocktailsearchLoaded){
                return GridView.builder(
                  padding: EdgeInsets.only(top: 0.0),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: device.width / 400,
                  ),
                  itemCount: state.drinks.length,
                  itemBuilder: (_, i){
                    return CocktailCard(drinks: state.drinks[i]);
                  },
                ); 
              } else if (state is CocktailsearchError){
                return Center(
                  child: Text(
                    "Something Wrong :((\nSearch not Found",
                    style: Theme.of(context).textTheme.headline2,
                    textAlign: TextAlign.center,
                  ),
                );
              }

              return GridView.builder(
                padding: EdgeInsets.only(top: 0.0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.82,
                ),
                itemCount: 8,
                itemBuilder: (_, i){
                  return CocktailSkeleton();
                },
              ); 
            },
          ),
        ),
      ),
    );
  }
}