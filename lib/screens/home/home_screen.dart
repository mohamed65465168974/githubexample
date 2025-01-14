import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:githubexample/blocs/category/category_bloc.dart';
import 'package:githubexample/widgets/widgets.dart';

import '../../blocs/product/product_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'home page'),
      bottomNavigationBar: CustomNavBar(),
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                child: BlocBuilder<CategoryBloc, CategoryState>(
                  builder: (context, state) {
                    if (state is CategoryLoading) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (state is CategoryLoaded) {
                      return CarouselSlider(
                        options: CarouselOptions(
                            aspectRatio: 2.0,
                            enlargeCenterPage: true,
                            enableInfiniteScroll: false,
                            initialPage: 2,
                            viewportFraction: 0.9,
                            enlargeStrategy: CenterPageEnlargeStrategy.height),
                        items: state.categories
                            .map((category) =>
                            HeroCarouselCard(category: category))
                            .toList(),
                      );
                    } else {
                      return Text('something went wrong');
                    }
                  },
                ),
              ),
              SectionTitle(title: 'Recommended'),
              SizedBox(
                height: 5,
              ),
              BlocBuilder<ProductBloc, ProductState>(
                builder: (context, state) {
                  if (state is ProductLoading) {
                    return Center(child: CircularProgressIndicator(),);
                  }
                  if (state is ProductLoaded) {
                    return ProductCarousel(
                      products: state.products
                          .where((product) => product.isRecommended)
                          .toList(),
                    );
                  } else {
                    return Text('something error');
                  }
                },
              ),
              SectionTitle(title: 'Most Popular'),
              SizedBox(
                height: 5,
              ),
              BlocBuilder<ProductBloc, ProductState>(
                builder: (context, state) {
                  if(state is ProductLoading){
                    return Center(child: CircularProgressIndicator(),);
                  }
                  if(state is ProductLoaded){
                    return ProductCarousel(
                      products: state.products
                          .where((product) => product.isPopular)
                          .toList(),
                    );
                  }
                  else {
                    return Text('something went wrong');
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
